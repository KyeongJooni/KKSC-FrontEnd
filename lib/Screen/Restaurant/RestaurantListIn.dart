import 'package:flutter/material.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              print("이전 화면이 없습니다.");
            }
          },
        ),
        title: Text("내부 식당", style: textTheme.headlineMedium),
      ),
      body: const RestaurantListScreen(),
    );
  }
}

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '내부 식당',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RestaurantButton(name: '제순식당'),
                const SizedBox(width: 10),
                RestaurantButton(name: '치미치미'),
                const SizedBox(width: 10),
                RestaurantButton(name: '신역혼점'),
                const SizedBox(width: 10),
                RestaurantButton(name: '차이니스트'),
                const SizedBox(width: 10),
                RestaurantButton(name: '신의한컵'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RestaurantButton extends StatelessWidget {
  final String name;
  const RestaurantButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 30,
            child: const Icon(
              Icons.restaurant,
              color: Colors.white,
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
