import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'Honeytip.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TipCreationScreen(),
    );
  }
}

class TipCreationScreen extends StatefulWidget {
  @override
  _TipCreationScreenState createState() => _TipCreationScreenState();
}

class _TipCreationScreenState extends State<TipCreationScreen> {
  String tipTitle = "";
  List<String> tags = [];
  bool isTagInputVisible = false;
  final TextEditingController _tagController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<MediaItem> mediaItems = [];
  List<File> attachedFiles = [];

  void _addTag() {
    if (_tagController.text.isNotEmpty) {
      setState(() {
        tags.add(_tagController.text);
        _tagController.clear();
        isTagInputVisible = false;
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        mediaItems.add(MediaItem.image(File(image.path)));
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      setState(() {
        mediaItems.addAll(
            selectedImages.map((image) => MediaItem.image(File(image.path))));
      });
    }
  }

  Future<void> _recordVideo() async {
    final XFile? recordedVideo = await _picker.pickVideo(source: ImageSource.camera);
    if (recordedVideo != null) {
      final File videoFile = File(recordedVideo.path);
      final VideoPlayerController controller = VideoPlayerController.file(videoFile)
        ..initialize().then((_) {
          setState(() {});
        });

      setState(() {
        mediaItems.add(MediaItem.video(videoFile, controller));
      });
    }
  }

  Future<void> _attachFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result != null) {
      setState(() {
        attachedFiles.addAll(result.files.map((file) => File(file.path!)));
      });
    }
  }

  void _deleteMedia(int index) {
    setState(() {
      final item = mediaItems[index];
      if (item.type == MediaType.video) {
        item.videoController?.dispose();
      }
      mediaItems.removeAt(index);
    });
  }

  void _deleteFile(int index) {
    setState(() {
      attachedFiles.removeAt(index);
    });
  }

  @override
  void dispose() {
    for (final item in mediaItems) {
      item.videoController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HoneytipApp(),
              ),
            );
            // 닫기 동작
          },
        ),
        title: Text(
          "꿀팁 작성",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, color: Colors.blue),
            onPressed: () {
              print("꿀팁 제목: $tipTitle");
              print("태그 목록: $tags");
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  tipTitle = value;
                });
              },
              decoration: InputDecoration(
                hintText: "꿀팁 제목 작성",
                prefixIcon: Icon(Icons.person, color: Colors.black54),
                border: InputBorder.none,
              ),
            ),
          ),
          if (mediaItems.isNotEmpty || attachedFiles.isNotEmpty || tags.isNotEmpty)
            Expanded(
              child: ListView(
                children: [
                  if (mediaItems.isNotEmpty)
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mediaItems.length,
                        itemBuilder: (context, index) {
                          final item = mediaItems[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                if (item.type == MediaType.image)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      item.file!,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                if (item.type == MediaType.video)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      width: 150,
                                      height: 150,
                                      color: Colors.black12,
                                      child: item.videoController != null &&
                                          item.videoController!.value.isInitialized
                                          ? VideoPlayer(item.videoController!)
                                          : Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.red),
                                  onPressed: () {
                                    _deleteMedia(index);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  if (attachedFiles.isNotEmpty)
                    Column(
                      children: attachedFiles.asMap().entries.map((entry) {
                        final index = entry.key;
                        final file = entry.value;
                        return ListTile(
                          leading: Icon(Icons.attach_file),
                          title: Text(
                            file.path.split('/').last,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.close, color: Colors.red),
                            onPressed: () {
                              _deleteFile(index);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  if (tags.isNotEmpty)
                    Column(
                      children: tags.map((tag) {
                        return ListTile(
                          leading: Icon(Icons.tag, color: Colors.blue),
                          title: Text(tag),
                          trailing: IconButton(
                            icon: Icon(Icons.close, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                tags.remove(tag);
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
          if (isTagInputVisible)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _tagController,
                      decoration: InputDecoration(
                        hintText: "태그 입력",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _addTag,
                    child: Text("추가"),
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[100],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildOption(Icons.photo_library, "사진 추가", onTap: _pickImageFromGallery),
            _buildOption(Icons.camera_alt, "사진 촬영", onTap: _pickImageFromCamera),
            _buildOption(Icons.videocam, "비디오 촬영", onTap: _recordVideo),
            _buildOption(Icons.attach_file, "파일 첨부", onTap: _attachFile),
            _buildOption(Icons.tag, "태그 작성", onTap: () {
              setState(() {
                isTagInputVisible = true;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: onTap ?? () {},
    );
  }
}

class MediaItem {
  final MediaType type;
  final File? file;
  final VideoPlayerController? videoController;

  MediaItem.image(this.file)
      : type = MediaType.image,
        videoController = null;

  MediaItem.video(this.file, this.videoController) : type = MediaType.video;
}

enum MediaType { image, video }
