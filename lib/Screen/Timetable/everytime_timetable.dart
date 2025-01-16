import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kksc_app_fe/util/cosnt_value.dart';
import 'package:kksc_app_fe/util/text_styles.dart';

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

// 기본 데이터 (에브리타임 혹은 )
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
  {"day" : "목", "subject": "콜잉2", "startTime": "9", "endTime": "10", "professorName": "Angelo Apostolakis", "room": "글로벌센터-204"},
  {"day" : "목", "subject": "콜잉2", "startTime": "10", "endTime": "11", "professorName": "Angelo Apostolakis", "room": "글로벌센터-204"},
  {"day" : "목", "subject": "", "startTime": "11", "endTime": "12", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "13", "endTime": "14", "professorName": "", "room": ""},
  {"day" : "목", "subject": "", "startTime": "14", "endTime": "15", "professorName": "", "room": ""},
  {"day" : "목", "subject": "다문화", "startTime": "15", "endTime": "16", "professorName": "강혜정", "room": "실시간화상강의실"},
  {"day" : "목", "subject": "다문화", "startTime": "16", "endTime": "17", "professorName": "강혜정", "room": "실시간화상강의실"},
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
  {"day" : "금", "subject": "이산수학", "startTime": "9", "endTime": "10", "professorName": "조윤실", "room": "AI관-508"},
  {"day" : "금", "subject": "이산수학", "startTime": "10", "endTime": "11", "professorName": "조윤실", "room": "AI관-508"},
  {"day" : "금", "subject": "이산수학", "startTime": "11", "endTime": "12", "professorName": "조윤실", "room": "AI관-508"},
  {"day" : "금", "subject": "", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "금", "subject": "과기글", "startTime": "13", "endTime": "14", "professorName": "권승태", "room": "비전타워-306"},
  {"day" : "금", "subject": "과기글", "startTime": "14", "endTime": "15", "professorName": "권승태", "room": "비전타워-306"},
  {"day" : "금", "subject": "", "startTime": "15", "endTime": "16", "professorName": "", "room": ""},
  {"day" : "금", "subject": "", "startTime": "16", "endTime": "17", "professorName": "", "room": ""},
];

// 기본 데이터를 통한 시간표 그리기 및 다양한 용도로 활용
final List<List<Map<String, String>>> TimetableData = [
  MonTimetableData,
  TueTimetableData,
  WedTimetableData,
  ThurTimetableData,
  FriTimetableData,
];
final List<List<Map<String, String>>> TimetableRealData = [
  MonTimetableRealData,
  TueTimetableRealData,
  WedTimetableRealData,
  ThurTimetableRealData,
  FriTimetableRealData,
];

// 추가 활용? (테스트 데이터)
final List<Map<String, String>> AddTimetableRealData = [
  {"day" : "월", "subject": "이산수학 (영어강의)", "startTime": "9", "endTime": "10", "professorName": "윤유림", "room": "AI관-508"},
  {"day" : "월", "subject": "", "startTime": "10", "endTime": "11", "professorName": "조윤실", "room": "AI관-508"},
  {"day" : "화", "subject": "과학기술글쓰기", "startTime": "11", "endTime": "12", "professorName": "나지영", "room": "비전타워-202"},
  {"day" : "화", "subject": "", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "수", "subject": "과기글", "startTime": "13", "endTime": "14", "professorName": "권승태", "room": "비전타워-306"},
  {"day" : "수", "subject": "과기글", "startTime": "14", "endTime": "15", "professorName": "권승태", "room": "비전타워-306"},
  {"day" : "목", "subject": "지방자치의이해", "startTime": "15", "endTime": "16", "professorName": "", "room": ""},
  {"day" : "금", "subject": "", "startTime": "16", "endTime": "17", "professorName": "", "room": ""},
];
class TimetableScreen extends StatefulWidget {
  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  void modifyTimetableContent(String InputText) {
    print("작동중");
    print(InputText);
  }

  Widget time (String time, TextTheme textTheme, final colorTheme) {
    return Column(
      children: [
        Text(
          time,
          // icon : / TextStyle : / color :
          style: textTheme.labelMedium?.copyWith(
            color: colorTheme.scrim,
          ),
        ),
        SizedBox(
          // width: (MediaQuery.of(context).size.width / 5) - 6, // 한 위젯으로 했을 때 기준으로 원랜 한 20 ~ 30정도?
          height: (MediaQuery.of(context).size.height) / 8 + 25,
        ),
      ],
    );
  }

  Widget drawTimetable(List<List<Map<String, String>>> TimetableData, TextTheme textTheme, final colorTheme) {
    return Row(
      children: [
        for (int j = 0; j < 5; j++)
          Column(
            children: [
              for (int i = 0; i <= 7; i++)
                subjectWeek(i, TimetableData[j], "day", "subject", "professorName", "room", TIME[i], TIME[i+1], textTheme, colorTheme),
            ],
          ),
        /*
        Column(
          children: [
            for (int i = 0; i <= 7; i++)
              subjectWeek(i, TueTimetableData, "day", "subject", "professorName", "room", TIME[i], TIME[i+1]),
          ],
        ),
        Column(
          children: [
            for (int i = 0; i <= 7; i++)
              subjectWeek(i, WedTimetableData, "day", "subject", "professorName", "room", TIME[i], TIME[i+1]),
          ],
        ),
        Column(
          children: [
            for (int i = 0; i <= 7; i++)
              subjectWeek(i, ThurTimetableData, "day", "subject", "professorName", "room", TIME[i], TIME[i+1]),
          ],
        ),
        Column(
          children: [
            for (int i = 0; i <= 7; i++)
              subjectWeek(i, FriTimetableData, "day", "subject", "professorName", "room", TIME[i], TIME[i+1]),
          ],
        ),
        */
      ],
    );
  }

  Widget subjectWeek (int i, final List<Map<String, String>> weekTimetableData, String dataDay, String dataSubject, String dataProfessorName, String dataRoom, String dataStarttime, String dataEndtime, TextTheme textTheme, final colorTheme) {
    return Container(
      width: (MediaQuery.of(context).size.width / 5) - 20, // 한 위젯으로 했을 때 기준으로 원랜 한 20 ~ 30정도?
      height: (MediaQuery.of(context).size.height / 5) - 20,
      decoration: BoxDecoration(
        color: colorTheme.surface, // 테스트해보기!!
        border: Border.all(
          color: colorTheme.outline,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            weekTimetableData[i][dataSubject]!,
            style: textTheme.labelMedium?.copyWith(
              color: colorTheme.scrim,
            ),
          ),
          Text(
            // TimetableData[i]["professorName"]!,
            weekTimetableData[i][dataProfessorName]!,
            style: textTheme.labelMedium?.copyWith(
              color: colorTheme.scrim,
            ),
          ),
          Text(
            weekTimetableData[i][dataRoom]!,
            style: textTheme.labelMedium?.copyWith(
              color: colorTheme.scrim,
            ),
          ),
        ],
      ),
    );
  }

  // 이거 3개 기능 보면서 익스체인지하기
  Widget viewerwidget(TextEditingController inputController, String inputText, TextTheme textTheme, final colorTheme) {
    return AlertDialog(
      title: const Text (
          "Dialog Title"
      ),
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
                    child: drawTimetable(TimetableData, textTheme, colorTheme),
                  ),
                  // Text('$inputText'),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                    child: TextField(
                      controller: inputController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        // 임시
                        labelStyle: TextStyle(
                          // color: Colors.redAccent,
                          color: colorTheme.outline,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          // 임시
                          borderSide: BorderSide(
                            width: 1,
                            color: colorTheme.outline,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)
                          ),
                          //
                          borderSide: BorderSide(
                              width: 1,
                              color: Colors.redAccent
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)
                          ),
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
                        labelStyle: TextStyle(
                            color: Colors.redAccent
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)
                          ),
                          borderSide: BorderSide(
                              width: 1,
                              color: Colors.redAccent
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)
                          ),
                          borderSide: BorderSide(
                              width: 1,
                              color: Colors.redAccent
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)
                          ),
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

  /*
  Widget addWidget2() {

  }
  Widget modifywidget() {

  }
  */

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
    final List<Color> colorList = [
      colorTheme.primary,
      colorTheme.tertiary,
      colorTheme.inversePrimary,
      colorTheme.inverseSurface,
      colorTheme.outlineVariant,
    ];

    return Material(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "월",
                    style: textTheme.labelMedium?.copyWith(
                      color: colorTheme.scrim,
                    ),
                  ),
                  Text(
                    "화",
                    style: textTheme.labelMedium?.copyWith(
                      color: colorTheme.scrim,
                    ),
                  ),
                  Text(
                    "수",
                    style: textTheme.labelMedium?.copyWith(
                      color: colorTheme.scrim,
                    ),
                  ),
                  Text(
                    "목",
                    style: textTheme.labelMedium?.copyWith(
                      color: colorTheme.scrim,
                    ),
                  ),
                  Text(
                    "금",
                    style: textTheme.labelMedium?.copyWith(
                      color: colorTheme.scrim,
                    ),
                  ),
                ],
              ),
              /*
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
                            return modifywidget();
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
                            return addWidget2();
                          }
                      );
                    },
                  ),
                  // https://deku.posstree.com/ko/flutter/widget/textfield/
                  // 개인 추가 테스트 코드 작성 예정
                ],
              ),
              */
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
                        time(TIME[k], textTheme, colorTheme),
                    ],
                  ),
                  InkWell(
                    child: drawTimetable(TimetableData, textTheme, colorTheme),
                    onTap: () {
                      showDialog(
                        // https://juntcom.tistory.com/269
                          context: context,
                          builder: (BuildContext context) {
                            return viewerwidget(inputController, inputText, textTheme, colorTheme);
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