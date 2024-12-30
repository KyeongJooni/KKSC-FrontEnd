import 'package:flutter/material.dart';
import 'package:kksc_app_fe/Component/LabelCard.dart';

void main() {
  runApp(HoneytipApp()); // 'Honeytip' 대신 'HoneytipApp'으로 변경
}

class HoneytipApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gachon University Tips',
      home: HoneytipScreen(),
    );
  }
}

class HoneytipScreen extends StatefulWidget {
  @override
  _HoneytipScreenState createState() => _HoneytipScreenState();
}

class _HoneytipScreenState extends State<HoneytipScreen> {
  final List<Map<String, String>> insiderTipsData = [
    {"title": "새내기는 잘 모르는 스터디룸", "keyword": "Study", "hashtag": ""},
    {"title": "학교 근처 카페 추천", "keyword": "Food", "hashtag": "#카페인 충전하세요"},
    {"title": "강의실 꿀팁", "keyword": "Lecture", "hashtag": "#시간 절약"},
    {"title": "학교 주변 저렴한 식당", "keyword": "Food", "hashtag": "#가성비 맛집"},
  ];

  // insidertips 전체 표시 여부
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    final visibleTips =
        showAll ? insiderTipsData : insiderTipsData.take(2).toList();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // 첫 번째 섹션
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '선배들의 꿀팁',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                '편의 시설',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: LabelCard(
                        label: "Study",
                        name: "Library Access Pass",
                        text: "인원 24/7",
                      ),
                    ),
                    SizedBox(width: 16),
                    SizedBox(
                      width: 200,
                      child: LabelCard(
                        label: "Food",
                        name: "Cafeteria",
                        text: "메뉴 매일 업데이트",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // 두 번째 섹션
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 20,
                ),
                title: Text(
                  'Exclusive Insider Tips',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Secret shortcuts revealed',
                  style: TextStyle(fontSize: 12, color: Color(0xFF808080)),
                ),
              ),
              SizedBox(height: 20),
              Text(
                '새내기들을 위한 팁',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Image.asset(
                  'assets/img/icon/school.png',
                  width: 32,
                  height: 32,
                ),
                title: Text(
                  '학교 길안내',
                  style: TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  '복정동 가는 지름길',
                  style: TextStyle(color: Color(0xFF808080)),
                ),
              ),
              Divider(color: Color(0xFF808080)),
              ListTile(
                leading: Image.asset(
                  'assets/img/icon/bulb.png',
                  width: 32,
                  height: 32,
                ),
                title: Text(
                  '공부 팁',
                  style: TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  '학교에서 공부하기 좋은 곳',
                  style: TextStyle(color: Color(0xFF808080)),
                ),
              ),
              Divider(color: Color(0xFF808080)),
            ],
          ),
        ),

        //세번재 섹션
        Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 16),
                height: 40,
                child: Text(
                  "Insider Knowledge",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 24 / 18,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                children: visibleTips.map((tip) {
                  return InsiderTips(
                    title: tip["title"] ?? "",
                    keyword: tip["keyword"] ?? "",
                    hashtag: tip["hashtag"],
                  );
                }).toList(),
              ),
              // "Explore More" 버튼
              if (insiderTipsData.length > 2)
                TextButton(
                    onPressed: () {
                      setState(() {
                        showAll = !showAll; // 상태 반전
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 12, right: 12),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            showAll = !showAll; // 상태 반전
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromRGBO(3, 45, 239, 0.78),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // 버튼 모서리 둥글게
                          ),
                          minimumSize: const Size(336, 42),
                        ),
                        child: Text(
                          showAll ? "Fold" : "Explore More",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            height: 1.375, // 22 / 16 = 1.375
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )),
            ],
          ),
        ),
      ]),
    ));
  }
}

class InsiderTips extends StatelessWidget {
  const InsiderTips(
      {required this.title, required this.keyword, this.hashtag, this.img});
  final String title;
  final String keyword;
  final String? hashtag;
  final String? img; //이미지 크기 80인 정사각형에 넣으면 됨

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 336,
      height: 96,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.05)),
          ),
          SizedBox(
            width: 6,
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      height: 20 / 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4), // 텍스트 주변 여백
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8), // 텍스트와 경계 사이 여백
                      child: Text(
                        keyword,
                        style: TextStyle(
                          fontSize: 12,
                          height: 16 / 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(hashtag!,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                        height: 20 / 12,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
