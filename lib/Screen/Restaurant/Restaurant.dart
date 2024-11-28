import 'package:kksc_app_fe/Component/ReviewCard.dart';
import 'package:flutter/material.dart';
import 'package:kksc_app_fe/Screen/Restaurant/RestaurantList.dart';
import 'package:kksc_app_fe/Component/LabelCard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Restaurant extends StatelessWidget {
  final List<Map<String, String>> cardData = [
    {
      "label": "한식",
      "img": "assets/img/restrauntExample1.jpeg",
      "name": "화리화리",
      "text": "평점: 4.5"
    },
    {"label": "한식", "img": "", "name": "전주식당", "text": "평점: 4.7"},
    {"label": "중식", "img": "", "name": "차이나타운", "text": "평점: 4.3"},
    {"label": "분식", "img": "", "name": "엉터리분식", "text": "평점: 4.8"},
  ];

  final List<Map<String, String>> reviewData = [
    {"user": "사용자1", "content": "맛있는 음식이었어요", "starCount": "5"},
    {"user": "사용자2", "content": "별로였어요", "starCount": "1"},
    {"user": "사용자3", "content": "음 굿", "starCount": "3"}
  ];

  final List<Map<String, String>> famousRestaurantData = [
    {
      "restaurant": "화리화리",
      "img": "assets/img/restrauntExample1.jpeg",
      "userName": "맛집 블로거",
      "content": "추천합니다",
      "keyword": "추천"
    },
    {
      "restaurant": "화리화리",
      "img": "assets/img/restrauntExample1.jpeg",
      "userName": "맛집 블로거",
      "content": "추천합니다",
      "keyword": "추천"
    },
    {
      "restaurant": "화리화리",
      "img": "assets/img/restrauntExample1.jpeg",
      "userName": "맛집 블로거",
      "content": "추천합니다",
      "keyword": "추천"
    },
    {
      "restaurant": "화리화리",
      "img": "assets/img/restrauntExample1.jpeg",
      "userName": "맛집 블로거",
      "content": "추천합니다",
      "keyword": "추천"
    },
    {
      "restaurant": "전주식당",
      "img": "",
      "userName": "흠",
      "content": "아주 맛있어요",
      "keyword": "분위기"
    },
    {
      "restaurant": "차이나타운",
      "img": "",
      "userName": "흠",
      "content": "아주 맛있어요",
      "keyword": "단체"
    },
  ];

  final List<Map<String, String>> FamousRstrnData = [
    {"type": "한식", "content": "이 식당은 한식 메뉴를 추천해요", "userName": "식당리뷰러"},
    {"type": "중식", "content": "이 식당은 중식 메뉴를 추천해요", "userName": "맛집리뷰러"},
    {"type": "양식", "content": "이 식당은 양식 메뉴를 추천해요", "userName": "양식냠"},
    {"type": "일식", "content": "이 식당은 일식 메뉴를 추천해요", "userName": "오이시"},
  ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> groupedData =
        processFamousRestaurantData(famousRestaurantData);

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(top: 12, bottom: 8),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 12, right: 8, bottom: 12, left: 16),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      blurRadius: 6,
                      offset: Offset(0, -3)),
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      blurRadius: 6,
                      offset: Offset(0, 3))
                ],
              ),
              child: const Text(
                "식당과 맛집 리뷰",
                style: TextStyle(
                  fontSize: 20,
                  height: 24 / 20,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 88,
            child: const Padding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NavigateButton(
                    text: "학교 내부 식당",
                    icon: "🍔",
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  NavigateButton(
                    text: "외부 맛집",
                    icon: "🍜",
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(right: 12, left: 12, top: 8),
          sliver: SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetTitle(title: "인기 맛집 추천"),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 224, // 고정된 가로 스크롤 영역 높이
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cardData.length,
                  itemBuilder: (context, index) {
                    final item = cardData[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 0 : 4, // 첫 번째 카드의 왼쪽 간격 없음
                        right: index == cardData.length - 1
                            ? 0
                            : 4, // 마지막 카드의 오른쪽 간격 없음
                      ),
                      child: LabelCard(
                        label: item["label"],
                        img: item["img"],
                        name: item["name"]!,
                        text: item["text"]!,
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
        ),
        SliverPadding(
          padding: EdgeInsets.only(right: 12, left: 12, top: 8),
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetTitle(
                  title: "사용자 리뷰",
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    height: 116,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reviewData.length,
                      itemBuilder: (context, index) {
                        final item = reviewData[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 0 : 4, // 첫 번째 카드의 왼쪽 간격 없음
                            right: index == cardData.length - 1
                                ? 0
                                : 4, // 마지막 카드의 오른쪽 간격 없음
                          ),
                          child: ReviewCard(
                              user: item["user"]!,
                              content: item["content"]!,
                              starCount: item["starCount"]!),
                        );
                      },
                    ))
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(right: 12, left: 12, top: 8),
          sliver: SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetTitle(title: "맛집 소식"),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 254, // 고정된 가로 스크롤 영역 높이
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: groupedData.length,
                  itemBuilder: (context, index) {
                    final item = groupedData[index];
                    return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 0 : 4, // 첫 번째 카드의 왼쪽 간격 없음
                          right: index == cardData.length - 1
                              ? 0
                              : 4, // 마지막 카드의 오른쪽 간격 없음
                        ),
                        child: FamousRestaurantCard(
                          restaurant: item["restaurant"]!,
                          imgList: item["imgList"],
                          userName: item["userName"]!,
                          content: item["content"]!,
                          keyword: item["keyword"]!,
                        ));
                  },
                ),
              ),
            ],
          )),
        ),
        SliverPadding(
            padding: EdgeInsets.only(right: 12, left: 12, top: 8),
            sliver: SliverToBoxAdapter(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  GetTitle(title: "맛집 리뷰"),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 112, // 고정된 가로 스크롤 영역 높이
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: FamousRstrnData.length,
                      itemBuilder: (context, index) {
                        final item = FamousRstrnData[index];
                        return Padding(
                            padding: EdgeInsets.only(
                              left: index == 0 ? 0 : 4, // 첫 번째 카드의 왼쪽 간격 없음
                              right: index == cardData.length - 1
                                  ? 0
                                  : 4, // 마지막 카드의 오른쪽 간격 없음
                            ),
                            child: FamousRstrnReview(
                              type: item["type"]!,
                              userName: item["userName"]!,
                              content: item["content"]!,
                            ));
                      },
                    ),
                  ),
                ])))
      ],
    );
  }
}

class GetTitle extends StatelessWidget {
  String title;
  GetTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      height: 40,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 24 / 18,
        ),
      ),
    );
  }
}

class NavigateButton extends StatelessWidget {
  final String text;
  final String icon;

  const NavigateButton({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text == "학교 내부 식당") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return RestaurantView();
              },
            ),
          );
        } else {
          print("학교 외부 식당");
        }
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        width: (MediaQuery.of(context).size.width - 32) / 2,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  icon,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 156,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 14 / 10,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> processFamousRestaurantData(
    List<Map<String, String>> data) {
  Map<String, Map<String, dynamic>> groupedData = {};

  for (var item in data) {
    String uniqueKey =
        "${item['restaurant']}_${item['userName']}_${item['content']}_${item['keyword']}";

    if (!groupedData.containsKey(uniqueKey)) {
      groupedData[uniqueKey] = {
        "restaurant": item["restaurant"],
        "userName": item["userName"],
        "content": item["content"],
        "keyword": item["keyword"],
        "imgList": <String?>[item["img"]],
      };
    } else {
      groupedData[uniqueKey]!["imgList"].add(item["img"]);
    }
  }

  // Map의 값을 리스트로 변환
  return groupedData.values.toList();
}

class FamousRestaurantCard extends StatefulWidget {
  final String restaurant;
  final List<String?> imgList;
  final String userName;
  final String content;
  final String keyword;

  const FamousRestaurantCard({
    required this.restaurant,
    required this.imgList,
    required this.userName,
    required this.content,
    required this.keyword,
  });

  @override
  State<FamousRestaurantCard> createState() => _FamousRestaurantCardState();
}

class _FamousRestaurantCardState extends State<FamousRestaurantCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      // `round()`를 호출하여 정확한 페이지 값 가져옴
      final page = _pageController.page?.round() ?? 0;
      if (_currentPage != page) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 164, // 카드 너비
      height: 254, // 카드 높이
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            SizedBox(
              width: 164,
              height: 164,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.imgList.length,
                itemBuilder: (context, index) {
                  final img = widget.imgList[index];
                  return img != null && img.isNotEmpty
                      ? Image.asset(
                          img,
                          width: 164,
                          height: 164,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 164,
                          height: 164,
                          color: Colors.grey[200],
                          child: Center(
                            child: Text(
                              "No Image",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
            Positioned(
              bottom: 8,
              child: AnimatedSmoothIndicator(
                activeIndex: _currentPage,
                count: widget.imgList.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.white,
                  dotColor: Color.fromRGBO(255, 255, 255, 0.8),
                  dotWidth: 4.0,
                  dotHeight: 4,
                  expansionFactor: 2.5, // 활성화된 점의 크기 확장 비율
                  spacing: 4.0,
                ),
              ),
            ),
          ]),
          Container(
            height: 88,
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 텍스트 내용
                Text(
                  widget.content,
                  maxLines: 2,
                  style: textTheme.bodySmall,
                ),
                SizedBox(height: 8),
                // 키워드
                Container(
                  width: 45,
                  height: 20,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    border: Border.all(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: Text(
                      widget.keyword,
                      style: textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(widget.userName,
                          style: textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FamousRstrnReview extends StatelessWidget {
  final String type;
  final String content;
  final String userName;

  const FamousRstrnReview(
      {required this.type, required this.userName, required this.content});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            width: 244,
            height: 98,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text("$type 맛집"),
                ),
                Container(
                  width: 45,
                  height: 20,
                  padding:
                      EdgeInsets.only(top: 2, bottom: 2, left: 4, right: 4),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    border: Border.all(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: Text(
                      type,
                      style: textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(content,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12,
                        height: 20 / 12,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(userName,
                        style: textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
