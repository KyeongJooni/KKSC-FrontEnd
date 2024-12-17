import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/color_theme.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/cosnt_value.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/text_styles.dart';

class CommonColumnField2 extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String subtitle2;

  const CommonColumnField2({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
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
            child: Container(
              width: 200,
              height: 200,
              color: Colors.black,
            ),
            /*
            Icon(

              // TextStyle :
              // Color :
              icon,
              color: Colors.black,
            ),
            */
          ),

        ),

        Column(
          children: [
            ListTile(
              title: Text(
                title,

                // TextStyle :
                // Color :
                style: textTheme.bodyMedium,
              ),
            ),

            // 신입생 (SubTitleText0)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
              ],
            ),

            ListTile(
              subtitle: Text(
                subtitle,

                // TextStyle :
                // Color :
                style: textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
