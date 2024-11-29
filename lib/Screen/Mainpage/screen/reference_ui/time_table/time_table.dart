// 아마 원본
// 테스트 완료 - 링크 어디갔지?
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

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Character Card')),
      body: Center(
        child: Container(
          child: Row(
            children: [
              buildTimeColumn(),
              ...List.generate(week.length, (index) => buildDayColumn(index)),
            ],
          ),
          height: kColumnLength / 2 * kBoxSize + kColumnLength,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

Expanded buildTimeColumn() {
  return Expanded(
    child: Column(
      children: [
        SizedBox(height: kFirstColumnHeight),
        ...List.generate(
          kColumnLength,
              (index) {
            if (index % 2 == 0) {
              return const Divider(color: Colors.grey, height: 0);
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

Widget buildDayColumn(int index) {
  return Expanded(
    flex: 4,
    child: Column(
      children: [
        const VerticalDivider(color: Colors.grey, width: 0),
        SizedBox(
          height: 20,
          child: Center(child: Text('${week[index]}')),
        ),
        ...List.generate(
          kColumnLength,
              (index) {
            if (index % 2 == 0) {
              return const Divider(color: Colors.grey, height: 0);
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
