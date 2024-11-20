import 'package:flutter/material.dart';
import 'package:kksc_app_fe/Screen/Honeytip/Honeytip.dart';
import 'package:kksc_app_fe/Component/BottomNavbar.dart';
import 'package:kksc_app_fe/Screen/Mypage/Mypage.dart';
import 'package:kksc_app_fe/Screen/Notice/Notice.dart';
import 'package:kksc_app_fe/Screen/Restaurant/Restaurant.dart';
import 'package:kksc_app_fe/Screen/Timetable/Timetable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Honeytip(),


    );
  }
}
