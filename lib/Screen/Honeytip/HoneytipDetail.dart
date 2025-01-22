import 'package:flutter/material.dart';

class HoneytipDetail extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<String> img; // 이미지 리스트

  HoneytipDetail({
    required this.title,
    required this.subtitle,
    required this.img,
  });

  @override
  _HoneytipDetailState createState() => _HoneytipDetailState();
}

class _HoneytipDetailState extends State<HoneytipDetail> {
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [];

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        _comments.add(_commentController.text);
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '꿀팁',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle),
                SizedBox(width: 8),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              widget.subtitle,
              style: TextStyle(fontSize: 12, color: Color(0xFF171C1F)),
            ),
            SizedBox(height: 16),

            // 이미지 섹션
            if (widget.img.isNotEmpty) _buildImageSection(widget.img),
            SizedBox(height: 16),

            // 댓글 입력창
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Comments',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: _addComment,
                  icon: Icon(Icons.send),
                ),
              ],
            ),
            SizedBox(width: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[400],
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              _comments[index],
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'etc',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),


          ],
        ),
      ),
    );
  }

  // 이미지 섹션을 위한 위젯
  Widget _buildImageSection(List<String> images) {
    if (images.length == 1) {
      return Image.asset(
        images[0],
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      );
    } else if (images.length == 2) {
      return Row(
        children: images.map((image) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                image,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      );
    } else if (images.length == 3) {
      return Column(
        children: [
          Row(
            children: images.take(2).map((image) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    image,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              images[2],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
    } else {
      return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: images.map((image) {
          return Image.asset(
            image,
            fit: BoxFit.cover,
          );
        }).toList(),
      );
    }
  }
}
