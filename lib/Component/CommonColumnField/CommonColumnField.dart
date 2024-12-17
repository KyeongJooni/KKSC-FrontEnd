import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/color_theme.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/cosnt_value.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/text_styles.dart';

class CommonColumnField extends StatelessWidget {
  final IconData icon;
  final String title;

  const CommonColumnField({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final colorTheme = Theme.of(context).colorScheme;

    // 텍스트 테마 및 컬러 테마를 불러옴

    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);

    MaterialTheme theme = MaterialTheme(textTheme);

    return ListTile(
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
        style: textTheme.bodyMedium,
      ),
    );
  }
}
