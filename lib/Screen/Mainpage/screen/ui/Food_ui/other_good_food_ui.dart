import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/component/appbar.dart';

class OtherFoodUI extends StatelessWidget {
  const OtherFoodUI({super.key});

  @override
  Widget build(BuildContext context) {
    String ImageURL_AppBar = 'assets/images/icon/gachon_logo.png';
    return Scaffold(
      // 첫번째 페이지까지 이전 페이지로 이동
      appBar: CustomAppBar(),
      // OtherFoodUI
      body: Container(
        child: Text(
          'OtherFoodUI',
        ),
      ),
    );
  }
}
