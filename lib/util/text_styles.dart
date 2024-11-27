import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//구글 font 라이브러리를 활용해서 폰트를 불러옴
TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
      TextTheme baseTextTheme = Theme.of(context).textTheme;
      TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
      TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
      //폰트 테마에 구글 폰트 적용
      TextTheme textTheme = displayTextTheme.copyWith(
            bodyLarge: bodyTextTheme.bodyLarge,
            bodyMedium: bodyTextTheme.bodyMedium,
            bodySmall: bodyTextTheme.bodySmall,
            labelLarge: bodyTextTheme.labelLarge,
            labelMedium: bodyTextTheme.labelMedium,
            labelSmall: bodyTextTheme.labelSmall,
            titleLarge: bodyTextTheme.titleLarge,
            titleMedium: bodyTextTheme.titleMedium,
            titleSmall: bodyTextTheme.titleSmall,
            displayLarge: bodyTextTheme.displayLarge,
            displayMedium: bodyTextTheme.displayMedium,
            displaySmall: bodyTextTheme.displaySmall,
            headlineLarge: bodyTextTheme.headlineLarge,
            headlineMedium: bodyTextTheme.headlineMedium,
            headlineSmall: bodyTextTheme.headlineSmall,
      );
      return textTheme;
}
