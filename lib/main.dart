import 'package:flutter/material.dart';
import 'package:kksc_app_fe/util/color_theme.dart';
import 'package:kksc_app_fe/util/cosnt_value.dart';
import 'package:kksc_app_fe/util/router_setting.dart';
import 'package:kksc_app_fe/util/text_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, defaultFontName, defaultFontName);
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: mainRouter,
    );
  }
}