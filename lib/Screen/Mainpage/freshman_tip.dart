import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/TopAppbar.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/main_ui.dart';

class FreshmanTipUI extends StatelessWidget {
  const FreshmanTipUI({super.key});

  @override
  Widget build(BuildContext context) {
    String ImageURL_AppBar = 'assets/images/icon/gachon_logo.png';
    return Scaffold(
      // 첫번째 페이지까지 이전 페이지로 이동
      // MyHomePageUI() 오류 안나나 잘 체크해보기
      appBar: GCG_TopAppbar(
        // backgroundColor: colorTheme.surfaceContainer,
        onLogoPressed: () {
          Navigator.popUntil(
            context,
                (route) => route.isFirst, // 스택의 첫 번째 화면으로 돌아감
          );
          /*
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePageUI()),
          );
          */
        },
      ),
      // FreshmanTipUI
      body: Container(
        child: Text(
          'FreshmanTipUI',
        ),
      ),
    );
  }
}
