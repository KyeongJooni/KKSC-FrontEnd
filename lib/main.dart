import 'package:flutter/material.dart';
import 'package:kksc_app_fe/Component/BottomNavbar.dart';
import 'package:kksc_app_fe/Component/TopAppbar.dart'; // 상단바 컴포넌트
import 'package:kksc_app_fe/Screen/Mainpage/Mainpage.dart'; // MainPageScreen import
import 'package:kksc_app_fe/Screen/Mypage/Mypage.dart';
import 'package:kksc_app_fe/Screen/Timetable/Timetable.dart';
import 'package:kksc_app_fe/Screen/Honeytip/Honeytip.dart';
import 'package:kksc_app_fe/Screen/Notice/Notice.dart';
import 'package:kksc_app_fe/Screen/Restaurant/Restaurant.dart';
import 'package:kksc_app_fe/util/color_theme.dart';
import 'package:kksc_app_fe/util/cosnt_value.dart';
import 'package:kksc_app_fe/util/text_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: IndexScreen(),
    );
  }
}


class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int? _selectedIndex; // 초기값 null로 설정 (선택되지 않은 상태)

  final List<Widget> _pages = [
    TimetableScreen(),
    HoneytipScreen(),
    NoticeScreen(),
    RestaurantScreen(),
  ];

  // 가천대 로고 클릭 시 초기화 동작
  void _onLogoPressed() {
    setState(() {
      _selectedIndex = null; // 선택되지 않은 상태로 초기화
    });
  }

  // 하단 네비게이션 아이템 선택 시 동작
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GCG_TopAppbar(
        onLogoPressed: _onLogoPressed, // 로고 클릭 시 호출
      ),
      body: _selectedIndex == null
          ? MainpageScreen() // 선택되지 않은 상태에서는 MainPageScreen 표시
          : _pages[_selectedIndex!], // 선택된 상태일 때 해당 페이지 표시
      bottomNavigationBar: GCG_Bottomnavbar(
        selectedIndex: _selectedIndex ?? -1, // 선택되지 않은 상태(-1)를 전달
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

