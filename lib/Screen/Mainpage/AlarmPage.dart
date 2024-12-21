// 저거 틀대로 컬러랑 폰트 유틸에 있는대로 지켜서 하고
// 텍스트 변경
// 아이콘이나 화면 넘어가는거
// 남의 화면에서 받아오는거
// api 하기
// (전체적으로 변동 가능성 존재)
// json 맛집 개수만큼 동적으로 뿌리게 제작
// 반복되는 위젯 -> list로 작업
// 같은 화면으로 넘어가게 변경 (백엔드 협의 후)

import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnFieldAlarmpage.dart';

// util - 변수 및 폰트 지정 위한 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/variable.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Restaurant/Restaurant.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_model.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_services.dart';

// component
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/cosnt_value.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/text_styles.dart';

class AlarmPageScreen extends StatefulWidget {
  const AlarmPageScreen({super.key});

  @override
  State<AlarmPageScreen> createState() => _AlarmPageScreenState();
}

class _AlarmPageScreenState extends State<AlarmPageScreen> {
  Widget OtherPartCollector(String titleText, String subTitleText, String subTitleText2, IconData icon, Widget Function() widgetBuilder) {
    return InkWell(
      child: CommonColumnFieldAlarmpage(
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
      child: CommonColumnFieldAlarmpage(
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

  @override
  Widget build(BuildContext context) {
    // .dart
    List titleTextAlarm = [
      "첫 학기 계획 세우기",
      "시간표 짜기 꿀팁",
      "맛집 이름",
      "학교 행사",
      "가천 길잡이 업데이트 일정",
      "서비스 이용 안내",
    ];

// .dart
    List subTitleTextAlarm = [
      "신입생들을 위한 조언과 팁",
      "시간표 짜는 방법 소개",
      "평점 : / 리뷰 개수 : ",
      "formattedDateSection년 10월 이벤트",
      "서비스 오픈 예정",
      "새로운 기능 추가"
    ];

    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // MaterialTheme theme = MaterialTheme(textTheme);

    // 텍스트 테마 및 컬러 테마를 불러옴
    final colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("알림"),
              ),
              Tab(
                child: Text("업데이트"),
              ),
            ],
          ),
          title: const Text('가천길잡이 새소식'),
        ),
        body: TabBarView(
          children: [
            // 에브리타임 "새소식" (위에 appbar로 이전) -> "알림" (아래 tab로 이전)
            Column(
              children: [
                FoodPartCollector(
                    "titleTextAlarm[6]",
                    "subTitleTextAlarm[4]",
                    "subTitleTextAlarm[6]",
                    Icons.food_bank_outlined,
                        () => RestaurantScreen()
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[40],
                  thickness: 1.0,
                ),

                FoodPartCollector("titleText[7]", "subTitleTextAlarm[5]", "subTitleTextAlarm[7]", Icons.fastfood, () => RestaurantScreen()),
                Divider(
                  height: 1,
                  color: Colors.grey[40],
                  thickness: 1.0,
                ),
              ],
            ),
            // 에브리타임 "키워드" (삭제 사유 : 미온적인 사용 예상) -> "업데이트" ()
            Column(
              children: [
                FoodPartCollector(
                    "titleTextAlarm[6]",
                    "subTitleTextAlarm[4]",
                    "subTitleTextAlarm[6]",
                    Icons.food_bank_outlined,
                        () => RestaurantScreen()
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[40],
                  thickness: 1.0,
                ),

                FoodPartCollector("titleTextAlarm[7]", "subTitleTextAlarm[5]", "subTitleTextAlarm[7]", Icons.fastfood, () => RestaurantScreen()),
                Divider(
                  height: 1,
                  color: Colors.grey[40],
                  thickness: 1.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}