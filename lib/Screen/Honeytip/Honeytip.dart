import 'package:flutter/material.dart';
import 'package:kksc_app_fe/Component/LabelCard.dart';

class Honeytip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("가천대학교"),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '선배들의 꿀팁',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                '편의 시설',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16), // 텍스트와 Row 사이 간격
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: LabelCard(
                        label: "Study",
                        name: "Library Access Pass",
                        text: "인원 24/7",
                      ),
                    ),
                    SizedBox(width: 16), // 카드 간 간격
                    SizedBox(
                      width: 200,
                      child: LabelCard(
                        label: "Food",
                        name: "Cafeteria",
                        text: "메뉴 매일 업데이트",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
