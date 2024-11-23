import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget {
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 88,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NavigateButton(
                    text: "학교 내부 식당",
                    content: "🍔",
                  ),
                  SizedBox(width: 8,),
                  NavigateButton(
                    text: "외부 맛집",
                    content: "🍜",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NavigateButton extends StatelessWidget {
  final String text;
  final String content;

  const NavigateButton({required this.text, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 버튼 클릭 시 동작
        print("Navigator .. ");
      },
      child: Container(
        width: (MediaQuery.of(context).size.width-32)/2, // 버튼의 너비
        height: 88, // 버튼의 높이
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            width: 1,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    content,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Container(
                width: 156,
                height: 28,
                child: Center(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}