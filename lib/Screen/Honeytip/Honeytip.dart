import 'package:flutter/material.dart';
import 'HoneytipDetail.dart';
import 'HoneytipDetailWrite.dart';
import 'HoneytipSearch.dart';

void main() {
  runApp(HoneytipApp());
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
  // 현재 선택된 필터. 초기값은 null로 설정(모든 항목 표시).
  String? selectedFilter;

  // 데이터 리스트
  final List<Map<String, dynamic>> tips = [
    {
      'title': '시험 준비 꿀팁',
      'subtitle': '시험 기간에 효율적으로 공부하는 방법',
      'img': ['assets/img/icon/school.png'],
      'category': '핫 꿀팁', // 카테고리 추가
    },
    {
      'title': '과제 제출 꿀팁',
      'subtitle': '제출 마감일 놓치지 않는 방법',
      'img': ['assets/img/icon/bell.png', 'assets/img/icon/bulb.png'],
      'category': '핫 꿀팁', // 카테고리 추가
    },
    {
      'title': '시간 관리 꿀팁',
      'subtitle': '시간을 효과적으로 사용하는 방법',
      'img': ['assets/img/icon/pin.png','assets/img/icon/bell.png', 'assets/img/icon/bulb.png'],
      'category': '편의 사항 꿀팁', // 카테고리 추가
    },
    {
      'title': '교내 맛집 꿀팁',
      'subtitle': '교내에서 소문난 맛집',
      'img': ['assets/img/icon/pizza.png','assets/img/icon/bell.png','assets/img/icon/bulb.png','assets/img/icon/pin.png'],
      'category': '식당 꿀팁', // 카테고리 추가
    },
  ];


  @override
  Widget build(BuildContext context) {
    // 선택된 필터에 따라 데이터 필터링
    final filteredTips = selectedFilter == null
        ? tips // 필터가 선택되지 않은 경우 전체 항목 표시
        : tips.where((tip) => tip['category'] == selectedFilter).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 제목 섹션
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '꿀팁',
                    style: TextStyle(fontSize: 28, color: Color(0xFF171C1F)),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Color(0xFF171C1F)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ),
                      );
                      // 검색 버튼 클릭 시 동작
                    },
                  ),
                ],
              ),
            ),

            // 필터 버튼 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // 가로 스크롤 활성화
                child: Row(
                  children: [
                    FilterButton(
                      label: "핫 꿀팁",
                      isSelected: selectedFilter == "핫 꿀팁",
                      onTap: () {
                        setState(() {
                          selectedFilter = selectedFilter == "핫 꿀팁"
                              ? null // 선택된 필터를 다시 누르면 전체로 초기화
                              : "핫 꿀팁";
                        });
                      },
                    ),
                    SizedBox(width: 8),
                    FilterButton(
                      label: "편의 사항 꿀팁",
                      isSelected: selectedFilter == "편의 사항 꿀팁",
                      onTap: () {
                        setState(() {
                          selectedFilter = selectedFilter == "편의 사항 꿀팁"
                              ? null // 선택된 필터를 다시 누르면 전체로 초기화
                              : "편의 사항 꿀팁";
                        });
                      },
                    ),
                    SizedBox(width: 8),
                    FilterButton(
                      label: "식당 꿀팁",
                      isSelected: selectedFilter == "식당 꿀팁",
                      onTap: () {
                        setState(() {
                          selectedFilter = selectedFilter == "식당 꿀팁"
                              ? null // 선택된 필터를 다시 누르면 전체로 초기화
                              : "식당 꿀팁";
                        });
                      },
                    ),
                    SizedBox(width: 8),
                    FilterButton(
                      label: "꿀강 꿀팁",
                      isSelected: selectedFilter == "꿀강 꿀팁",
                      onTap: () {
                        setState(() {
                          selectedFilter = selectedFilter == "꿀강 꿀팁"
                              ? null // 선택된 필터를 다시 누르면 전체로 초기화
                              : "꿀강 꿀팁";
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16,),

            // 데이터 리스트 섹션
            if (filteredTips.isEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    '해당 꿀팁에 대한 글이 없습니다! 작성해주세요.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else
              ListView.separated(
                physics: NeverScrollableScrollPhysics(), // 스크롤 문제 방지
                shrinkWrap: true, // ListView를 Column 안에 넣을 때 필요
                itemCount: filteredTips.length,
                itemBuilder: (context, index) {
                  final tip = filteredTips[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HoneytipDetail(
                            title: tip['title']!,
                            subtitle: tip['subtitle']!,
                            img: List<String>.from(tip['img']), // img를 리스트로 변환
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 72, // 각 항목의 높이 72로 설정
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tip['title']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  tip['subtitle']!,
                                  style: TextStyle(fontSize: 14, color: Color(0x80000000)),
                                ),
                              ],
                            ),
                            Image.asset(
                              tip['img'][0], // 첫 번째 이미지 경로 사용
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.image, size: 64, color: Colors.grey);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },

                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey, // 구분선 색상
                    thickness: 1, // 구분선 두께
                    height: 0, // 구분선 위아래 여백
                  );
                },
              ),
          ],
        ),
      ),

      // 오른쪽 아래 작성 버튼 추가
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TipCreationScreen(),
            ),
          );
          // 버튼 클릭 시 동작 (새 글 작성 화면으로 이동)
        },
        child: Icon(Icons.edit), // + 아이콘
        backgroundColor: Color(0xFFE4E9ED),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

// 필터 버튼 위젯
class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
