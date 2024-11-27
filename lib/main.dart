import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kksc_app_fe/Component/BottomNavbar.dart';
import 'package:kksc_app_fe/util/color_theme.dart';
import 'package:kksc_app_fe/util/cosnt_value.dart';
import 'package:kksc_app_fe/util/text_styles.dart';

void main() {
  //google fonts 라이선스 정책(폰트 라이선스 문서 파일 추가)
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //테마 설정(사용자 테마를 불러옴)
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    //텍스트 테마및 컬러 테마를 불러옴
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      //테마를 적용
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        home: GCG_Bottomnavbar(),
    );
  }
}