import 'package:flutter/material.dart';
import 'package:kksc_app_fe/Component/TopAppbar.dart';
import 'package:kksc_app_fe/Component/BottomNavbar.dart';
import 'package:kksc_app_fe/util/text_styles.dart';

class RestaurantListOut extends StatelessWidget {
  const RestaurantListOut({super.key});

  void _onlogopressed() {}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                print("이전화면이 없습니다.");
              }
            },
          ),
          title: Text("외부 식당", style: textTheme.headlineMedium),
          actions: [SizedBox(), SizedBox()],
        ),
        body: RestaurantListScreen(),
      ),
    );
  }
}

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '학교 밖 맛집',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RestaurantButton(name: '전주식당'),
                const SizedBox(width: 10),
                RestaurantButton(name: '황궁 중화요리'),
                const SizedBox(width: 10),
                RestaurantButton(name: '화리화리'),
                const SizedBox(width: 10),
                RestaurantButton(name: '일촌'),
                const SizedBox(width: 10),
                RestaurantButton(name: '노브랜드버거'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            '전주식당',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('영업시작 시간', style: TextStyle(fontSize: 16)),
              Text('10:00 AM',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('마감 시간', style: TextStyle(fontSize: 16)),
              Text('8:00 PM',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '메뉴',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ImagePlaceholder(name: '메뉴1'),
                const SizedBox(width: 10),
                ImagePlaceholder(name: '메뉴2'),
                const SizedBox(width: 10),
                ImagePlaceholder(name: '메뉴3'),
                const SizedBox(width: 10),
                ImagePlaceholder(name: '메뉴4'),
                const SizedBox(width: 10),
                ImagePlaceholder(name: '메뉴5'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantButton extends StatelessWidget {
  final String name;
  const RestaurantButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80, // 버튼 크기 지정
      child: Column(
        children: [
          Transform.translate(
            offset: const Offset(0, 0), // 동그라미 버튼을 위로 10px 올리기
            child: CircleAvatar(
              backgroundColor: Colors.grey[300], // 모든 버튼 동일 배경색
              radius: 30,
              child: const Icon(
                Icons.restaurant, // 아이콘도 동일하게 설정
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  final String name;
  const ImagePlaceholder({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150, // 메뉴 이미지 너비 추가
      color: Colors.grey[200],
      child: Center(child: Text('$name 사진')),
    );
  }
}
