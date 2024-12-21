// 기본 라이브러리
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnField.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnFieldBasic.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/LabelCard/LabelCardMainpage.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/ReviewCard/ReviewCardMainpage.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Honeytip/Honeytip.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/AlarmPage.dart';

// component (foodinformation -> ReviewCard)

// 음식 관련 화면 이동 dart

// 음식 관련 리뷰 조회 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Restaurant/Restaurant.dart'; // food_ration_ui -> Restaurant

// 신입생 팁 관련 화면 이동 dart

// util - 변수 및 폰트 지정 위한 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/variable.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_model.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_services.dart';

// component
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

  // 대제목 (메인 화면, 가천대 학생들을 위한 꿀팁)
  // icon : X / TextStyle : headlineMedium / color : scrim
  Widget PartMain(String titleText, TextTheme textTheme, final colorTheme) {
    return Column(
      children: [
        SizedBox(
          width: 20,
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                titleText,
                style: textTheme.headlineMedium?.copyWith(
                  color: colorTheme.scrim,
                ),
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
  
  // 학교 홈, 셔틀버스, 학사공지, 학사일정, 도서관, 포털
  Widget OtherPartSummary(String name, IconData icon, Widget Function() widgetBuilder) {
    return Row(
      children: [
        InkWell(
          child: Center(
            child: LabelCardMainpage(
              name: name,
              icon: icon,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widgetBuilder(),
              ),
            );
          },
        ),
      ],
    );
  }

  // 가천대 학생들을 위한 꿀팁 모음 Section (PartSection)
  // icon : X / TextStyle : labelSmall (title : bold, subtitle : basic) / color : scrim
  Widget PartSection(String titleText, String subtitleText, IconData icon, TextTheme textTheme, final colorTheme, Widget Function() widgetBuilder) {
    return Container(
      width: 500,
      height: 50,
      decoration: BoxDecoration(
        color: colorTheme.outlineVariant,
      ),
      child: InkWell(
        child: CommonColumnFieldBasic(
          title: titleText,
          subtitle: subtitleText,
          icon: icon,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widgetBuilder(),
            ),
          );
        },
      ),
    );
  }

  // Declare the ScrollController
  ScrollController _scrollController = ScrollController();
  /*
  final _valueList = [
    '한국어',
    'English',
  ];
  var _selectedValue = '한국어';
  List<String> _starCount = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  */

  // GET
  List<CommandsModel> commendsModel = [];
  getComments() {
    GetApiServices().getCommentsModel().then((value) {
      setState(() {
        commendsModel = value!;
      });
    });
  }

  @override
  void initState() {
    getComments();
    super.initState();
    _initializeLocale();
  }

  Future<void> _initializeLocale() async {
    await initializeDateFormatting('ko_KR', null);
    setState(() {
    });
  }

  // POST
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  registerUser(String email, String password) async {
    Uri url = Uri.parse("https://reqres.in/api/register");
    var data = {
      "email" : email,
      "password" : password,
    };

    try {
      var response = await http.post(url, body: data);
      if(response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);
      }
      else {
        var error = jsonDecode(response.body);
        print("Unable to Register: ${error['error']}");
      }
    } catch (e) {
      print("Error:$e");
    }
  }

  @override
  void dispose() {
    // Dispose the ScrollController when the widget is disposed
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*
    List OtherPartSummaryName = [
      "학교 홈",
      "셔틀 버스",
      "학사 공지",
      "학사 일정",
      "도서관",
      "포털"
    ];
    List OtherPartSummaryIcon = [
      Icons.abc,
      Icons.ac_unit,
      Icons.access_alarm_outlined,
      Icons.ac_unit_outlined,
      Icons.access_time_filled_rounded
    ];
    // 임시
    List<Widget Function()> OtherPartSummaryPage = [
      () => RestaurantScreen(),
      () => AlarmPageScreen(),
      () => RestaurantScreen(),
      () => AlarmPageScreen(),
      () => RestaurantScreen(),
    ];
    */
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // MaterialTheme theme = MaterialTheme(textTheme);
    
    // 텍스트 테마 및 컬러 테마를 불러옴
    final colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);

    // 임시
    List<Widget Function()> ReviewPage = [
          () => RestaurantScreen(),
          () => HoneytipScreen(),
    ];

    // 임시
    List<Widget Function()> PartSectionPage = [
          () => RestaurantScreen(),
          () => HoneytipScreen(),
          () => RestaurantScreen(),
          () => HoneytipScreen(),
          () => RestaurantScreen(),
          () => HoneytipScreen(),
    ];
    var now = DateTime.now();
    String formattedDate = DateFormat('M월 d일').format(now) +
        ' (${DateFormat.E('ko_KR').format(now)})';

    String formattedDateSectionMonth = DateFormat('M').format(now);
    String formattedDateSectionYear = DateFormat('y').format(now);
    // https://luvris2.tistory.com/770
    // https://blueoceannshark.tistory.com/entry/flutter%ED%94%8C%EB%9F%AC%ED%84%B0-%EC%8B%9C%EA%B0%84%EB%82%A0%EC%A7%9C%EC%9A%94%EC%9D%BC-%EA%B0%80%EC%A0%B8%EC%98%A4%EA%B8%B0-%EB%B0%8F-%EC%8B%9C%EA%B0%84-%EC%9E%90%EB%8F%99-%EA%B0%B1%EC%8B%A0-%EB%B0%A9%EB%B2%95TimerBuilder
    // ㄴ원랜 timer_builder도 설치해야함.
    // DateFormat('MMM ddd EEEE').format(now);

    List reviewerContent = [
      "오늘의 일정을 체크해보세요.",
      formattedDate,
    ];

    // main_ui.dart
    List subTitleText = [
      "신입생들을 위한 조언과 팁",
      "시간표 짜는 방법 소개",
      "선배님들이 인정하는 최고의 맛집들", // 평점 : / 리뷰 개수 :
      "$formattedDateSectionYear년 $formattedDateSectionMonth월 이벤트",
      "서비스 오픈 예정",
      "새로운 기능 추가"
    ];

    /*
// main.dart
String ImageURL = 'assets/img/icon/kksc_logo.jpg';

String Id = '김한성'; // 구현되면 매개변수로 받아야할듯
String Email = 'gkstjd6097@gmail.com';

// main.dart
String Version = 'Version: $VersionInnerText';
String VersionInnerText = '1.0.0';

// appbar.dart
String ImageURL_AppBar = 'assets/img/icon/gachon_logo.png';

// foodinformation.dart

// main_ui.dart
var isLanguage = true;
*/
    /*
String foodPlaceNameKor = '맛집 이름';
String otherFoodPlaceNameKor = '또 다른 맛집'; // shift + f6 -> or alt + f7
String foodPlaceName = '맛집 이름';
String otherFoodPlaceName = '또 다른 맛집';

List reviewerNameKor = [
  newReviewerNameKor,
  newReviewerNameKor2,
  newReviewerNameKor3,
];
String newReviewerNameKor = '맛집 리뷰어 1'; // 변수로 받아올 예정
String newReviewerNameKor2 = '맛집 리뷰어 2'; // 변수로 받아올 예정
String newReviewerNameKor3 = '맛집 리뷰어 3'; // 변수로 받아올 예정

List reviewerTextKor = [
  newReviewerTextKor,
  newReviewerTextKor2,
  newReviewerTextKor3,
];
String newReviewerTextKor = "매우 만족"; // 변수로 받아올 예정
String newReviewerTextKor2 = "다소 만족"; // 변수로 받아올 예정
String newReviewerTextKor3 = "보통"; // 변수로 받아올 예정

List titleTextKor = [
  "메인 화면",
  "재학생의 꿀팁",

  "가천대 학생들을 위한 꿀팁",
  "첫 학기 계획 세우기",
  "시간표 짜기 꿀팁",

  "학교 근처 맛집",

  foodPlaceNameKor,
  otherFoodPlaceNameKor,

  "맛집 리뷰"
];

// main_ui.dart
List titleTextEng = [
  "Main Screen",
  "Senior Tip",
  "Tip for Gachon Univ Students",
  "To Plan First Semester",
  "To Plan TimeTable",
  "Delicious Near The Gachon Univ",
  foodPlaceNameEng,
  otherFoodPlaceNameEng,

  "Delicious Food Review"
];
String foodPlaceNameEng = 'Good Food Place Name';
String otherFoodPlaceNameEng = 'Another Food Place Name';

// main_ui.dart
List subTitleTextEng = [
  "Freshman",
  "Comments and Tips For Freshman",
  "TimeTable",
  "Introduction of Writing TimeTable",
  "rate : $rateFood",
  "rate : $otherRateFood",
  "review : $reviewCount",
  "review : $otherReviewCount",
];

List subTitleTextKor = [
  "신입생",
  "신입생들을 위한 조언과 팁",

  "시간표",
  "시간표 짜는 방법 소개",

  "평점 : $rateFood",
  "평점 : $otherRateFood",

  "리뷰 : $reviewCount개",
  "리뷰 : $otherReviewCount개",
];

// main_ui.dart
List reviewerNameEng = [
  newReviewerNameEng,
  newReviewerNameEng2,
  newReviewerNameEng3,
];
String newReviewerNameEng = 'Reviewer 1'; // 변수로 받아올 예정
String newReviewerNameEng2 = 'Reviewer 2'; // 변수로 받아올 예정
String newReviewerNameEng3 = 'Reviewer 3'; // 변수로 받아올 예정

// main_ui.dart
List reviewerTextEng = [
  newReviewerTextEng,
  newReviewerTextEng2,
  newReviewerTextEng3,
];
String newReviewerTextEng = 'Very nice'; // 변수로 받아올 예정
String newReviewerTextEng2 = 'Sometime good'; // 변수로 받아올 예정
String newReviewerTextEng3 = 'Simple'; // 변수로 받아올 예정
*/
    /*
double rateFood = 4.5;
double otherRateFood = 4.0;
int reviewCount = 100;
int otherReviewCount = 80;

// main_ui.dart
List reviewerName = [
  newReviewerName,
  newReviewerName2,
  newReviewerName3,
  newReviewerName3,
  newReviewerName3,
];
String newReviewerName = '맛집 리뷰어 1'; // 변수로 받아올 예정
String newReviewerName2 = '맛집 리뷰어 2'; // 변수로 받아올 예정
String newReviewerName3 = '맛집 리뷰어 3'; // 변수로 받아올 예정

// main_ui.dart
List reviewerText = [
  newReviewerText,
  newReviewerText2,
  newReviewerText3,
  newReviewerText3,
  newReviewerText3,
];
String newReviewerText = '매우 만족'; // 변수로 받아올 예정
String newReviewerText2 = '다소 만족'; // 변수로 받아올 예정
String newReviewerText3 = '보통'; // 변수로 받아올 예정
*/

// main_ui.dart
    List titleText = [
      "첫 학기 계획 세우기",
      "시간표 짜기 꿀팁",
      "맛집 찾기",
      "학교 행사",
      "가천 길잡이 업데이트 일정",
      "서비스 이용 안내",
    ];

    List reviewerTitle = [
      "이번 학기 시간표",
      "오늘의 할일",
    ];

    List subreviewerContent = [
      "더보기 >",
      "todo list >",
    ];

    final List<Map<String, String>> reviewData = [
      {"user": "사용자1", "name": "전주식당", "content": "맛있는 음식이었어요", "starCount": "5"},
      {"user": "사용자2", "name": "차이나타운", "content": "별로였어요", "starCount": "1"},
      {"user": "사용자3", "name": "차이나타운", "content": "음 굿", "starCount": "3"},
      {"user": "사용자4", "name": "엉터리분식", "content": "음 굿", "starCount": "3"},
      {"user": "사용자5", "name": "엉터리분식", "content": "별로였어요", "starCount": "1"},
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
          /*
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
                  // 또 다른 맛집 (TitleText[7])
        // 평점 4.0 (subTitleText[5])
        // 리뷰 80개 (subTitleText[7])
        // icon :
        // TextStyle :
        // color :
        // 첫 학기 계획 세우기 (titleText[3])
        // 신입생들을 위한 조언과 팁 (subTitleText[1])
        // 신입생 (subTitleText[0])
        // icon : / TextStyle : / color :
        // 주석 잘 달아놓기!! 및 이름 변경!!
        // OtherPartCollector(titleText[3], subTitleText[1], subTitleText[0], Icons.ice_skating, () => TimeTableTipUI()),

        // 시간표 짜기 꿀팁 (titleText[4])
        // 시간표 (subTitleText[2])
        // 시간표 짜는 방법 소개 (subTitleText[3])
        // icon : / TextStyle : / color :
        // OtherPartCollector(titleText[4], subTitleText[3], subTitleText[2], Icons.ice_skating, () => HoneytipScreen()),

        // 맛집 이름 (titleText[6])
        // 평점 4.5 (subTitleText[4])
        // 리뷰 100개 (subTitleText[6])
        // icon :
        // TextStyle :
        // color :
          */

          // 대제목 (메인 화면)
          // icon : X / TextStyle : headlineMedium / color : scrim
          PartMain("메인 화면", textTheme, colorTheme),

          // 시간표 or todo list or 학점 계산기
          // icon : / TextStyle : / color :
          Scrollbar(
            controller: _scrollController,
            // Attach the controller to the scrollbar
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(int i = 0; i < 2; i++)
                    Row(
                      children: [
                        ReviewCardMainpage(
                          title: reviewerTitle[i],
                          content: reviewerContent[i],
                          subcontent: subreviewerContent[i],
                          widgetBuilder: ReviewPage[i],
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                        ),
                      ],
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

          /*
          // 재학생의 꿀팁 (titleText1)
          // icon : / TextStyle : / color :
          // Information(titleText[1], Icons.ac_unit),
          */

          SizedBox(
            height: 10,
            width: 10,
          ),

          // 학교 홈, 셔틀버스, 학사공지, 학사일정, 도서관, 포털 (OtherPartSummary)
          // icon : O () / TextStyle : labelLarge / color : scrim
          /*
          Row(
            children: [
              for (int i = 0; i < 5; i++)
              OtherPartSummary(OtherPartSummaryName[i], OtherPartSummaryIcon[i], OtherPartSummaryPage[i]),
            ],
          ),
          */

          // 가천대 학생들을 위한 꿀팁 (PartMain)
          // icon : X / TextStyle : headlineMedium / color : scrim
          PartMain("가천대 학생들을 위한 꿀팁", textTheme, colorTheme),

          // 가천대 학생들을 위한 꿀팁 모음 Section (PartSection)
          // icon : X / TextStyle : labelSmall (title : bold, subtitle : basic) / color : scrim
          for(int i = 0; i < 6; i++)
            PartSection(titleText[i], subTitleText[i], Icons.abc, textTheme, colorTheme, PartSectionPage[i]),
          // GET
          /*
          ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                final apidata = commendsModel[index];
                return Center(
                  child: Material(
                    child: Row(
                      children: [
                        Text(
                          apidata.id.toString(),
                        ),
                        Text(
                          apidata.name.toString(),
                        ),
                        Text(
                          apidata.email.toString(),
                        ),
                        Text(
                          apidata.body.toString(),
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
          */

          // POST
          /*
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    registerUser(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          // fontWeight: Font,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          */
        ],
      ),
    );
  }
}
