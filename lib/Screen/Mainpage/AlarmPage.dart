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

class AlarmPageScreen extends StatefulWidget {
  const AlarmPageScreen({super.key});

  @override
  State<AlarmPageScreen> createState() => _AlarmPageScreenState();
}

class _AlarmPageScreenState extends State<AlarmPageScreen> {
  Widget AlarmPageCollector(String titleText, String subTitleText, String subTitleText2, Widget Function() widgetBuilder) {
    return InkWell(
      child: CommonColumnFieldAlarmpage(
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
    final List<Map<String, String>> AlarmData = [
      {"type": "한식", "content": "이 식당은 한식 메뉴를 추천해요", "userName": "식당리뷰러"},
      {"type": "중식", "content": "이 식당은 중식 메뉴를 추천해요", "userName": "맛집리뷰러"},
      {"type": "양식", "content": "이 식당은 양식 메뉴를 추천해요", "userName": "양식냠"},
      {"type": "일식", "content": "이 식당은 일식 메뉴를 추천해요", "userName": "오이시"},
    ];
    final List<Map<String, String>> UpdateData = [
      {"type": "한식?", "content": "이 식당은 한식 메뉴를 추천해요?", "userName": "식당리뷰러?"},
      {"type": "중식?", "content": "이 식당은 중식 메뉴를 추천해요?", "userName": "맛집리뷰러?"},
      {"type": "양식?", "content": "이 식당은 양식 메뉴를 추천해요?", "userName": "양식냠?"},
      {"type": "일식?", "content": "이 식당은 일식 메뉴를 추천해요?", "userName": "오이시?"},
    ];

    List<Widget Function()> AlarmPage = [
      () => RestaurantScreen(),
      () => HoneytipScreen(),
      () => FreshmanTipUI(),
    ];
    List<Widget Function()> AlarmUpdatePage = [
      () => TimeTableTipUI(),
      () => HoneytipScreen(),
      () => RestaurantScreen(),
    ];

    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // MaterialTheme theme = MaterialTheme(textTheme);

    // 텍스트 테마 및 컬러 테마를 불러옴
    final colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);

    var now = DateTime.now();
    String formattedDate = DateFormat('M월 d일').format(now) +
        ' (${DateFormat.E('ko_KR').format(now)})';
    String formattedDateSectionMonth = DateFormat('M').format(now);
    String formattedDateSectionYear = DateFormat('y').format(now);

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
                // 알림
                // 제목 (title)
                // icon : X / TextStyle : titleLarge / color : scrim
                // 내용 (subtitle)
                // icon : X / TextStyle : labelLarge / color : scrim
                // 날짜
                // icon : X / TextStyle : bodySmall / color : outline
                for(int i = 0; i < 3; i++)
                  AlarmPageCollector(
                    AlarmData[i]["type"]!,
                    AlarmData[i]["content"]!,
                    AlarmData[i]["userName"]!, // formattedDate
                    AlarmPage[i],
                  ),
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
                // 업데이트
                // 제목 (title)
                // icon : X / TextStyle : titleLarge / color : scrim
                // 내용 (subtitle)
                // icon : X / TextStyle : labelLarge / color : scrim
                // 날짜
                // icon : X / TextStyle : bodySmall / color : outline
                for(int i = 0; i < 3; i++)
                  AlarmPageCollector(
                    UpdateData[i]["type"]!,
                    UpdateData[i]["content"]!,
                    UpdateData[i]["userName"]!,
                    AlarmUpdatePage[i],
                  ),
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