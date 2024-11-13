// 테스트 완료 - 링크 어디갔지?
// 테스트 완료한 부분
// １。 시간표 틀 구현 완료
// -> 현재 9 ~ 17시에 대하여 17시부턴 시간이 유동적으로 늘어나지는 못함 (협의 하에 업데이트로 구현 예정?)
// ２。 시간표 관련하여 현재 row와 col로 분류해놓음
// -> 하나씩 개별로는 접근 불가 -> 반복문과 함수를 통한 접근 시 가능할 것으로 소견됨。
// ３。 추가 및 불러오기 버튼 구현 완료
// -> 기능 구현 예정 (아래 ６번 참조)

// 사후 파트 담당 시 구현 예정
// １。 시간표 과목 텍스트 및 담당 교수 표시 구현 예정
// ２。 시간표 과목 텍스트 및 (시간) 수정 구현 예정
// ３。 시간표 미디어 쿼리 구현 예정
// ４。 위젯 크기 초과 관련 오류 수정 예정
// -> 관련하여 어느 정도 구현을 완료한 줄 알았으나
// -> 컴퓨터 최대 화면과 스마트폰 홈 화면 모두에서 미디어 쿼리가 적용되지 않는 이슈가 있음
// ５。 삭제 구현 필요할 것으로 보임
// ６。 추가 및 불러오기 버튼 구현

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
                        child: Text('${index ~/ 2 + 9}'),
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.075,
                                ),
                                // 행(rowIndex)와 열(colIndex)에 따라 각 Container에 접근 가능
                                ...List.generate(5, (colIndex) {
                                  return Row(
                                    children: [
                                      Container(
                                        key: Key(
                                            'container-$rowIndex-$colIndex'), // 행, 열 위치로 키 설정
                                        decoration: BoxDecoration(
                                          color: (rowIndex + colIndex) % 2 == 0
                                              ? Colors.red
                                              : Colors.blue, // 인덱스에 따른 색상 변경
                                        ),
                                        width: 70,
                                        height: 50,
                                      ),
                                      SizedBox(
                                        key: Key(
                                            'sizedBox-$rowIndex-$colIndex-2'),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.1,
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
            child: Text('${week[index]}' // 요일 텍스트 추가
                ),
          ),
        ),

        // 요일의 시간 박스를 반복적으로 생성
        ...List.generate(
          kColumnLength,
          (index) {
            if (index % 2 == 0) {
              return const Divider(color: Colors.grey, height: 0);
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
