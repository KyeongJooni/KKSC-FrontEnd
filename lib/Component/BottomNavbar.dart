import 'package:flutter/material.dart';

class GCG_Bottomnavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const GCG_Bottomnavbar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
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
          icon: Icon(Icons.notifications),
          label: '공지',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant),
          label: '식당',
        ),
      ],
      currentIndex: selectedIndex == -1 ? 0 : selectedIndex, // 선택되지 않은 상태(-1) 처리
      onTap: onItemTapped,
    );
  }
}
