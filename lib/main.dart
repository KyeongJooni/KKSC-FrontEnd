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
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);
    MaterialTheme theme = MaterialTheme(textTheme);


    return MaterialApp(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: MyPageScreen(),
    );
  }
}




