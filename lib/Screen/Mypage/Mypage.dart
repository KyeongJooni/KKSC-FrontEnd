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
      backgroundColor: Colors.white, // 바탕화면 색깔 설정
      appBar: AppBar(
        backgroundColor: const Color(0xFF4285F4), // 상단 바 색상
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/gachon_logo.jpg', fit: BoxFit.contain), // 로고 추가
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // 메뉴 버튼 동작
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 로고 아래 "My Page" 칸 추가
          Container(
            color: const Color(0xFFF8F9FA), // 부드러운 회색 배경으로 구분
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Row(
              children: const [
                Icon(Icons.arrow_back, color: Colors.black), // 뒤로가기 아이콘
                SizedBox(width: 8),
                Text(
                  "My Page",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // 구분을 위한 얇은 선 추가 (투명도 부여)
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // 학생증 보기 기능
                        },
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                        ),
                        child: const Text('학생증 보기'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // 로그아웃 기능
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4285F4),
                        ),
                        child: const Text('로그아웃'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Quick Actions',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.camera_alt, color: Colors.blue),
                    title: const Text('프로필 사진 변경'),
                    trailing: const Icon(Icons.emoji_emotions, color: Colors.amber),
                    onTap: () {
                      // 프로필 사진 변경 기능
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.edit, color: Colors.blue),
                    title: const Text('회원정보 수정'),
                    trailing: const Icon(Icons.emoji_emotions, color: Colors.amber),
                    onTap: () {
                      // 회원정보 수정 기능
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.lock, color: Colors.blue),
                            onPressed: () {
                              // 아이디 변경 기능
                            },
                          ),
                          const Text('아이디 변경'),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              // 정보 수정 기능
                            },
                          ),
                          const Text('Edit Information'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF4285F4), // 상단 바와 동일한 색상 설정
        selectedItemColor: Colors.white, // 선택된 아이템 색상
        unselectedItemColor: Colors.white70, // 선택되지 않은 아이템 색상
        currentIndex: 3,
        type: BottomNavigationBarType.fixed, // 아이템 간 고정된 간격 유지
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Ideas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Page',
          ),
        ],
      ),
    );
  }
}
