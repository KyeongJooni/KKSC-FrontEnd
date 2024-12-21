import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/cosnt_value.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/text_styles.dart';

class CommonColumnFieldBasic extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CommonColumnFieldBasic({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // MaterialTheme theme = MaterialTheme(textTheme);

    // 텍스트 테마 및 컬러 테마를 불러옴
    final colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);

    return ListTile(
      leading: Text(
        title,
        style: textTheme.labelSmall?.copyWith( // bodyMedium 스타일을 기반으로 수정
          color: colorTheme.scrim, // 색상 변경
          fontWeight: FontWeight.bold,
        ),
      ),
      /*
      CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(
          icon,
          color: colorTheme.scrim,
        ),
      ),
      */
      title: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
        child: Text(
          subtitle,
          style: textTheme.labelSmall?.copyWith( // bodyMedium 스타일을 기반으로 수정
            color: colorTheme.scrim, // 색상 변경
          ),
        ),
      ),
    );
  }
}
