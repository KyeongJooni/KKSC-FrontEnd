// 저거 틀대로 컬러랑 폰트 유틸에 있는대로 지켜서 하고
// 텍스트 변경
// 아이콘이나 화면 넘어가는거
// 남의 화면에서 받아오는거
// api 하기

import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Component/CommonColumnField/CommonColumnField2.dart';

// util - 변수 및 폰트 지정 위한 dart
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/variable.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Restaurant/Restaurant.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_model.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/api/get_services.dart';

// component
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/cosnt_value.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/text_styles.dart';

class AlarmPageScreen extends StatefulWidget {
  const AlarmPageScreen({super.key});

  @override
  State<AlarmPageScreen> createState() => _AlarmPageScreenState();
}

class _AlarmPageScreenState extends State<AlarmPageScreen> {
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

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // MaterialTheme theme = MaterialTheme(textTheme);

    // 텍스트 테마 및 컬러 테마를 불러옴
    final colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);

    return Material(
      child: Column(
        children: [
          DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
                    Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
                title: const Text('Tabs Demo'),
              ),
              body: const TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ),
          FoodPartCollector(
              titleText[6],
              subTitleText[4],
              subTitleText[6],
              Icons.food_bank_outlined,
                  () => RestaurantScreen()
          ),
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