// 코딩 어느정도 한거

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Character card',
      home: MyCard(),
    );
  }
}

List<String> week = ['월', '화', '수', '목', '금'];
const int kColumnLength = 22;
const double kFirstColumnHeight = 20;
const double kBoxSize = 52;

class MyCard extends StatefulWidget {
  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  buildTimeColumn(context),
                  // 요일 열을 반복적으로 생성
                  ...List.generate(
                    week.length,
                        (index) => buildDayColumn(index),
                  ),
                ],
              ),
              height: (kColumnLength / 2 * kBoxSize + kColumnLength),
              // height: 22 / 2 * 52 + 22
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // print(kColumnLength / 2 * kBoxSize + kColumnLength);
                      // print(week[index]);
                    },
                    child: Text("추가"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // print(kColumnLength / 2 * kBoxSize + kColumnLength);
                      // print(week[index]);
                    },
                    child: Text("불러오기"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 시간 열을 생성하는 함수
Expanded buildTimeColumn(BuildContext context) {
  return Expanded(
    child: Column(
      children: [
        // 첫 번째 열의 높이를 맞추기 위해 빈 공간 추가
        SizedBox(
          height: kFirstColumnHeight,
        ),

        // 시간 값이 들어가는 열을 반복적으로 생성
        ...List.generate(
          kColumnLength,
              (index) {
            if (index % 2 == 0) {
              return const Divider(
                color: Colors.grey,
                height: 0,
              );
            }
            return SizedBox(
              height: kBoxSize,
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Center(
                        child: Text(
                            '${index ~/ 2 + 9}'
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    width: 0,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /*
                        ...List.generate(
                            5,
                            (index) {
                              return Row(
                                // 어떤 화면에서도 가능하게 + 픽셀 넘어가는거 해결
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.05, // 지피티 도움 받음
                                    width: MediaQuery.of(context).size.width * 0.075,
                                  ),
                                  Container(
                                    key: Key('container-$index'), // 지피티 도움 받음
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      color: index % 2 == 0 ? Colors.red : Colors.blue, // 지피티 도움 받음
                                    ),
                                    width: 70,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width:20,
                                  ),
                                ],
                              );
                            },
                            /*

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          width: 10,
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          width: 135,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          width: 10,
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          width: 135,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          width: 10,
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          width: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          width: 10,
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          width: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          width: 10,
                          height: 10,
                        ),
                                 */
                        ),
                        */
                        ...List.generate(
                          1, // 5개의 행 생성
                              (rowIndex) {
                            return Row(
                              children: [
                                // 각 SizedBox에 행 인덱스를 추가하여 고유한 키 생성
                                SizedBox(
                                  key: Key('sizedBox-$rowIndex-1'),
                                  height: MediaQuery.of(context).size.height * 0.05,
                                  width: MediaQuery.of(context).size.width * 0.075,
                                ),
                                // 행(rowIndex)와 열(colIndex)에 따라 각 Container에 접근 가능
                                ...List.generate(5, (colIndex) {
                                  return Row(
                                    children: [
                                      Container(
                                        key: Key('container-$rowIndex-$colIndex'), // 행, 열 위치로 키 설정
                                        decoration: BoxDecoration(
                                          color:
                                          (rowIndex + colIndex) % 2 == 0 ? Colors.red : Colors.blue, // 인덱스에 따른 색상 변경
                                        ),
                                        width: 70,
                                        height: 50,
                                      ),
                                      SizedBox(
                                        key: Key('sizedBox-$rowIndex-$colIndex-2'),
                                        height: MediaQuery.of(context).size.height * 0.1,
                                        width: MediaQuery.of(context).size.height * 0.1,
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        /*
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          width: 10,
          height: 10,
        ),
        SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: Container(
            color: Colors.red,
            width: 300.0,
            height: 300.0,
          ),
        ),
        */
      ],
    ),
  );
}

// 요일 열을 생성하는 함수
Widget buildDayColumn(int index) {
  return Expanded(
    flex: 4,
    child: Column(
      children: [
        // 세로 구분선 추가
        const VerticalDivider(
          color: Colors.grey,
          width: 30,
        ),
        SizedBox(
          height: 20,
          child: Center(
            child: Text(
                '${week[index]}' // 요일 텍스트 추가
            ),
          ),
        ),



        // 요일의 시간 박스를 반복적으로 생성
        ...List.generate(
          kColumnLength,
              (index) {
            if (index % 2 == 0) {
              return const Divider(
                  color: Colors.grey,
                  height: 0
              );
              // 짝수 인덱스에 구분선 추가
            }
            return SizedBox(
              height: kBoxSize,
              child: Container(),
            );
          },
        ),
      ],
    ),
  );
}

// 아마 지피티 원본
/*

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Character card',
      home: MyCard(),
    );
  }
}

List<String> week = ['월', '화', '수', '목', '금'];
const int kColumnLength = 22;
const double kFirstColumnHeight = 20;
const double kBoxSize = 52;

class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  List<LectureSlot> selectedLectures = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Character Card')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: (kColumnLength / 2 * kBoxSize) + kFirstColumnHeight,
                child: Row(
                  children: [
                    buildTimeColumn(),
                    for (int i = 0; i < week.length; i++) buildDayColumn(i, context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildTimeColumn() {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: kFirstColumnHeight,
          ),
          ...List.generate(
            kColumnLength.toInt(),
                (index) {
              if (index % 2 == 0) {
                return const Divider(
                  color: Colors.grey,
                  height: 0,
                );
              }
              return SizedBox(
                height: kBoxSize,
                child: Center(child: Text('${index ~/ 2 + 9}')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildDayColumn(int index, BuildContext context) {
    String currentDay = week[index];
    List<Widget> lecturesForTheDay = [];

    for (var lecture in selectedLectures) {
      for (int i = 0; i < lecture.day.length; i++) {
        double top = kFirstColumnHeight + (lecture.start[i] / 60.0) * kBoxSize;
        double height = ((lecture.end[i] - lecture.start[i]) / 60.0) * kBoxSize;

        if (lecture.day[i] == currentDay) {
          lecturesForTheDay.add(
            Positioned(
              top: top,
              left: 0,
              child: Stack(children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLectures.remove(lecture);
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: height,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    child: Text(
                      "${lecture.lname}\n${lecture.classroom[i]}",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ]),
            ),
          );
        }
      }
    }

    return Expanded(
      flex: 4,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
                child: Text('${week[index]}'),
              ),
              ...List.generate(
                kColumnLength.toInt(),
                    (index) {
                  if (index % 2 == 0) {
                    return const Divider(
                      color: Colors.grey,
                      height: 0,
                    );
                  }
                  return SizedBox(
                    height: kBoxSize,
                    child: Container(),
                  );
                },
              ),
            ],
          ),
          ...lecturesForTheDay, // 현재 요일에 해당하는 모든 강의를 Stack에 추가
        ],
      ),
    );
  }

  void showLectureSelection(BuildContext context) {
    ValueNotifier<String> searchTermNotifier = ValueNotifier<String>("");

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) => searchTermNotifier.value = value,
                        decoration: const InputDecoration(
                          labelText: '과목명',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<List<LectureSlot>>(
                  future: loadAllTimeSlots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      }

                      List<LectureSlot> allSubjects = snapshot.data!;

                      return ValueListenableBuilder<String>(
                        valueListenable: searchTermNotifier,
                        builder: (context, value, child) {
                          List<LectureSlot> filteredSubjects = allSubjects
                              .where((subject) => subject.lname.contains(value))
                              .toList();

                          return ListView.builder(
                            itemCount: filteredSubjects.length,
                            itemBuilder: (context, index) {
                              return buildLectureWidget(filteredSubjects[index], context);
                            },
                          );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class LectureSlot {
  final String lname;
  final List<String> day;
  final List<int> start;
  final List<int> end;
  final List<String> classroom;

  LectureSlot({
    required this.lname,
    required this.day,
    required this.start,
    required this.end,
    required this.classroom,
  });
}

Future<List<LectureSlot>> loadAllTimeSlots() async {
  // 예시 데이터로 대체
  await Future.delayed(Duration(seconds: 1));
  return [
    LectureSlot(
      lname: 'Math',
      day: ['월', '화'],
      start: [540, 600],
      end: [600, 660],
      classroom: ['101', '102'],
    ),
    // 필요한 만큼 더 추가 가능
  ];
}

Widget buildLectureWidget(LectureSlot slot, BuildContext context) {
  return ListTile(
    title: Text(slot.lname),
    onTap: () {
      // 원하는 동작 추가
    },
  );
}
*/