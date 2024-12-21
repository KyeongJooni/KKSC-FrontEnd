// 저거 틀대로 컬러랑 폰트 유틸에 있는대로 지켜서 하고
// 텍스트 변경
// 아이콘이나 화면 넘어가는거
// 남의 화면에서 받아오는거
// api 하기

// 기본 라이브러리
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnField.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnField2.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnFieldandReviewText.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/LabelCard.dart';

// component (foodinformation -> ReviewCard)
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/ReviewCard.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/ReviewCardTest.dart';

// 음식 관련 화면 이동 dart

// 음식 관련 리뷰 조회 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Restaurant/Restaurant.dart'; // food_ration_ui -> Restaurant

// 신입생 팁 관련 화면 이동 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/timetable_tip.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Honeytip/Honeytip.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Notice/Notice.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/freshman_tip.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Restaurant/RestaurantList.dart';

// util - 변수 및 폰트 지정 위한 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/theme.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/variable.dart';

// component
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/color_theme.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/cosnt_value.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/text_styles.dart';

void main() {
  runApp(
    ProviderScope(
      child: AlarmpageScreen(),
    ),
    // ProviderScope는 제거할 예정
  );
}

class AlarmpageScreen extends StatefulWidget {
  const AlarmpageScreen({super.key});

  @override
  State<AlarmpageScreen> createState() => _AlarmpageScreenState();
}

class _AlarmpageScreenState extends State<AlarmpageScreen> {
  Widget OtherPartCollector(String titleText, String subTitleText, String subTitleText2, IconData icon, Widget Function() widgetBuilder) {
    return InkWell(
      child: CommonColumnField2(
        icon: icon,
        title: titleText,
        subtitle: subTitleText,
        subtitle2: subTitleText2,
      ),
      // timetable_tip.dart로 넘어감 -> 추후 새로 구현 예정
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widgetBuilder(),
          ),
        );
      },
    );
  }

  Widget FoodPartCollector(String titleText, String subTitleText, String subTitleText2, IconData icon, Widget Function() widgetBuilder) {
    return InkWell(
      child: CommonColumnFieldandReviewText(
        icon: icon,
        title: titleText,
        subtitle: subTitleText,
        subtitle2: subTitleText2,
      ),
      // timetable_tip.dart로 넘어감 -> 추후 새로 구현 예정
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widgetBuilder(),
          ),
        );
      },
    );
  }

  // Declare the ScrollController
  ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> reviewData = [
    {"user": "사용자1", "name": "전주식당", "content": "맛있는 음식이었어요", "starCount": "5"},
    {"user": "사용자2", "name": "차이나타운", "content": "별로였어요", "starCount": "1"},
    {"user": "사용자3", "name": "차이나타운", "content": "음 굿", "starCount": "3"},
    {"user": "사용자4", "name": "엉터리분식", "content": "음 굿", "starCount": "3"},
    {"user": "사용자5", "name": "엉터리분식", "content": "별로였어요", "starCount": "1"},
  ];

  @override
  void dispose() {
    // Dispose the ScrollController when the widget is disposed
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // MaterialTheme theme = MaterialTheme(textTheme);

    // 텍스트 테마 및 컬러 테마를 불러옴
    final colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);

    return SingleChildScrollView(
      child: Column(
        children: [
          FoodPartCollector(titleText[6], subTitleText[4], subTitleText[6], Icons.food_bank_outlined, () => RestaurantScreen()),
          Divider(
            height: 1,
            color: Colors.grey[40],
            thickness: 1.0,
          ),

          FoodPartCollector(titleText[7], subTitleText[5], subTitleText[7], Icons.fastfood, () => RestaurantScreen()),
          Divider(
            height: 1,
            color: Colors.grey[40],
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
