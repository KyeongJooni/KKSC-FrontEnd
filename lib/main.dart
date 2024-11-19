import 'package:flutter/material.dart';
import 'package:kksc_app_fe/Honeytip/Honeytip.dart';
import 'package:kksc_app_fe/Modules/BottomNavbar.dart';
import 'package:kksc_app_fe/Mypage/Mypage.dart';
import 'package:kksc_app_fe/Notice/Notice.dart';
import 'package:kksc_app_fe/Restaurant/Restaurant.dart';
import 'package:kksc_app_fe/Timetable/Timetable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: GCG_Bottomnavbar(),
    );
  }
}
