// (전체적으로 변동 가능성 존재)
// json 맛집 개수만큼 동적으로 뿌리게 제작
// 반복되는 위젯 -> list로 작업
// 같은 화면으로 넘어가게 변경 (백엔드 협의 후)

// 기본 라이브러리
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnField.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnField2.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnFieldandReviewText.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/LabelCard.dart';

// component (foodinformation -> ReviewCard)
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/ReviewCard.dart';

// 음식 관련 화면 이동 dart

// 음식 관련 리뷰 조회 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Restaurant/Restaurant.dart'; // food_ration_ui -> Restaurant

// 신입생 팁 관련 화면 이동 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/timetable_tip.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Honeytip/Honeytip.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Notice/Notice.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/freshman_tip.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Restaurant/RestaurantList.dart';

// util - 변수 및 폰트 지정 위한 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/theme.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/variable.dart';

// component
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/color_theme.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/cosnt_value.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/text_styles.dart';

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
  Widget PartMain(String TitleText0, TextTheme textTheme) {
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
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  // 재학생의 꿀팁 (TitleText1, iconStudent)
  // 타이틀 텍스트 (TitleText)
  // 서브 타이틀 텍스트 (SubTitleText)
  // 왼쪽 아이콘 (Icon)
  Widget Information(String titleText, IconData icon) {
    return InkWell(
      child: CommonColumnField(
        title: titleText,
        icon: Icons.abc_outlined,
      ),
    );
  }

  Widget OtherPartCollector(String titleText, String subTitleText, String subTitleText2, IconData icon, Widget Function() widgetBuilder) {
    return InkWell(
      child: CommonColumnField2(
        icon: icon,
        title: titleText,
        subtitle: subTitleText,
        subtitle2: subTitleText2,
      ),
      // timetable_tip.dart로 넘어감 -> 추후 새로 구현 예정
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widgetBuilder(),
          ),
        );
      },
    );
  }

  Widget FoodPartCollector(String titleText, String subTitleText, String subTitleText2, IconData icon, Widget Function() widgetBuilder) {
    return InkWell(
      child: CommonColumnFieldandReviewText(
        icon: icon,
        title: titleText,
        subtitle: subTitleText,
        subtitle2: subTitleText2,
      ),
      // timetable_tip.dart로 넘어감 -> 추후 새로 구현 예정
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widgetBuilder(),
          ),
        );
      },
    );
  }

  // Declare the ScrollController
  ScrollController _scrollController = ScrollController();

  final _valueList = [
    '한국어',
    'English',
  ];
  var _selectedValue = '한국어';

  @override
  void dispose() {
    // Dispose the ScrollController when the widget is disposed
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cardData = [
      {
        "label": "한식",
        "img": "assets/img/restrauntExample1.jpeg",
        "name": "화리화리",
        "text": "평점: 4.5"
      },
      {"label": "한식", "img": "", "name": "전주식당", "text": "평점: 4.7"},
      {"label": "중식", "img": "", "name": "차이나타운", "text": "평점: 4.3"},
      {"label": "분식", "img": "", "name": "엉터리분식", "text": "평점: 4.8"},
    ];

    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final colorTheme = Theme.of(context).colorScheme;

    // 텍스트 테마 및 컬러 테마를 불러옴
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);
    MaterialTheme theme = MaterialTheme(textTheme);

    List<String> _starCount = [
      "1",
      "2",
      "3",
      "4",
      "5",
    ];

    return SingleChildScrollView(
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
                        titleText[i] = titleTextKor[i];
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

                      // 4.
                      // 동적으로 할 수 있도록 하는거도 해야함
                      for (int i = 0; i < 3; i++) {
                        reviewerText[i] = reviewerTextKor[i];
                      }
                    }
                    if(_selectedValue == _valueList[1]) {
                      isLanguage = false;
                      print(isLanguage);
                      for (int i = 0; i < 9; i++) {
                        titleText[i] = titleTextEng[i];
                      }
                      for (int i = 0; i < 8; i++) {
                        subTitleText[i] = subTitleTextEng[i];
                      }
                      for (int i = 0; i < 3; i++) {
                        reviewerName[i] = reviewerNameEng[i];
                      }
                      for (int i = 0; i < 3; i++) {
                        reviewerText[i] = reviewerTextEng[i];
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

          // 메인 화면 (titleText[0])
          // icon :
          // TextStyle :
          // color :
          PartMain(titleText[0], textTheme),

          // 재학생의 꿀팁 (titleText1)
          // icon :
          // TextStyle :
          // color :
          Information(titleText[1], Icons.ac_unit),

          // 가천대 학생들을 위한 꿀팁 (TitleText[2])
          // icon :
          // TextStyle :
          // color :
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  titleText[2],
                  // 폰트 위해 텍스트 스타일 전환 예정
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),

          // 첫 학기 계획 세우기 (titleText[3])
          // 신입생들을 위한 조언과 팁 (subTitleText[1])
          // 신입생 (subTitleText[0])
          // icon :
          // TextStyle :
          // color :
          OtherPartCollector(titleText[3], subTitleText[1], subTitleText[0], Icons.ice_skating, () => TimeTableTipUI()),
          Divider(
            height: 1,
            color: Colors.grey[40],
            thickness: 1.0,
          ),

          // 시간표 짜기 꿀팁 (titleText[4])
          // 시간표 (subTitleText[2])
          // 시간표 짜는 방법 소개 (subTitleText[3])
          // icon :
          // TextStyle :
          // color :
          OtherPartCollector(titleText[4], subTitleText[3], subTitleText[2], Icons.ice_skating, () => HoneytipScreen()),
          Divider(
              color: Colors.grey[40],
              thickness: 1.0
          ),
          SizedBox(
            height: 70,
            width: 70,  // 학교 근처 맛집 (TitleText[5])
          ),

          // 학교 근처 맛집
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  titleText[5],
                  // 폰트 위해 텍스트 스타일 변수 지정 예정
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),

          // 맛집 이름 (titleText[6])
          // 평점 4.5 (subTitleText[4])
          // 리뷰 100개 (subTitleText[6])
          // icon :
          // TextStyle :
          // color :
          FoodPartCollector(titleText[6], subTitleText[4], subTitleText[6], Icons.ice_skating, () => RestaurantScreen()),
          Divider(
            color: Colors.grey[40],
            thickness: 1.0,
          ),

          // 또 다른 맛집 (TitleText[7])
          // 평점 4.0 (subTitleText[5])
          // 리뷰 80개 (subTitleText[7])
          // icon :
          // TextStyle :
          // color :
          FoodPartCollector(titleText[7], subTitleText[5], subTitleText[7], Icons.ice_skating, () => RestaurantScreen()),
          Divider(
              color: Colors.grey[40],
              thickness: 1.0
          ),

          // 맛집 리뷰 부분은 가져와도 되고 맡게 되면 제작해봐도 될듯
          // 맛집 리뷰 (TitleText[8])
          PartMain(titleText[8], textTheme),
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
                  for(int i = 0; i < 5; i++)
                    InkWell(
                      child: ReviewCard(
                        user: reviewerName[i],
                        content: reviewerText[i],
                        starCount: _starCount[i],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RestaurantScreen(),
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
          SizedBox(
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}
