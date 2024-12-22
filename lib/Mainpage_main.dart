// 기본 라이브러리
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

// component
// Appbar
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/Appbar/CustomTopAppbar.dart';
// CommonColumnField
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnFieldAlarmpage.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnFieldBasic.dart';
// LabelCard
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/LabelCard/LabelCardMainpage.dart';
// ReviewCard
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/ReviewCard/ReviewCardMainpage.dart';

// HoneyTip - 신입생 팁 관련 화면 이동 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Honeytip/Honeytip.dart';

// Mainpage
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/AlarmPage.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/Mainpage.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/freshman_tip.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/timetable_tip.dart';

// Mypage
// Siguuppage

// Notice

// Restaurant - 음식 관련 화면 이동 dart + 음식 관련 리뷰 조회 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Restaurant/Restaurant.dart';

// Timetable

// util - 변수 및 폰트 지정 위한 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_model.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_services.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/color_theme.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/cosnt_value.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/text_styles.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //오른쪽 위 debugBanner 없애기
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // BottomNavigationBar 구현 코드
  /*
  int currentIndex = 0;
  // final screens와 함께 쓰며 기본 화면을 MyHomePageUI로 가도록 함

  final screens = [
    //이게 하나하나의 화면이되고, Text등을 사용하거나, dart파일에 있는 class를 넣는다.
    MyHomePageUI(), // 1번째 꺼 - 근데 이거 쇼부 보긴 해야함
    BoardMain(), // 1번째 꺼
    // 2번째 꺼
    // 3번째 꺼
    MyPage(), // 4번재 꺼
  ];
  */

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // MaterialTheme theme = MaterialTheme(textTheme);

    // 텍스트 테마 및 컬러 테마를 불러옴
    final colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);

    return Scaffold(
      // 가천대 로고 지정 + 클릭 시 첫번째 페이지까지 이전 페이지로 이동
      // 따로 위젯으로 구현해서 어느 페이지나 접근 가능하게 함
      appBar: GCG_CustomTopAppbar(
        backgroundColor: Color(0xff033DFE),
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
      // 왼쪽 위 세줄 있는거
      /*
      drawer: Drawer(
        // ListView 써서
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader에 있는거에서 유저 등록 이미지 + 계정 확인하게 할 예정 (아이디 + 이름만)

            // ImageURL 변수 사용
            UserAccountsDrawerHeader(
              // 프로필 사진 이미지에 관한 원 (ImageURL)
              // 이미지에 관한 데이터 받은 후 쓸 예정
                currentAccountPicture: CircleAvatar(
                  // 로고 이미지는 변수로 전환 후 유동적으로 전환 가능하게 함
                  backgroundImage: AssetImage(
                    ImageURL,
                  ),
                ),

                // Id
                accountName: Text(
                  Id,
                  style: textTheme.titleLarge?.copyWith( // bodyMedium 스타일을 기반으로 수정
                    color: colorTheme.scrim, // 색상 변경
                  ),
                ),
                // 계정 확인하게 하는 부분 중 Id (이름) -> 유동적으로 변함

                // Email
                accountEmail: Text(
                  Email,
                  style: textTheme.titleLarge?.copyWith( // bodyMedium 스타일을 기반으로 수정
                    color: colorTheme.scrim, // 색상 변경
                  ),
                ),
                // 계정 확인하게 하는 부분 중 Email (이메일) -> 유동적으로 변함

            ),
            // 언어는 원래 여기있어야 하는데, main_ui로 분리해둠

            // 버전
            InkWell(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.add_ic_call_outlined,
                    color: colorTheme.scrim,
                  ),
                ),
                title: Text(
                  "Version",
                  style: textTheme.titleLarge?.copyWith( // bodyMedium 스타일을 기반으로 수정
                    color: colorTheme.scrim, // 색상 변경
                  ),
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    // 위에 Version (TextStyle6)
                    title: Text(
                      "Version",
                      style: textTheme.titleLarge?.copyWith( // bodyMedium 스타일을 기반으로 수정
                        color: colorTheme.scrim, // 색상 변경
                      ),
                    ),
                    // Version : 1.0.0 (TextStyle5)
                    content: Text(
                      Version,
                      style: textTheme.titleLarge?.copyWith( // bodyMedium 스타일을 기반으로 수정
                        color: colorTheme.scrim, // 색상 변경
                      ),
                    ),
                    // 버전 텍스트 유동적 변경 가능
                    actions: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        // 확인 버튼 클릭하면 AlertDialog 없어짐
                        // Check (TextStyle4)
                        child: Text(
                          "Check",
                          style: textTheme.titleLarge?.copyWith( // bodyMedium 스타일을 기반으로 수정
                            color: colorTheme.scrim, // 색상 변경
                          ),
                        ),
                        // 확인 메시지
                      )
                    ],
                  ),
                  // 버전 확인용 다이얼로그
                );
              },
            ),
          ],
        ),
      ),
      */

      body: MainpageScreen(),

      // main_ui.dart의 class로 이동
      /*
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        //
        iconSize: 32,
        selectedItemColor: Color(0xFF674AEF),
        selectedFontSize: 18,
        unselectedItemColor: Colors.grey,

        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          // 홈
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          // (BoardMain)
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'BoardMain'
          ),
          // 선배들의 꿀팁 (Senior)
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Senior'
          ),
          // 식당 (Restaurant)
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Restaurant'
          ),
          // (MyPage)
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'MyPage'
          ),
        ],
      ),
      */
    );
  }
}