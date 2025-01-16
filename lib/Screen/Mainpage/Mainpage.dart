// (전체적으로 변동 가능성 존재)
// json 맛집 개수만큼 동적으로 뿌리게 제작
// 반복되는 위젯 -> list로 작업
// 같은 화면으로 넘어가게 변경 (백엔드 협의 후)

// 기본 라이브러리
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kksc_app_fe/Component/ReviewCard.dart';

// util - 변수 및 폰트 지정 위한 dart
import 'package:kksc_app_fe/util/theme.dart';
import 'package:kksc_app_fe/Screen/Mainpage/variable.dart';

// component

void main() {
  runApp(
    ProviderScope(
          child: MainpageScreen(),
      ),
    // ProviderScope는 제거할 예정
  );

}

class MainpageScreen extends StatefulWidget {
  const MainpageScreen({super.key});

  @override
  State<MainpageScreen> createState() => _MainpageScreenState();
}

class _MainpageScreenState extends State<MainpageScreen> {
  /*
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
  */

  // 메인 화면 (TitleText0) + 재학생의 꿀팁 위젯으로 넘어가는 부분 (TitleText1, iconStudent)
  Widget PartMain(String TitleText0, String TitleText1, String IconStudent) {
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
                style: TextStyleMain8,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),

        // 재학생의 꿀팁 (TitleText1, iconStudent)
        Information(TitleText1, IconStudent),
      ],
    );
  }

  // 재학생의 꿀팁 (TitleText1, iconStudent)
  Widget Information(String TitleText1, String IconStudent) {
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
                  IconStudent,
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
                    style: TextStyleMain7,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 왼쪽 아이콘 (iconBell)
  // 첫 학기 계획 세우기 (TitleText3)
  // 신입생 (SubTitleText0)
  // 신입생들을 위한 조언과 팁 (SubTitleText1)
  Widget PartFreshman(String TitleText3, String SubTitleText0, String SubTitleText1, String IconBell) {
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
                    IconBell,
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
                      style: TextStyleMain7,
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
                          style: TextStyle4,
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
                        style: TextStyleSub4,
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
      // modified by seungho v0.1beta, 추후 꿀팁 페이지에서 구현 후 연동 부탁, 일단 주석처리.
      onTap: () {
        print("_partFreshman");
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => FreshmanTipUI(),
        //   ),
        // );
      },
    );
  }

  // 왼쪽 아이콘 (iconMegaphone)
  // 시간표 짜기 꿀팁 (TitleText4)
  // 시간표 (SubTitleText2)
  // 시간표 짜는 방법 소개 (SubTitleText3)
  Widget PartTimetable(String TitleText4, String SubTitleText2, String SubTitleText3, String IconMegaphone) {
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
                  // 왼쪽 아이콘 (iconMegaphone)
                  child: Image.asset(
                    IconMegaphone,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),

                // 시간표 짜기 꿀팁 (TitleText4)
                // 시간표 (SubTitleText2)
                // 시간표 짜는 방법 소개 (SubTitleText3)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TitleText4,
                      // 폰트 위한 스타일 다시 지정 예정
                      style: TextStyleMain7,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // 시간표 (SubTitleText2)
                    Container(
                      width: 100.0,
                      height: 30.0,
                      // 시간표 (SubTitleText2) + 텍스트 스타일 (폰트) 지정하기
                      child: Center(
                        child: Text(
                           SubTitleText2,
                          style: TextStyle4,
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
                    // 시간표 짜는 방법 소개 (SubTitleText3)
                    Text(
                      SubTitleText3,
                      // 텍스트 스타일 (폰트) 따로 지정 예정
                      style: TextStyleSub4,
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
      // modified by seungho v0.1beta, 추후 꿀팁 페이지에서 구현 후 연동 부탁, 일단 주석처리.
      onTap: () {
        print("_partTimetable");
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => TimeTableTipUI(),
        //   )
        // );
      },
    );
  }

  // 왼쪽 아이콘 (iconPin)
  // 맛집 이름 (TitleText6)
  // 평점 4.5 (SubTitleText4)
  Widget PartFoodplace(String TitleText6, String SubTitleText4, String IconPin) {
    return Row(
      children: [
        // 왼쪽 아이콘 (iconPin)
        Container(
          height: 60,
          width: 60,
          // 왼쪽 아이콘 (iconPin)
          child: Image.asset(

              IconPin,
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

        // 맛집 이름 (TitleText6)
        // 평점 4.5 (SubTitleText4)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 맛집 이름 (TitleText6)
            Text(
              TitleText6,
              // 폰트 위한 스타일 다시 지정 예정
              style: TextStyleMain7,
            ),
            SizedBox(
              height: 5,
            ),
            // 평점 4.5 (SubTitleText4) -> 임의이며 넘어오는 데이터 따라 변경 가능하게 변수로 지정
            Text(
              SubTitleText4,
              // 폰트 위한 스타일 다시 지정 예정
              style: TextStyleSub5,
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

  // 왼쪽 아이콘 (iconMegaphone)
  // 또 다른 맛집 (TitleText7)
  // 평점 4.0 (SubTitleText5)
  Widget PartOtherFoodPlace(String TitleText7, String SubTitleText5, String IconPizza) {
    return Row(
      children: [
        // 왼쪽 아이콘 (iconPizza)
        Container(
          height: 60,
          width: 60,
          /*
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          */

          // 왼쪽 아이콘 (iconPizza)
          child: Image.asset(
            IconPizza,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // 또 다른 맛집 (TitleText7)
        // 평점 4.0 (SubTitleText5)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 맛집 이름 (TitleText7)
            Text(
              TitleText7,
              // 폰트 위한 스타일 다시 지정 예정
              style: TextStyle7,
            ),
            SizedBox(
              height: 5,
            ),
            // 평점 4.5 (SubTitleText5) -> 임의이며 넘어오는 데이터 따라 변경 가능하게 변수로 지정
            Text(
              SubTitleText5,
              // 폰트 위한 스타일 다시 지정 예정
              style: TextStyleSub5,
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

  final _valueList = [
    '한국어',
    'English',
  ];
  var _selectedValue = '한국어';

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorTheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /*
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
                              for (int i = 0; i < 3; i++) {
                                ReviewerName[i] = ReviewerNameEng[i];
                              }
                              for (int i = 0; i < 3; i++) {
                                ReviewerText[i] = ReviewerTextEng[i];
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
                              for (int i = 0; i < 3; i++) {
                                ReviewerName[i] = ReviewerNameKor[i];
                              }
                              for (int i = 0; i < 3; i++) {
                                ReviewerText[i] = ReviewerTextKor[i];
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
              // Change Language (TextStyle7)
              child: Text(
                "Change Language",
                style: TextStyle7,
              ),
            ),
            */

            // 언어 선택을 위한 DropdownButton (ElevatedButton에서 변경)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // 가운데 놔두려면 그냥 DropdownButton만 꺼내서 // 메인화면 ... 주석 위에 넣기
              children: [
                SizedBox(
                  width: 30,
                ),
                DropdownButton(
                  value: _selectedValue,
                  items: _valueList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                      if(_selectedValue == _valueList[0]) {
                        print("한국어");
                        isLanguage = true;
                        print(isLanguage);
                        // 1. TitleText를 기준으로 쓰고 있어서 거기의 모든 요소를 TitleTextKor로 바꿈
                        // 동적으로 할 수 있도록 하는거도 해야함
                        for (int i = 0; i < 9; i++) {
                          TitleText[i] = TitleTextKor[i];
                        }

                        // 2. SubTitleText를 기준으로 쓰고 있어서 거기의 모든 요소를 SubTitleTextKor로 바꿈
                        // 동적으로 할 수 있도록 하는거도 해야함
                        for (int i = 0; i < 8; i++) {
                          subTitleText[i] = subTitleTextKor[i];
                        }

                        // 3. SubTitleText를 기준으로 쓰고 있어서 거기의 모든 요소를 SubTitleTextKor로 바꿈
                        // 동적으로 할 수 있도록 하는거도 해야함
                        for (int i = 0; i < 3; i++) {
                          reviewerName[i] = reviewerNameKor[i];
                        }

                        for (int i = 0; i < 3; i++) {
                          ReviewerText[i] = reviewerTextKor[i];
                        }
                      }
                      if(_selectedValue == _valueList[1]) {
                        isLanguage = false;
                        print(isLanguage);
                        for (int i = 0; i < 9; i++) {
                          TitleText[i] = TitleTextEng[i];
                        }
                        for (int i = 0; i < 8; i++) {
                          subTitleText[i] = subTitleTextEng[i];
                        }
                        for (int i = 0; i < 3; i++) {
                          reviewerName[i] = reviewerNameEng[i];
                        }
                        for (int i = 0; i < 3; i++) {
                          ReviewerText[i] = reviewerTextEng[i];
                        }
                      }
                      }
                    );
                  },
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),

            // 메인 화면 (TitleText[0])
            // TextStyleMain8subTitleText/ 재학생의 꿀팁 (TitleText[1], iconStudent)
            // TextStyleMain7
            PartMain(TitleText[0], TitleText[1], iconStudent),

            // 가천대 학생들을 위한 꿀팁 (TitleText[2])
            // TextStyleMain7
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    TitleText[2],
                    // 폰트 위해 텍스트 스타일 전환 예정
                    style: TextStyleMain7,
                  ),
                ],
              ),
            ),

            // 왼쪽 아이콘 (iconBell)
            // 첫 학기 계획 세우기 (TitleText[3])
            // TextStyleMain7
            // 신입생 (SubTitleText[0])
            // TextStyle4
            // 신입생들을 위한 조언과 팁 (SubTitleText[1])
            // TextStyleSub4
            PartFreshman(TitleText[3], subTitleText[0], subTitleText[1], iconBell),
            Divider(
              height: 1,
              color: Colors.grey[40],
              thickness: 1.0,
            ),

            // 왼쪽 아이콘 (iconMegaphone)
            // 시간표 짜기 꿀팁 (TitleText[4])
            // TextStyleMain7
            // 시간표 (SubTitleText[2])
            // TextStyle4
            // 시간표 짜는 방법 소개 (SubTitleText[3])
            // TextStyleSub4
            PartTimetable(TitleText[4], subTitleText[2], subTitleText[3], iconMegaphone),
            Divider(
                color: Colors.grey[40],
                thickness: 1.0
            ),
            SizedBox(
              height: 70,
              width: 70,  // 학교 근처 맛집 (TitleText[5])
            ),
            // TextStyleMain7
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    TitleText[5],
                    // 폰트 위해 텍스트 스타일 변수 지정 예정
                    style: TextStyleMain7,
                  ),
                ],
              ),
            ),

            // 왼쪽 아이콘 (iconPin)
            // 맛집 이름 (subTitleText[6])
            // 평점 4.5 (SubTitleText[4])
            // TextStyleSub5 (회색)
            // 리뷰 100개 (SubTitleText[6])
            // TextStyleMain6 (bold)
            InkWell(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 왼쪽 아이콘 (iconPin)
                    // 맛집 이름 (TitleText[6])
                    // 평점 4.5 (SubTitleText[4])
                    PartFoodplace(TitleText[6], subTitleText[4], iconPin),
                    // 리뷰 100개 (SubTitleText[6])
                    Text(
                      subTitleText[6],
                      style: TextStyleMain6,
                      textAlign: TextAlign.end,
                      // 폰트 위해 텍스트 스타일 변수 지정 예정
                    ),
                  ],
                ),
              ),
              // timetable_tip.dart로 넘어감 -> 추후 새로 구현 예정
              // modified by seungho v0.1beta, 추후 맛집 페이지에서 구현 후 연동 부탁, 일단 주석처리.
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => FoodUI(),
                //   ),
                // );
              },
            ),
            Divider(
              color: Colors.grey[40],
              thickness: 1.0,
            ),
            // 왼쪽 아이콘 (iconMegaphone)
            // 또 다른 맛집 (TitleText[7])
            // 평점 4.0 (SubsubTitleText)
            // 리뷰 80개 (SubTitleText[7])
            InkWell(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 왼쪽 아이콘 (iconPizza)
                    // 또 다른 맛집 (TitleText[7])
                    // 평점 4.0 (SubTitleText[5])
                    PartOtherFoodPlace(TitleText[7], subTitleText[5], iconPizza),
                    // 리뷰 80개 부분 (SubTitleText[7])
                    Text(
                      subTitleText[7],
                      style: TextStyleMain6,
                      textAlign: TextAlign.end,
                      // 폰트 위해 텍스트 스타일 변수 지정 예정
                    ),
                  ],
                ),
              ),
              // timetable_tip.dart로 넘어감 -> 추후 새로 구현 예정
              // modified by seungho v0.1beta, 추후 꿀팁 페이지에서 구현 후 연동 부탁, 일단 주석처리.
              onTap: () {
                print("_partOtherFoodPlace");
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => OtherFoodUI(),
                //   ),
                // );
              },
            ),
            Divider(
                color: Colors.grey[40],
                thickness: 1.0
            ),

            // 맛집 리뷰 부분은 가져와도 되고 맡게 되면 제작해봐도 될듯
            // 맛집 리뷰 (TitleText[8])
            // TextStyleMain7
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
              child: Row(
                children: [
                  // 맛집 리뷰 (TitleText[8])
                  Text(
                    TitleText[8],
                    // 폰트 위해 텍스트 스타일 변수 지정 예정
                    style: TextStyleMain7,
                  ),
                ],
              ),
            ),

            SizedBox(
              width: 20,
              height: 20,
            ),

            // 맛집 리뷰어 (ReviewerName[0 ~ n]), 매우 만족 등 맛집에 대한 평가 (ReviewerText[0 ~ n]), 별점 등 뷰어 (3.0 등 double 매개변수 지정)
            Scrollbar(
              controller: _scrollController,
              // Attach the controller to the scrollbar
              child: SingleChildScrollView(
                controller: _scrollController,
                // Attach the controller to the scrollable widget
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // food_ration_ui.dart로 넘어감 (FoodRationUI)
                    // 추후 새로 구현 예정 (팁 화면 구현한거 보면서 각자 해당하는 화면으로 이동 예정)
                    // modified by seungho v0.1beta, Component/ReviewCard로 구현 부탁, 연동 ui는 주석 처리
                    InkWell(
                      child: ReviewCard(user: reviewerName[0], content: ReviewerText[0], starCount: "3"),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => FoodRationUI(),
                        //   ),
                        // );
                      },
                    ),
                    InkWell(
                      child: ReviewCard(user: reviewerName[1], content: ReviewerText[1], starCount: "2"),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => FoodRationUI(),
                        //   ),
                        // );
                      },
                    ),
                    InkWell(
                      child: ReviewCard(user: reviewerName[2], content: ReviewerText[2], starCount: "1"),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => FoodRationUI(),
                        //   ),
                        // );
                      },
                    ),
                    InkWell(
                      child: ReviewCard(user: reviewerName[0], content: ReviewerText[0], starCount: "5"),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => FoodRationUI(),
                        //   ),
                        // );
                      },
                    ),
                    InkWell(
                      child: ReviewCard(user: reviewerName[1], content: ReviewerText[1], starCount: "4"),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => FoodRationUI(),
                        //   ),
                        // );
                      },
                    ),
                    InkWell(
                      child: ReviewCard(user: reviewerName[2], content: ReviewerText[2], starCount: "1"),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => FoodRationUI(),
                        //   ),
                        // );
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

            SizedBox(
              width: 20,
              height: 20,
            ),
          ],

        ),
      ),
    );
  }
}
