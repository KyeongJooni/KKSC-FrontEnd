import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gachon Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPageScreen(),
    );
  }
}

class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4285F4),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/gachon_logo.jpg', fit: BoxFit.contain),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // My Page 영역 추가
            Container(
              width: double.infinity, // 전체 너비
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // 내부 여백
              decoration: BoxDecoration(
                color: Colors.white, // 배경색
                border: Border.all(color: Colors.grey.shade300, width: 1), // 얇은 테두리 추가
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // 미세한 그림자
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 2), // 그림자 위치
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.black), // 뒤로가기 아이콘
                  SizedBox(width: 8),
                  Text(
                    'My Page',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // 글자 색상
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Student Name 영역
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, size: 40, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Student Name',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Student ID: 12345', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(color: Colors.blue),
                    ),
                    child: const Text('학생증 보기', style: TextStyle(color: Colors.blue)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4285F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('로그아웃', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt, color: Colors.blue),
                  title: const Text('프로필 사진 변경'),
                  trailing: const Icon(Icons.emoji_emotions_outlined, color: Colors.amber),
                  onTap: () {},
                ),
                Divider(
                  thickness: 1,
                  height: 0,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  leading: const Icon(Icons.sync, color: Colors.blue),
                  title: const Text('회원정보 수정'),
                  trailing: const Icon(Icons.emoji_emotions_outlined, color: Colors.amber),
                  onTap: () {},
                ),
                Divider(
                  thickness: 1,
                  height: 0,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.lock, size: 40, color: Colors.blue),
                      SizedBox(height: 8),
                      Text('아이디 변경', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.edit, size: 40, color: Colors.blue),
                      SizedBox(height: 8),
                      Text('Edit Information', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF4285F4),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: 'Ideas'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Food'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Page'),
        ],
      ),
    );
  }
}
