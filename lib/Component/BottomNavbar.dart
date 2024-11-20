import 'package:flutter/material.dart';

class GCG_Bottomnavbar extends StatefulWidget {
  @override
  _BottomnavbarState createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<GCG_Bottomnavbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('하단 네비게이션 바'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          '선택된 페이지: ${_selectedIndex + 1}',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 아이템이 많을 때 고정
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '시간표',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: '꿀팁',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: '식당',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내 정보',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}