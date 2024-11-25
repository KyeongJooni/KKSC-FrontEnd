import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kksc_app_fe/Screen/Restaurant/RestaurantList.dart';
import 'package:kksc_app_fe/Component/LabelCard.dart';

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

  @override
  Widget build(BuildContext context) {
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
                height: 250, // 고정된 가로 스크롤 영역 높이
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
                height: 250, // 고정된 가로 스크롤 영역 높이
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
                      //child:
                    );
                  },
                ),
              ),
            ],
          )),
        ),
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
        style: TextStyle(
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
        // 버튼 클릭 시 동작
        // 버튼 클릭 시 동작
        print("Navigator .. ");
        if (text == "학교 내부 식당") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                print("학교 내부 식당");
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
        width: (MediaQuery.of(context).size.width - 32) / 2, // 버튼의 너비
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
            Container(
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

class ReviewCard extends StatelessWidget {
  final String user;
  final String content;
  final String starCount;

  const ReviewCard(
      {required this.user, required this.content, required this.starCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 116,
      padding: EdgeInsets.all(12),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: Color.fromRGBO(0, 0, 0, 0.05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 196,
            height: 24,
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.1),
                      borderRadius: BorderRadius.circular(24)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  width: 100,
                  child: Text(
                    user,
                    style: const TextStyle(
                        height: 16 / 12,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                for (int i = 0; i < int.parse(starCount); i++)
                  const Icon(
                    Icons.star,
                    size: 12,
                    color: Color.fromRGBO(255, 199, 0, 1),
                  ),
                for (int i = 0; i < 5 - int.parse(starCount); i++)
                  const Icon(
                    Icons.star,
                    size: 12,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: 196,
            height: 60,
            child: Text(
              content,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
