import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/color_theme.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/cosnt_value.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/text_styles.dart';

class CommonColumnFieldAlarmpage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String subtitle2;

  const CommonColumnFieldAlarmpage({
    Key? key,
    required this.icon,
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
        leading: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        ),
        title: Text(
            title,

            // TextStyle :
            // Color :
            style: textTheme.titleLarge?.copyWith( // bodyMedium 스타일을 기반으로 수정
              color: colorTheme.scrim, // 색상 변경
            ),
          ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 신입생
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 100.0,
                      height: 30.0,
                      // 신입생 (SubTitleText0) + 텍스트 스타일 (폰트) 지정하기
                      child: Center(
                        child: Text(
                          subtitle2,
                          style: textTheme.bodySmall?.copyWith( // bodyMedium 스타일을 기반으로 수정
                            color: colorTheme.scrim, // 색상 변경
                          ),
                        ),
                      ),
                      // 스타일 따로 지정 예정
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  ),
                Text(
                    subtitle,
                    // TextStyle :
                    // Color :
                    style: textTheme.labelLarge?.copyWith( // bodyMedium 스타일을 기반으로 수정
                      color: colorTheme.scrim, // 색상 변경
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
