import 'package:flutter/material.dart';
import 'package:kksc_app_fe/Component/LabelCard.dart';

void main() {
  runApp(HoneytipApp()); // 'Honeytip' 대신 'HoneytipApp'으로 변경
}

class HoneytipApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gachon University Tips',
      home: HoneytipScreen(),
    );
  }
}
class HoneytipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 첫 번째 섹션
            Padding(
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
                  SizedBox(height: 16),
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
                        SizedBox(width: 16),
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
            Divider(color: Colors.grey), // 섹션 구분선 추가
            // 두 번째 섹션
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 25,
                    ),
                    title: Text(
                      'Exclusive Insider Tips',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Secret shortcuts revealed',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    '새내기들을 위한 팁',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Image.asset(
                      'assets/img/school.png',
                      width: 32,
                      height: 32,
                    ),
                    title: Text('학교 길안내',
                      style: TextStyle(fontSize: 14),
                    ),
                    subtitle: Text(
                      '복정동 가는 지름길',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    leading: Image.asset(
                      'assets/img/bulb.png',
                      width: 32,
                      height: 32,
                    ),
                    title: Text('공부 팁',
                      style: TextStyle(fontSize: 14),
                    ),
                    subtitle: Text(
                      '학교에서 공부하기 좋은 곳',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Divider(color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
