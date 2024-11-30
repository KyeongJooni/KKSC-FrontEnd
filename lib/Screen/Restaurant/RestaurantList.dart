import 'package:flutter/material.dart';

class RestaurantView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('가천대학교'),
              Icon(Icons.menu), // 메뉴 아이콘 추가
            ],
          ),
          backgroundColor: Colors.blue,
        ),
        body: RestaurantListScreen(),
      ),
    );
  }
}

class RestaurantListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '내부 식당',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RestaurantButton(name: '제순식당'),
              RestaurantButton(name: '치미찌미'),
              RestaurantButton(name: '신역혼점'),
              RestaurantButton(name: '차이니스트'),
            ],
          ),
          SizedBox(height: 20),
          Text(
            '제순식당',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('영업시작 시간', style: TextStyle(fontSize: 16)),
              Text('10:00 AM', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('마감 시간', style: TextStyle(fontSize: 16)),
              Text('8:00 PM', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 20),
          Text(
            '메뉴',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('비빔밥, 된장찌개, 불고기'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ImagePlaceholder(name: '메뉴1'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ImagePlaceholder(name: '메뉴2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RestaurantButton extends StatelessWidget {
  final String name;
  RestaurantButton({required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 30,
          child: Icon(Icons.restaurant, color: Colors.white), // 아이콘 추가
        ),
        SizedBox(height: 5),
        Text(name, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  final String name;
  ImagePlaceholder({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.grey[200],
      child: Center(child: Text('$name 사진')),
    );
  }
}