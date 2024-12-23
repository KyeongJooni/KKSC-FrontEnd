// 학교 시간표 api 추출 및 시간표 구현기능 제공
// 시간표 수정 및 개인 추가 기능 구현(학교 시간표 api에 없는 것) (에브리타임과 유사하게 구현)

import 'package:flutter/material.dart';

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
  {"day" : "월", "subject": "AI 중심세상", "startTime": "11", "endTime": "12", "professorName": "", "room": ""},
  {"day" : "월", "subject": "AI 중심세상", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "월", "subject": "남정경", "startTime": "13", "endTime": "14", "professorName": "", "room": ""},
  {"day" : "월", "subject": "남정경", "startTime": "14", "endTime": "15", "professorName": "", "room": ""},
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
  {"day" : "화", "subject": "C언어", "startTime": "11", "endTime": "12", "professorName": "", "room": ""},
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
  {"day" : "수", "subject": "기세전", "startTime": "9", "endTime": "10", "professorName": "", "room": ""},
  {"day" : "수", "subject": "기세전", "startTime": "10", "endTime": "11", "professorName": "", "room": ""},
  {"day" : "수", "subject": "기세전", "startTime": "11", "endTime": "12", "professorName": "", "room": ""},
  {"day" : "수", "subject": "대겹중견", "startTime": "12", "endTime": "13", "professorName": "", "room": ""},
  {"day" : "수", "subject": "대겹중견", "startTime": "13", "endTime": "14", "professorName": "", "room": ""},
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

  Widget subjectWeek (int i, final List<Map<String, String>> weekTimetableData, String dataDay, String dataSubject, String dataProfessorName, String dataRoom, String dataStarttime, String dataEndtime) {
    return Container(
      width: (MediaQuery.of(context).size.width / 5) - 6, // 한 위젯으로 했을 때 기준으로 원랜 한 20 ~ 30정도?
      height: (MediaQuery.of(context).size.height / 5) - 6,
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
          Text(
            "s: " + dataStarttime + " / " + "e: " + dataEndtime,
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
                    Row(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              child: subjectWeek(0, MonTimetableData, "day", "subject", "professorName", "room", "9", "10"),
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
                            subjectWeek(1, MonTimetableData, "day", "subject", "professorName", "room", "10", "11"),
                            subjectWeek(2, MonTimetableData, "day", "subject", "professorName", "room", "11", "12"),
                            subjectWeek(3, MonTimetableData, "day", "subject", "professorName", "room", "12", "13"),
                            subjectWeek(4, MonTimetableData, "day", "subject", "professorName", "room", "13", "14"),
                            subjectWeek(5, MonTimetableData, "day", "subject", "professorName", "room", "14", "15"),
                            subjectWeek(6, MonTimetableData, "day", "subject", "professorName", "room", "15", "16"),
                            subjectWeek(7, MonTimetableData, "day", "subject", "professorName", "room", "16", "17"),
                          ],
                        ),
                        Column(
                          children: [
                            subjectWeek(1, TueTimetableData, "day", "subject", "professorName", "room", "10", "11"),
                            subjectWeek(2, TueTimetableData, "day", "subject", "professorName", "room", "11", "12"),
                            subjectWeek(3, TueTimetableData, "day", "subject", "professorName", "room", "12", "13"),
                            subjectWeek(4, TueTimetableData, "day", "subject", "professorName", "room", "13", "14"),
                            subjectWeek(5, TueTimetableData, "day", "subject", "professorName", "room", "14", "15"),
                            subjectWeek(6, TueTimetableData, "day", "subject", "professorName", "room", "15", "16"),
                            subjectWeek(7, TueTimetableData, "day", "subject", "professorName", "room", "16", "17"),
                          ],
                        ),
                        Column(
                          children: [
                            subjectWeek(0, WedTimetableData, "day", "subject", "professorName", "room", "9", "10"),
                            subjectWeek(1, WedTimetableData, "day", "subject", "professorName", "room", "10", "11"),
                            subjectWeek(2, WedTimetableData, "day", "subject", "professorName", "room", "11", "12"),
                            subjectWeek(3, WedTimetableData, "day", "subject", "professorName", "room", "12", "13"),
                            subjectWeek(4, WedTimetableData, "day", "subject", "professorName", "room", "13", "14"),
                            subjectWeek(5, WedTimetableData, "day", "subject", "professorName", "room", "14", "15"),
                            subjectWeek(6, WedTimetableData, "day", "subject", "professorName", "room", "15", "16"),
                            subjectWeek(7, WedTimetableData, "day", "subject", "professorName", "room", "16", "17"),
                          ],
                        ),
                        Column(
                          children: [
                            subjectThur(0, "day", "subject", "professorName", "room", "9", "10"),
                            subjectThur(1, "day", "subject", "professorName", "room", "10", "11"),
                            subjectThur(2, "day", "subject", "professorName", "room", "11", "12"),
                            subjectThur(3, "day", "subject", "professorName", "room", "12", "13"),
                            subjectThur(4, "day", "subject", "professorName", "room", "13", "14"),
                            subjectThur(5, "day", "subject", "professorName", "room", "14", "15"),
                            subjectThur(6, "day", "subject", "professorName", "room", "15", "16"),
                            subjectThur(7, "day", "subject", "professorName", "room", "16", "17"),
                          ],
                        ),
                        Column(
                          children: [
                            subjectFri(0, "day", "subject", "professorName", "room", "9", "10"),
                            subjectFri(1, "day", "subject", "professorName", "room", "10", "11"),
                            subjectFri(2, "day", "subject", "professorName", "room", "11", "12"),
                            subjectFri(3, "day", "subject", "professorName", "room", "12", "13"),
                            subjectFri(4, "day", "subject", "professorName", "room", "13", "14"),
                            subjectFri(5, "day", "subject", "professorName", "room", "14", "15"),
                            subjectFri(6, "day", "subject", "professorName", "room", "15", "16"),
                            subjectFri(7, "day", "subject", "professorName", "room", "16", "17"),
                          ],
                        ),
                      ],
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