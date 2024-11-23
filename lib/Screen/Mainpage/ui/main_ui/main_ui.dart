import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_kksc_gachon_gil_project_error_complete/ui/Food_ui/food_ration_ui.dart';
import 'package:project_kksc_gachon_gil_project_error_complete/ui/Food_ui/good_food_ui.dart';
import 'package:project_kksc_gachon_gil_project_error_complete/ui/Food_ui/other_good_food_ui.dart';
import 'package:project_kksc_gachon_gil_project_error_complete/ui/Tip_ui/freshman_tip.dart';
import 'package:project_kksc_gachon_gil_project_error_complete/ui/Tip_ui/timetable_tip.dart';
import 'package:project_kksc_gachon_gil_project_error_complete/ui/soon_use_ui/main_food.dart';
import 'package:project_kksc_gachon_gil_project_error_complete/ui/main_ui/foodinformation.dart';

import 'package:project_kksc_gachon_gil_project_error_complete/utils/variable.dart';
// 변동 가능성 존재!!

// import 'dart:html';
// import 'dart:math';

void main() {
  runApp(
    ProviderScope(
          child: MyHomePageUI(),
      ),
    // ProviderScope는 제거할 예정
  );

}

class MyHomePageUI extends StatefulWidget {
  const MyHomePageUI({super.key});

  @override
  State<MyHomePageUI> createState() => _MyHomePageUIState();
}

class _MyHomePageUIState extends State<MyHomePageUI> {

  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );
  // 제거 예정

  // 메인 화면 (TitleText0) + 재학생의 꿀팁 위젯으로 넘어가는 부분 (TitleText1, iconStudent)
  Widget _partMain(String TitleText0, String TitleText1, String iconStudent) {
    // 메인 화면 (TitleText0)
    return Column(
      children: [
        SizedBox(
          width: 20,
          height: 10,
        ),

        // 메인 화면 (TitleText0)
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              // 메인 화면 (TitleText0)
              Text(
                TitleText0,
                // 폰트 위한 스타일 다시 지정 예정
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),

        // 재학생의 꿀팁 (TitleText1, iconStudent)
        _imformation(TitleText1, iconStudent),
      ],
    );
  }

  // 재학생의 꿀팁 (TitleText1, iconStudent)
  Widget _imformation(String TitleText1, String iconStudent) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 재학생의 꿀팁 텍스트 부문 왼족 아이콘 사진 (iconStudent)
              Container(
                width: 50,
                height: 50,
                child: Image.asset(
                  iconStudent,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              // 재학생의 꿀팁 텍스트 부문 (TitleText1)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TitleText1,
                    // 폰트 위한 스타일 다시 지정 예정
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _partFreshman(String TitleText3, String SubTitleText0, String SubTitleText1, String iconBell) {
    return InkWell(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
            child: Row(
              children: [
                // 왼쪽 아이콘 (iconBell)
                Container(
                  height: 60,
                  width: 60,
                  /*
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  */
                  // 왼쪽 아이콘 (iconBell)
                  child: Image.asset(
                    iconBell,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),

                // 첫 학기 계획 세우기 (TitleText3)
                // 신입생 (SubTitleText0)
                // 신입생들을 위한 조언과 팁 (SubTitleText1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TitleText3,
                      // 폰트 위한 스타일 다시 지정 예정
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // 신입생 (SubTitleText0)
                    Container(
                      width: 100.0,
                      height: 30.0,
                      // 신입생 (SubTitleText0) + 텍스트 스타일 (폰트) 지정하기
                      child: Center(
                        child: Text(
                            SubTitleText0,
                        ),
                      ),
                      // 스타일 따로 지정 예정
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                            color: Colors.white,
                            width: 2.0
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // 신입생들을 위한 조언과 팁 (SubTitleText1)
                    Container(
                      child: Text(
                        SubTitleText1,
                        // 텍스트 스타일 (폰트) 따로 지정 예정
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                    color: Colors.grey[40],
                    thickness: 1.0
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
          ),
        ],
      ),
      // freshman_tip.dart로 넘어감 -> 추후 새로 구현 예정
      onTap: () {
        print("_partFreshman");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FreshmanTipUI(),
          ),
        );
      },
    );
  }

  Widget _partTimetable(String TitleText4, String SubTitleText2, String SubTitleText3, String iconMegaphone) {
    return InkWell(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
            child: Row(
              children: [
                // 왼쪽 아이콘 (iconMegaphone)
                Container(
                  height: 60,
                  width: 60,
                  /*
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  */
                  // 왼쪽 아이콘 (iconBell)
                  child: Image.asset(
                    iconMegaphone,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TitleText4,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 100.0,
                      height: 30.0,
                      child: Center(
                        child: Text(
                           SubTitleText2,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                            color: Colors.white,
                            width: 2.0
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      SubTitleText3,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
          ),
        ],
      ),
      // timetable_tip.dart로 넘어감 -> 추후 새로 구현 예정
      onTap: () {
        print("_partTimetable");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TimeTableTipUI(),
          )
        );
      },
    );
  }

  Widget _partFoodplace(String TitleText6, String SubTitleText4, String iconPin) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          child: Image.asset(
              iconPin,
          ),
          /*
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          */
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TitleText6,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              SubTitleText4,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10
              ),
            ),
          ],
        ),
        Divider(
            color: Colors.grey[40],
            thickness: 1.0
        ),
      ],
    );
  }

  Widget _partOtherFoodPlace(String TitleText7, String SubTitleText5, String iconPizza) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          /*
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          */
          child: Image.asset(
            iconPizza,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TitleText7,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              SubTitleText5,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10
              ),
            ),
          ],
        ),
        Divider(
            color: Colors.grey[40],
            thickness: 1.0
        ),
      ],
    );
  }

  // Declare the ScrollController
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    // Dispose the ScrollController when the widget is disposed
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 구현하기!!
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    // 상단 Language
                    title: Text(
                      "Language",
                    ),
                    // 언어 선택 유도 메시지
                    content: Text(
                        "Choose Language",
                    ),
                    actions: [
                      // 한 -> 영 버튼
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            for (int i = 0; i < 9; i++) {
                              TitleText[i] = TitleTextEng[i];

                            }
                            for (int i = 0; i < 8; i++) {
                              SubTitleText[i] = SubTitleTextEng[i];
                            }
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('English'),
                      ),

                      // 영 -> 한 버튼
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            for (int i = 0; i < 9; i++) {
                              TitleText[i] = TitleTextKor[i];
                            }
                            for (int i = 0; i < 8; i++) {
                              SubTitleText[i] = SubTitleTextKor[i];
                            }
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('Korean'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("Change Language"),
          ),

          // 메인 화면 (TitleText[0])
          // 재학생의 꿀팁 (TitleText[1], iconStudent)
          _partMain(TitleText[0], TitleText[1], iconStudent),

          // 가천대 학생들을 위한 꿀팁 (TitleText[2])
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  TitleText[2],
                  // 폰트 위해 텍스트 스타일 전환 예정
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),

          // 왼쪽 아이콘 (iconBell)
          // 첫 학기 계획 세우기 (TitleText[3])
          // 신입생 (SubTitleText[0])
          // 신입생들을 위한 조언과 팁 (SubTitleText[1])
          _partFreshman(TitleText[3], SubTitleText[0], SubTitleText[1], iconBell),
          Divider(
              color: Colors.grey[40],
              thickness: 1.0
          ),

          // 왼쪽 아이콘 (iconMegaphone)
          // 시간표 짜기 꿀팁 (TitleText[4])
          // 시간표 (SubTitleText[2])
          // 시간표 짜는 방법 소개 (SubTitleText[3])
          _partTimetable(TitleText[4], SubTitleText[2], SubTitleText[3], iconMegaphone),
          Divider(
              color: Colors.grey[40],
              thickness: 1.0
          ),
          SizedBox(
            height: 70,
            width: 70,
          ),

          // 학교 근처 맛집 (TitleText[5])
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  TitleText[5],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),

          // 맛집 이름
          // 평점 4.5
          // End
          InkWell(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _partFoodplace(TitleText[6], SubTitleText[4], iconPin),
                  // 리뷰 100개 부분
                  Text(
                      SubTitleText[6],
                      textAlign: TextAlign.end
                  ),
                ],
              ),
            ),
            onTap: () {
              print("_partFoodplace");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodUI(),
                ),
              );
            },
          ),
          Divider(
              color: Colors.grey[40],
              thickness: 1.0
          ),

          // 또 다른 맛집
          // 평점 4.0
          // 리뷰 80개
          InkWell(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _partOtherFoodPlace(TitleText[7], SubTitleText[5], iconPizza),
                  // 리뷰 80개 부분
                  Text(
                    SubTitleText[7],
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
            onTap: () {
              print("_partOtherFoodPlace");
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OtherFoodUI(),
                ),
              );
            },
          ),
          Divider(
              color: Colors.grey[40],
              thickness: 1.0
          ),

          // 맛집 리뷰 부분은 가져와도 되고 맡게 되면 제작해봐도 될듯
          // 맛집 리뷰
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  '맛집 리뷰',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            width: 20,
            height: 20,
          ),

          Scrollbar(
            controller: _scrollController, // Attach the controller to the scrollbar
            child: SingleChildScrollView(
              controller: _scrollController, // Attach the controller to the scrollable widget
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    child: FoodInformation(ReviewerName[0], ReviewerText[0], 3.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodRationUI(),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: FoodInformation(ReviewerName[1], ReviewerText[1], 2.5),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodRationUI(),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: FoodInformation(ReviewerName[2], ReviewerText[2], 1.5),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodRationUI(),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: FoodInformation(ReviewerName[0], ReviewerText[0], 3.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodRationUI(),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: FoodInformation(ReviewerName[1], ReviewerText[1], 2.5),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodRationUI(),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: FoodInformation(ReviewerName[2], ReviewerText[2], 1.5),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodRationUI(),
                        ),
                      );
                    },
                  ),
                  /*
                  ProviderScope(
                    child: MyHomePage2(),
                  ),
                  */
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}


