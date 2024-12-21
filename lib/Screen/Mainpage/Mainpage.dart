// (전체적으로 변동 가능성 존재)
// json 맛집 개수만큼 동적으로 뿌리게 제작
// 반복되는 위젯 -> list로 작업
// 같은 화면으로 넘어가게 변경 (백엔드 협의 후)

// 기본 라이브러리
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnField.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/LabelCardTest.dart';

// component (foodinformation -> ReviewCard)
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/ReviewCardTest.dart';

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

  // 메인 화면 (TitleText0) + 재학생의 꿀팁 위젯으로 넘어가는 부분 (TitleText1, iconStudent)
  Widget PartMain(String TitleText0, TextTheme textTheme, final colorTheme) {
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
                style: textTheme.headlineMedium?.copyWith( // bodyMedium 스타일을 기반으로 수정
                  color: colorTheme.scrim, // 색상 변경
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

  Widget PartSummary() {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          InkWell(
            child: LabelCardTest(
              name: "name",
              text: "text",
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
      ],
    );
  }

  Widget PartSection(String titleText, IconData icon, TextTheme textTheme, final colorTheme) {
    return Container(
      width: 500,
      height: 50,
      decoration: BoxDecoration(
        color: colorTheme.outlineVariant,
      ),
      child: Information(titleText, icon),
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

  final List<Map<String, String>> reviewData = [
    {"user": "사용자1", "name": "전주식당", "content": "맛있는 음식이었어요", "starCount": "5"},
    {"user": "사용자2", "name": "차이나타운", "content": "별로였어요", "starCount": "1"},
    {"user": "사용자3", "name": "차이나타운", "content": "음 굿", "starCount": "3"},
    {"user": "사용자4", "name": "엉터리분식", "content": "음 굿", "starCount": "3"},
    {"user": "사용자5", "name": "엉터리분식", "content": "별로였어요", "starCount": "1"},
  ];

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
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // MaterialTheme theme = MaterialTheme(textTheme);

    // 텍스트 테마 및 컬러 테마를 불러옴
    final colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);

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

          // 메인 화면 (titleText[0])
          // icon : / TextStyle : / color :
          PartMain(titleText[0], textTheme, colorTheme),

          // 맛집 리뷰어 (ReviewerName[0 ~ n]), 매우 만족 등 맛집에 대한 평가 (ReviewerText[0 ~ n]), 별점 등 뷰어 (3.0 등 double 매개변수 지정)
          Scrollbar(
            controller: _scrollController,
            // Attach the controller to the scrollbar
            child: SingleChildScrollView(
              controller: _scrollController,
              // Attach the controller to the scrollable widget
              scrollDirection: Axis.horizontal,
              // 최댓값 찾는 알고리즘
              // 차댓값 찾는 알고리즘
              // 최댓값 리뷰 개수 구하는 알고리즘
              // 차댓값 리뷰 개수 구하는 알고리즘
              child: Row(
                children: [
                  // food_ration_ui.dart로 넘어감 (FoodRationUI)
                  // 추후 새로 구현 예정 (팁 화면 구현한거 보면서 각자 해당하는 화면으로 이동 예정)
                  for(int i = 0; i < 5; i++)
                    Row(
                      children: [
                        InkWell(
                          child: ReviewCardTest(
                            user: reviewData[i]["user"]!,
                            content: reviewData[i]["content"]!,
                            starCount: reviewData[i]["starCount"]!,
                            restaurantName: reviewData[i]["name"]!,
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
            height: 30,
            width: 30,
          ),

          PartSummary(),

          // 가천대 학생들을 위한 꿀팁 (TitleText[2])
          // icon : / TextStyle : / color :
          PartMain("가천대 학생들을 위한 꿀팁", textTheme, colorTheme),

          for(int i = 0; i < 8; i++)
            PartSection("가천대 학생들을 위한 꿀팁", Icons.abc, textTheme, colorTheme),

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
