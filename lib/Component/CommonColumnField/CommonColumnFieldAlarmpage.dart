import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/color_theme.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/cosnt_value.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/text_styles.dart';

class CommonColumnFieldAlarmpage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String subtitle2;

  const CommonColumnFieldAlarmpage({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.subtitle2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // MaterialTheme theme = MaterialTheme(textTheme);

    // 텍스트 테마 및 컬러 테마를 불러옴
    final colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);

    return Column(
      children: [
        ListTile(
          leading: Icon(
          Icons.developer_board_rounded,
        ),

          // 제목 (title)
          // icon : X / TextStyle : titleLarge / color : scrim
          title: Text(
            title,
            style: textTheme.titleLarge?.copyWith( // bodyMedium 스타일을 기반으로 수정
              color: colorTheme.scrim, // 색상 변경
            ),
          ),

          // 내용 (subtitle)
          // icon : X / TextStyle : labelLarge / color : scrim
          // 날짜
          // icon : X / TextStyle : bodySmall / color : outline
          subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 내용 (subtitle)
                // icon : X / TextStyle : labelLarge / color : scrim
                Text(
                    subtitle,
                    style: textTheme.labelLarge?.copyWith( // bodyMedium 스타일을 기반으로 수정
                      color: colorTheme.scrim, // 색상 변경
                    ),
                ),
                // 날짜
                // icon : X / TextStyle : bodySmall / color : outline
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 100.0,
                    height: 30.0,
                    child: Center(
                      child: Text(
                        subtitle2,
                        style: textTheme.bodySmall?.copyWith( // bodyMedium 스타일을 기반으로 수정
                          color: colorTheme.outline, // 색상 변경
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        ),
      ],
    );
  }
}
