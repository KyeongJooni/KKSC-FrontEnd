import 'package:flutter/material.dart';

class HoneytipDetail extends StatelessWidget {
  final String title;
  final String subtitle;

  HoneytipDetail({required this.title, required this.subtitle});

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
        title: Text(
          '꿀팁',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 제목 섹션
            Text(
              title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),

            // 이미지 그리드 섹션
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(4, (index) {
                return Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: Text(
                      '이미지',
                      style: TextStyle(color: Colors.black45, fontSize: 16),
                    ),
                  ),
                );
              }),
            ),
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
              itemCount: 5,
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
}
