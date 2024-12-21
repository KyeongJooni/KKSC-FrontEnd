/*
import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/color_theme.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/cosnt_value.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/text_styles.dart';

class CommonColumnFieldandReviewText extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String subtitle2;

  const CommonColumnFieldandReviewText({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.subtitle2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final colorTheme = Theme.of(context).colorScheme;

    // 텍스트 테마 및 컬러 테마를 불러옴

    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);

    MaterialTheme theme = MaterialTheme(textTheme);

    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(

              // TextStyle :
              // Color :
              icon,
              color: Colors.black,
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
          subtitle: Text(
            subtitle,

            // TextStyle :
            // Color :
            style: textTheme.labelLarge?.copyWith( // bodyMedium 스타일을 기반으로 수정
              color: colorTheme.scrim, // 색상 변경
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                subtitle2,
                style: textTheme.bodySmall?.copyWith( // bodyMedium 스타일을 기반으로 수정
                  color: colorTheme.scrim, // 색상 변경
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
*/
