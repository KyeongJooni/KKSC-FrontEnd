import 'package:flutter/material.dart';

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
  final TextEditingController _tagController = TextEditingController(); // 태그 입력 컨트롤러

  void _addTag() {
    // 태그 추가
    if (_tagController.text.isNotEmpty) {
      setState(() {
        tags.add(_tagController.text);
        _tagController.clear();
        isTagInputVisible = false;
      });
    }
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
              // 저장 동작
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
          if (tipTitle.isNotEmpty || tags.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (tipTitle.isNotEmpty)
                    Text(
                      tipTitle,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  if (tags.isNotEmpty)
                    Wrap(
                      spacing: 8.0,
                      children: tags.map((tag) {
                        return Chip(
                          label: Text("#$tag"),
                          deleteIcon: Icon(Icons.close, size: 16),
                          onDeleted: () {
                            setState(() {
                              tags.remove(tag);
                            });
                          },
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
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "태그 작성",
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (value) {
                        _addTag();
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.blue),
                    onPressed: _addTag,
                  ),
                ],
              ),
            ),
          Expanded(child: Container()),
          Container(
            color: Colors.grey[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildOption(Icons.photo_library, "사진 추가"),
                _buildOption(Icons.camera_alt, "사진 촬영"),
                _buildOption(Icons.videocam, "비디오 촬영"),
                _buildOption(Icons.attach_file, "파일 첨부"),
                _buildOption(Icons.tag, "태그 작성", onTap: () {
                  setState(() {
                    isTagInputVisible = true;
                  });
                }),
              ],
            ),
          ),
        ],
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
