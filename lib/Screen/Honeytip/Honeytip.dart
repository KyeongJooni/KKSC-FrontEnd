import 'package:flutter/material.dart';
import 'package:kksc_app_fe/Component/CommonColumnField.dart';

class Honeytip extends StatelessWidget {
  // 아이콘, 타이틀, 서브타이틀 리스트
  final List<Map<String, dynamic>> tips = [
    {
      'icon': Icons.lightbulb,
      'title': '꿀팁 1',
      'subtitle': '이것은 정말 유용한 팁입니다.',
    },
    {
      'icon': Icons.star,
      'title': '꿀팁 2',
      'subtitle': '이 팁을 놓치지 마세요!',
    },
    {
      'icon': Icons.check_circle,
      'title': '꿀팁 3',
      'subtitle': '여기에서 시작해보세요.',
    },
    {
      'icon': Icons.favorite,
      'title': '꿀팁 4',
      'subtitle': '이 팁은 사랑받을만합니다.',
    },
    {
      'icon': Icons.shield,
      'title': '꿀팁 5',
      'subtitle': '안전을 위해 기억하세요.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Honeytip Example'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                // tips 리스트에서 데이터 가져오기
                final tip = tips[index];
                return CommonColumnField(
                  icon: tip['icon'],
                  title: tip['title'],
                  subtitle: tip['subtitle'],
                );
              },
              childCount: tips.length, // 리스트 길이만큼 반복
            ),
          ),
        ],
      ),
    );
  }
}
