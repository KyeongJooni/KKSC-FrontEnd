// 학교 시간표 api 추출 및 시간표 구현기능 제공
// 시간표 수정 및 개인 추가 기능 구현(학교 시간표 api에 없는 것) (에브리타임과 유사하게 구현)

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
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Notice/Notice.dart';

// Mypage
// Siguuppage

// Notice

// Restaurant - 음식 관련 화면 이동 dart + 음식 관련 리뷰 조회 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Restaurant/Restaurant.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Timetable/everytime_timetable.dart';

// Timetable

// util - 변수 및 폰트 지정 위한 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_model.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_services.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/color_theme.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/cosnt_value.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/text_styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Character card',
      home: TimetableScreen(),
    );
  }
}

List<String> week = ['월', '화', '수', '목', '금'];
List<String> TIME = [
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
];

final List<Map<String, String>> MonTimetableData = [
  {"day" : "월", "subject": "", "startTime": "9", "endTime": "10", "professorName": "", "room": ""},
  {"day" : "월", "subject": "", "startTime": "10", "endTime": "11", "professorName": "", "room": ""},
  {"day" : "월", "subject": "", "startTime": "11", "endTime": "12", "professorName": "", "room": ""},
  {"day" : "월", "subject": "", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "월", "subject": "", "startTime": "13", "endTime": "14", "professorName": "", "room": ""},
  {"day" : "월", "subject": "", "startTime": "14", "endTime": "15", "professorName": "", "room": ""},
  {"day" : "월", "subject": "", "startTime": "15", "endTime": "16", "professorName": "", "room": ""},
  {"day" : "월", "subject": "", "startTime": "16", "endTime": "17", "professorName": "", "room": ""},
];
final List<Map<String, String>> MonTimetableRealData = [
  {"day" : "월", "subject": "", "startTime": "9", "endTime": "10", "professorName": "", "room": ""},
  {"day" : "월", "subject": "", "startTime": "10", "endTime": "11", "professorName": "", "room": ""},
  {"day" : "월", "subject": "AI 중심세상", "startTime": "11", "endTime": "12", "professorName": "성보경", "room": "비전타워-B203"},
  {"day" : "월", "subject": "AI 중심세상", "startTime": "12", "endTime": "13", "professorName": "성보경", "room": "비전타워-B203"},
  {"day" : "월", "subject": "남아시아의 정치와 경제", "startTime": "13", "endTime": "14", "professorName": "한진원", "room": ""},
  {"day" : "월", "subject": "남아시아의 정치와 경제", "startTime": "14", "endTime": "15", "professorName": "한진원", "room": ""},
  {"day" : "월", "subject": "", "startTime": "15", "endTime": "16", "professorName": "", "room": ""},
  {"day" : "월", "subject": "", "startTime": "16", "endTime": "17", "professorName": "", "room": ""},
];

final List<Map<String, String>> TueTimetableData = [
  {"day" : "화", "subject": "", "startTime": "9", "endTime": "10", "professorName": "", "room": ""},
  {"day" : "화", "subject": "", "startTime": "10", "endTime": "11", "professorName": "", "room": ""},
  {"day" : "화", "subject": "", "startTime": "11", "endTime": "12", "professorName": "", "room": ""},
  {"day" : "화", "subject": "", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "화", "subject": "", "startTime": "13", "endTime": "14", "professorName": "", "room": ""},
  {"day" : "화", "subject": "", "startTime": "14", "endTime": "15", "professorName": "", "room": ""},
  {"day" : "화", "subject": "", "startTime": "15", "endTime": "16", "professorName": "", "room": ""},
  {"day" : "화", "subject": "", "startTime": "16", "endTime": "17", "professorName": "", "room": ""},
];
final List<Map<String, String>> TueTimetableRealData = [
  {"day" : "화", "subject": "", "startTime": "9", "endTime": "10", "professorName": "", "room": ""},
  {"day" : "화", "subject": "", "startTime": "10", "endTime": "11", "professorName": "", "room": ""},
  {"day" : "화", "subject": "C언어", "startTime": "11", "endTime": "12", "professorName": "한기태", "room": ""},
  {"day" : "화", "subject": "", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "화", "subject": "", "startTime": "13", "endTime": "14", "professorName": "", "room": ""},
  {"day" : "화", "subject": "", "startTime": "14", "endTime": "15", "professorName": "", "room": ""},
  {"day" : "화", "subject": "", "startTime": "15", "endTime": "16", "professorName": "", "room": ""},
  {"day" : "화", "subject": "", "startTime": "16", "endTime": "17", "professorName": "", "room": ""},
];

final List<Map<String, String>> WedTimetableData = [
  {"day" : "수", "subject": "", "startTime": "9", "endTime": "10", "professorName": "", "room": ""},
  {"day" : "수", "subject": "", "startTime": "10", "endTime": "11", "professorName": "", "room": ""},
  {"day" : "수", "subject": "", "startTime": "11", "endTime": "12", "professorName": "", "room": ""},
  {"day" : "수", "subject": "", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "수", "subject": "", "startTime": "13", "endTime": "14", "professorName": "", "room": ""},
  {"day" : "수", "subject": "", "startTime": "14", "endTime": "15", "professorName": "", "room": ""},
  {"day" : "수", "subject": "", "startTime": "15", "endTime": "16", "professorName": "", "room": ""},
  {"day" : "수", "subject": "", "startTime": "16", "endTime": "17", "professorName": "", "room": ""},
];
final List<Map<String, String>> WedTimetableRealData = [
  {"day" : "수", "subject": "기술과 세계사 전환", "startTime": "9", "endTime": "10", "professorName": "홍준희", "room": "실시간화상강의실"},
  {"day" : "수", "subject": "기술과 세계사 전환", "startTime": "10", "endTime": "11", "professorName": "홍준희", "room": "실시간화상강의실"},
  {"day" : "수", "subject": "기술과 세계사 전환", "startTime": "11", "endTime": "12", "professorName": "홍준희", "room": "실시간화상강의실"},
  {"day" : "수", "subject": "대기업 중견기업 취업 전략", "startTime": "12", "endTime": "13", "professorName": "최회명", "room": "글로벌센터-BB100"},
  {"day" : "수", "subject": "대기업 중견기업 취업 전략", "startTime": "13", "endTime": "14", "professorName": "최회명", "room": "글로벌센터-100"},
  {"day" : "수", "subject": "", "startTime": "14", "endTime": "15", "professorName": "", "room": ""},
  {"day" : "수", "subject": "C언어", "startTime": "15", "endTime": "16", "professorName": "", "room": ""},
  {"day" : "수", "subject": "C언어", "startTime": "16", "endTime": "17", "professorName": "", "room": ""},
];

final List<Map<String, String>> ThurTimetableData = [
  {"day" : "목", "subject": "", "startTime": "9", "endTime": "10", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "10", "endTime": "11", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "11", "endTime": "12", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "13", "endTime": "14", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "14", "endTime": "15", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "15", "endTime": "16", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "16", "endTime": "17", "professorName": "", "room": ""},
];
final List<Map<String, String>> ThurTimetableRealData = [
  {"day" : "목", "subject": "콜잉2", "startTime": "9", "endTime": "10", "professorName": "", "room": ""},
  {"day" : "목", "subject": "콜잉2", "startTime": "10", "endTime": "11", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "11", "endTime": "12", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "13", "endTime": "14", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "14", "endTime": "15", "professorName": "", "room": ""},
  {"day" : "목", "subject": "다문화", "startTime": "15", "endTime": "16", "professorName": "", "room": ""},
  {"day" : "목", "subject": "다문화", "startTime": "16", "endTime": "17", "professorName": "", "room": ""},
];

final List<Map<String, String>> FriTimetableData = [
  {"day" : "금", "subject": "", "startTime": "9", "endTime": "10", "professorName": "", "room": ""},
  {"day" : "금", "subject": "", "startTime": "10", "endTime": "11", "professorName": "", "room": ""},
  {"day" : "금", "subject": "", "startTime": "11", "endTime": "12", "professorName": "", "room": ""},
  {"day" : "금", "subject": "", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "금", "subject": "", "startTime": "13", "endTime": "14", "professorName": "", "room": ""},
  {"day" : "금", "subject": "", "startTime": "14", "endTime": "15", "professorName": "", "room": ""},
  {"day" : "금", "subject": "", "startTime": "15", "endTime": "16", "professorName": "", "room": ""},
  {"day" : "금", "subject": "", "startTime": "16", "endTime": "17", "professorName": "", "room": ""},
];
final List<Map<String, String>> FriTimetableRealData = [
  {"day" : "금", "subject": "이산수학", "startTime": "9", "endTime": "10", "professorName": "", "room": ""},
  {"day" : "금", "subject": "이산수학", "startTime": "10", "endTime": "11", "professorName": "", "room": ""},
  {"day" : "금", "subject": "이산수학", "startTime": "11", "endTime": "12", "professorName": "", "room": ""},
  {"day" : "금", "subject": "", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "금", "subject": "과기글", "startTime": "13", "endTime": "14", "professorName": "", "room": ""},
  {"day" : "금", "subject": "과기글", "startTime": "14", "endTime": "15", "professorName": "", "room": ""},
  {"day" : "금", "subject": "", "startTime": "15", "endTime": "16", "professorName": "", "room": ""},
  {"day" : "금", "subject": "", "startTime": "16", "endTime": "17", "professorName": "", "room": ""},
];

class TimetableScreen extends StatefulWidget {
  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  Widget time (String time) {
    return Column(
      children: [
        Text(
          time,
          style: TextStyle(
              color: Colors.grey
          ),
        ),
        SizedBox(
          // width: (MediaQuery.of(context).size.width / 5) - 6, // 한 위젯으로 했을 때 기준으로 원랜 한 20 ~ 30정도?
          height: (MediaQuery.of(context).size.height) / 8 + 25,
        ),
      ],
    );
  }

  Widget drawTimetable() {
    return Row(
      children: [
        Column(
          children: [
            for (int i = 0; i <= 7; i++)
              subjectWeek(i, MonTimetableData, "day", "subject", "professorName", "room", TIME[i], TIME[i+1]),
          ],
        ),
        Column(
          children: [
            for (int i = 0; i <= 7; i++)
            // 0 1 / 1 2 / 2 3 / 3 4 / 4 5 / 5 6 / 6 7
              subjectWeek(i, TueTimetableData, "day", "subject", "professorName", "room", TIME[i], TIME[i+1]),
          ],
        ),
        Column(
          children: [
            for (int i = 0; i <= 7; i++)
            // 0 1 / 1 2 / 2 3 / 3 4 / 4 5 / 5 6 / 6 7
              subjectWeek(i, WedTimetableData, "day", "subject", "professorName", "room", TIME[i], TIME[i+1]),
          ],
        ),
        Column(
          children: [
            for (int i = 0; i <= 7; i++)
            // 0 1 / 1 2 / 2 3 / 3 4 / 4 5 / 5 6 / 6 7
              subjectWeek(i, ThurTimetableData, "day", "subject", "professorName", "room", TIME[i], TIME[i+1]),
          ],
        ),
        Column(
          children: [
            for (int i = 0; i <= 7; i++)
            // 0 1 / 1 2 / 2 3 / 3 4 / 4 5 / 5 6 / 6 7
              subjectWeek(i, FriTimetableData, "day", "subject", "professorName", "room", TIME[i], TIME[i+1]),
          ],
        ),
      ],
    );
  }

  Widget subjectWeek (int i, final List<Map<String, String>> weekTimetableData, String dataDay, String dataSubject, String dataProfessorName, String dataRoom, String dataStarttime, String dataEndtime) {
    return Container(
      width: (MediaQuery.of(context).size.width / 5) - 20, // 한 위젯으로 했을 때 기준으로 원랜 한 20 ~ 30정도?
      height: (MediaQuery.of(context).size.height / 5) - 20,
      decoration: BoxDecoration(
        color: Colors.black, // 테스트해보기!!
        border: Border.all(
          color: Colors.grey,
          width: 3,
        ),
      ),
      child: Column(
        children: [
          Text(
            weekTimetableData[i][dataSubject]!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            // TimetableData[i]["professorName"]!,
            weekTimetableData[i][dataProfessorName]!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            weekTimetableData[i][dataRoom]!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // MaterialTheme theme = MaterialTheme(textTheme);

    // 텍스트 테마 및 컬러 테마를 불러옴
    final colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);

    TextEditingController inputController = TextEditingController();
    String inputText = '';
    setState(() {
      // 월
      for (int i = 0; i <= 7; i++) {
        if(MonTimetableData[i]["day"]! == MonTimetableRealData[i]["day"]!
            && MonTimetableData[i]["startTime"]! == MonTimetableRealData[i]["startTime"]!
            && MonTimetableData[i]["endTime"]! == MonTimetableRealData[i]["endTime"]!
        ) {
          MonTimetableData[i]["subject"] = MonTimetableRealData[i]["subject"]!;
          MonTimetableData[i]["professorName"] = MonTimetableRealData[i]["professorName"]!;
          MonTimetableData[i]["room"] = MonTimetableRealData[i]["room"]!;
          print("작동");
        }
      }
      // 화
      for (int i = 0; i <= 7; i++) {
        if(TueTimetableData[i]["day"]! == TueTimetableData[i]["day"]!
            && TueTimetableData[i]["startTime"]! == TueTimetableData[i]["startTime"]!
            && TueTimetableData[i]["endTime"]! == TueTimetableData[i]["endTime"]!
        ) {
          TueTimetableData[i]["subject"] = TueTimetableRealData[i]["subject"]!;
          TueTimetableData[i]["professorName"] = TueTimetableRealData[i]["professorName"]!;
          TueTimetableData[i]["room"] = TueTimetableRealData[i]["room"]!;
          print("작동");
        }
      }
      // 수
      for (int i = 0; i <= 7; i++) {
        if(WedTimetableData[i]["day"]! == WedTimetableData[i]["day"]!
            && WedTimetableData[i]["startTime"]! == WedTimetableData[i]["startTime"]!
            && WedTimetableData[i]["endTime"]! == WedTimetableData[i]["endTime"]!
        ) {
          WedTimetableData[i]["subject"] = WedTimetableRealData[i]["subject"]!;
          WedTimetableData[i]["professorName"] = WedTimetableRealData[i]["professorName"]!;
          WedTimetableData[i]["room"] = WedTimetableRealData[i]["room"]!;
          print("작동");
        }
      }
      // 목
      for (int i = 0; i <= 7; i++) {
        if(ThurTimetableData[i]["day"]! == ThurTimetableData[i]["day"]!
            && ThurTimetableData[i]["startTime"]! == ThurTimetableData[i]["startTime"]!
            && ThurTimetableData[i]["endTime"]! == ThurTimetableData[i]["endTime"]!
        ) {
          ThurTimetableData[i]["subject"] = ThurTimetableRealData[i]["subject"]!;
          ThurTimetableData[i]["professorName"] = ThurTimetableRealData[i]["professorName"]!;
          ThurTimetableData[i]["room"] = ThurTimetableRealData[i]["room"]!;
          print("작동");
        }
      }
      // 금
      for (int i = 0; i <= 7; i++) {
        if(FriTimetableData[i]["day"]! == FriTimetableData[i]["day"]!
            && FriTimetableData[i]["startTime"]! == FriTimetableData[i]["startTime"]!
            && FriTimetableData[i]["endTime"]! == FriTimetableData[i]["endTime"]!
        ) {
          FriTimetableData[i]["subject"] = FriTimetableRealData[i]["subject"]!;
          FriTimetableData[i]["professorName"] = FriTimetableRealData[i]["professorName"]!;
          FriTimetableData[i]["room"] = FriTimetableRealData[i]["room"]!;
          print("작동");
        }
      }
    });

    void modifyTimetableContent(String InputText) {
      print("작동중");
      print(InputText);
    }

    return Material(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      "월"
                  ),
                  Text(
                      "화"
                  ),
                  Text(
                      "수"
                  ),
                  Text(
                      "목"
                  ),
                  Text(
                      "금"
                  ),
                ],
              ),
              Row(
                children: [
                  // 수정 기능 테스트 코드
                  ElevatedButton(
                    child: Text('시간표 수정'),
                    onPressed: () {
                      showDialog(
                        // https://juntcom.tistory.com/269
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Dialog Title"),
                              content: Container(
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () => FocusScope.of(context).unfocus(),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: drawTimetable(),
                                          ),
                                          Text('$inputText'),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                                            child: TextField(
                                              controller: inputController,
                                              decoration: InputDecoration(
                                                labelText: 'Email',
                                                hintText: 'Enter your email',
                                                labelStyle: TextStyle(color: Colors.redAccent),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  borderSide:
                                                  BorderSide(width: 1, color: Colors.redAccent),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  borderSide:
                                                  BorderSide(width: 1, color: Colors.redAccent),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                ),
                                              ),
                                              keyboardType: TextInputType.emailAddress,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                                            child: TextField(
                                              controller: inputController,
                                              decoration: InputDecoration(
                                                labelText: 'Email',
                                                hintText: 'Enter your email',
                                                labelStyle: TextStyle(color: Colors.redAccent),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  borderSide:
                                                  BorderSide(width: 1, color: Colors.redAccent),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  borderSide:
                                                  BorderSide(width: 1, color: Colors.redAccent),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                ),
                                              ),
                                              keyboardType: TextInputType.emailAddress,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                inputText = inputController.text;
                                                modifyTimetableContent(inputText);
                                              });
                                            },
                                            child: Text('Update'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("Close"),
                                ),
                              ],
                            );
                          }
                      );
                    },
                  ),
                  // 삭제 기능 테스트 코드
                  ElevatedButton(
                    child: Text('시간표 추가'),
                    onPressed: () {
                      showDialog(
                        // https://juntcom.tistory.com/269
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Dialog Title"),
                              content: Container(
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () => FocusScope.of(context).unfocus(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text('$inputText'),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                                            child: TextField(
                                              controller: inputController,
                                              decoration: InputDecoration(
                                                labelText: 'Email',
                                                hintText: 'Enter your email',
                                                labelStyle: TextStyle(color: Colors.redAccent),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  borderSide:
                                                  BorderSide(width: 1, color: Colors.redAccent),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  borderSide:
                                                  BorderSide(width: 1, color: Colors.redAccent),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                ),
                                              ),
                                              keyboardType: TextInputType.emailAddress,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                inputText = inputController.text;
                                                modifyTimetableContent(inputText);
                                              });
                                            },
                                            child: Text('Update'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("Close"),
                                ),
                              ],
                            );
                          }
                      );
                    },
                  ),
                  // https://deku.posstree.com/ko/flutter/widget/textfield/
                  // 개인 추가 테스트 코드 작성 예정
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 80,
                      ),
                      for (int k = 0; k < 9; k++)
                        time(TIME[k]),
                    ],
                  ),
                  InkWell(
                    child: drawTimetable(),
                    onTap: () {
                      showDialog(
                        // https://juntcom.tistory.com/269
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Dialog Title"),
                              content: Container(
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () => FocusScope.of(context).unfocus(),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: drawTimetable(),
                                          ),
                                          Text('$inputText'),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                                            child: TextField(
                                              controller: inputController,
                                              decoration: InputDecoration(
                                                labelText: 'Email',
                                                hintText: 'Enter your email',
                                                labelStyle: TextStyle(color: Colors.redAccent),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  borderSide:
                                                  BorderSide(width: 1, color: Colors.redAccent),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  borderSide:
                                                  BorderSide(width: 1, color: Colors.redAccent),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                ),
                                              ),
                                              keyboardType: TextInputType.emailAddress,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                                            child: TextField(
                                              controller: inputController,
                                              decoration: InputDecoration(
                                                labelText: 'Email',
                                                hintText: 'Enter your email',
                                                labelStyle: TextStyle(color: Colors.redAccent),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  borderSide:
                                                  BorderSide(width: 1, color: Colors.redAccent),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  borderSide:
                                                  BorderSide(width: 1, color: Colors.redAccent),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                ),
                                              ),
                                              keyboardType: TextInputType.emailAddress,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                inputText = inputController.text;
                                                modifyTimetableContent(inputText);
                                              });
                                            },
                                            child: Text('Update'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("Close"),
                                ),
                              ],
                            );
                          }
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}