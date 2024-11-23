import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project_kksc_gachon_gil_project_error_complete/ui/main_ui/main_ui.dart';
// import 'package:project_kksc_gachon_gil_project_error_complete/ui/my_page/mypage.dart';
// import 'package:project_kksc_gachon_gil_project_error_complete/ui/notice_board/board_page.dart';

import 'package:project_kksc_gachon_gil_project_error_complete/utils/variable.dart';
// 변동 가능성 존재!!

void main() {
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

  String Id = '김한성'; // 구현되면 매개변수로 받아야할듯
  String Email = 'gkstjd6097@gmail.com';
  String ImageURL = 'assets/images/icon/kksc_logo.jpg';

  String ImageURL_AppBar = 'assets/images/icon/gachon_logo.png';

  // 변수는 variable.dart에 있음

  @override
  Widget build(BuildContext context) {
    String VersionInnerText = '1.0.0';
    String Version = 'Version: $VersionInnerText';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0, // 뭐하는거지
        // Incorrect use of ParentDataWidget.이라는 오류 여기서 나는거임
        // 주석 추가하기
        title: Expanded(
          child: TextButton(
            onPressed: () {
              print("click");
              Navigator.popUntil(
                  context, (route) => route.isFirst
              ); // 첫번째 페이지까지 이전 페이지로 이동
            },
            child: Image(
              image: AssetImage(ImageURL_AppBar),
              // 원랜 가천대 로고여야 함
              // 사이즈 안맞아서 변수로 바꾼 다음 이미지 링크도 전환 예정
              width: 100,
              // 무한대 값을 나타냄.
              // 이를 사용하면 특정 상황에서 제한 없는 크기나 값이 필요할 때 활용
              height: 100,
              // fit: BoxFit.cover,
              // 이미지 또는 위젯을 컨테이너에 비율을 유지한 채로 잘 맞게 채우도록 조정할 때 사용하는 BoxFit 열거형 값
            ),
          ),
        ),
      ),

      // 왼쪽 위 세줄 있는거
      drawer: Drawer(
        // ListView 써서
        child: ListView(
          padding: EdgeInsets.zero,
          // EdgeInsets.zero ：
          children: <Widget>[
            // DrawerHeader에 있는거에서 유저 등록 이미지 + 계정 확인하게 할 예정 (아이디 + 이름만)
            UserAccountsDrawerHeader(
              // 프로필 사진 이미지에 관한 원
              // 이미지에 관한 데이터 받은 후 쓸 예정
                currentAccountPicture: CircleAvatar(
                  // 로고 이미지는 변수로 전환 후 유동적으로 전환 가능하게 함
                  backgroundImage: AssetImage(
                    ImageURL,
                  ),
                ),
                /*
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/kksc_logo.jpg',
                    ),
                  ),
                ],
                */
                accountName: Text(
                    Id
                ),
                // 계정 확인하게 하는 부분 중 Id (이름) -> 유동적으로 변함
                accountEmail: Text(
                    Email,
                ),
                // 계정 확인하게 하는 부분 중 Email (이메일) -> 유동적으로 변함
                /*
                decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius:
                ),
                */

            ),
            // 언어는 원래 여기있어야 하는데, ｍａｉｎ—ｕｉ로 분리해둠

            // 버전
            ListTile(
              leading: Icon(
                Icons.stay_current_portrait,
                color: Colors.grey[850],
              ),
              title: Text(
                'Version',
              ),
              onTap: () {
                print("Version is clicked");
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        "Version",
                      ),
                      content: Text(
                        Version,
                      ),
                      // 버전 텍스트 유동적 변경 가능
                      actions: [
                        ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            // 확인 버튼 클릭하면 AlertDialog 없어짐
                            child: Text(
                              "Check",
                            ),
                            // 확인 메시지
                        )
                      ],
                    ),
                  // 버전 확인용 다이얼로그
                );
              },
              // trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),

      body: MyHomePageUI(),
      // ｍａｉｎ—ｕｉ로 변경하면 되려나¿
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
