import 'package:flutter/material.dart';

class HoneytipDetail extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> img; // 이미지 리스트

  HoneytipDetail({
    required this.title,
    required this.subtitle,
    required this.img,
  });

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
          mainAxisSize: MainAxisSize.min, // Row의 크기를 최소로 설정
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
                SizedBox(width: 8), // 아이콘과 텍스트 사이 간격
                Text(
                  title,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: Color(0xFF171C1F)),
            ),
            SizedBox(height: 16),

            // 이미지 섹션
            if (img.isNotEmpty)
              _buildImageSection(img),

            SizedBox(height: 16),

            // 댓글 섹션
            Text(
              'Comments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[400],
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text('Name'),
                  subtitle: Text('Comments'),
                  trailing: Text('etc'),
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
      // 이미지가 1개일 때
      return Image.asset(
        images[0],
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      );
    } else if (images.length == 2) {
      // 이미지가 2개일 때
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
      // 이미지가 3개일 때
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
      // 이미지가 4개 이상일 때 그리드로 표시
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


