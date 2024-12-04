import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff003b7a),
      surfaceTint: Color(0xff205ead),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff225fae),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff805600),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffb942),
      onSecondaryContainer: Color(0xff4b3100),
      tertiary: Color(0xff396a00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff89cd4b),
      onTertiaryContainer: Color(0xff193400),
      error: Color(0xff9c0008),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffdc1b1b),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff9f9ff),
      onBackground: Color(0xff191c21),
      surface: Color(0xfff5fafe),
      onSurface: Color(0xff171c1f),
      surfaceVariant: Color(0xffdde2f3),
      onSurfaceVariant: Color(0xff414754),
      outline: Color(0xff727785),
      outlineVariant: Color(0xffc1c6d6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3134),
      inverseOnSurface: Color(0xffecf1f5),
      inversePrimary: Color(0xffaac7ff),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3e),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff00468d),
      secondaryFixed: Color(0xffffddb0),
      onSecondaryFixed: Color(0xff281800),
      secondaryFixedDim: Color(0xffffba45),
      onSecondaryFixedVariant: Color(0xff614000),
      tertiaryFixed: Color(0xffaff66e),
      onTertiaryFixed: Color(0xff0d2000),
      tertiaryFixedDim: Color(0xff94d955),
      onTertiaryFixedVariant: Color(0xff295000),
      surfaceDim: Color(0xffd5dbdf),
      surfaceBright: Color(0xfff5fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff4f8),
      surfaceContainer: Color(0xffe9eff3),
      surfaceContainerHigh: Color(0xffe4e9ed),
      surfaceContainerHighest: Color(0xffdee3e7),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff003b7a),
      surfaceTint: Color(0xff205ead),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff225fae),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff5c3d00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9d6b00),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff274c00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff478300),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffdc1b1b),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff9f9ff),
      onBackground: Color(0xff191c21),
      surface: Color(0xfff5fafe),
      onSurface: Color(0xff171c1f),
      surfaceVariant: Color(0xffdde2f3),
      onSurfaceVariant: Color(0xff3d4350),
      outline: Color(0xff5a5f6d),
      outlineVariant: Color(0xff757b89),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3134),
      inverseOnSurface: Color(0xffecf1f5),
      inversePrimary: Color(0xffaac7ff),
      primaryFixed: Color(0xff3d74c5),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff1c5baa),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff9d6b00),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff7d5400),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff478300),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff376800),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdf),
      surfaceBright: Color(0xfff5fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff4f8),
      surfaceContainer: Color(0xffe9eff3),
      surfaceContainerHigh: Color(0xffe4e9ed),
      surfaceContainerHighest: Color(0xffdee3e7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff00224a),
      surfaceTint: Color(0xff205ead),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004286),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff311e00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5c3d00),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff122800),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff274c00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0006),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff9f9ff),
      onBackground: Color(0xff191c21),
      surface: Color(0xfff5fafe),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffdde2f3),
      onSurfaceVariant: Color(0xff1e2430),
      outline: Color(0xff3d4350),
      outlineVariant: Color(0xff3d4350),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3134),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffe5ecff),
      primaryFixed: Color(0xff004286),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002c5d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5c3d00),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3f2800),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff274c00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff183300),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdf),
      surfaceBright: Color(0xfff5fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff4f8),
      surfaceContainer: Color(0xffe9eff3),
      surfaceContainerHigh: Color(0xffe4e9ed),
      surfaceContainerHighest: Color(0xffdee3e7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaac7ff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff002f64),
      primaryContainer: Color(0xff00468d),
      onPrimaryContainer: Color(0xffd3e0ff),
      secondary: Color(0xffffddaf),
      onSecondary: Color(0xff442c00),
      secondaryContainer: Color(0xfff6aa0d),
      onSecondaryContainer: Color(0xff3e2800),
      tertiary: Color(0xff9fe560),
      onTertiary: Color(0xff1b3700),
      tertiaryContainer: Color(0xff78ba3a),
      onTertiaryContainer: Color(0xff0f2300),
      error: Color(0xffffb4aa),
      onError: Color(0xff690003),
      errorContainer: Color(0xffcf0b13),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xff111318),
      onBackground: Color(0xffe1e2e9),
      surface: Color(0xff0e1417),
      onSurface: Color(0xffdee3e7),
      surfaceVariant: Color(0xff414754),
      onSurfaceVariant: Color(0xffc1c6d6),
      outline: Color(0xff8b90a0),
      outlineVariant: Color(0xff414754),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e7),
      inverseOnSurface: Color(0xff2b3134),
      inversePrimary: Color(0xff205ead),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3e),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff00468d),
      secondaryFixed: Color(0xffffddb0),
      onSecondaryFixed: Color(0xff281800),
      secondaryFixedDim: Color(0xffffba45),
      onSecondaryFixedVariant: Color(0xff614000),
      tertiaryFixed: Color(0xffaff66e),
      onTertiaryFixed: Color(0xff0d2000),
      tertiaryFixedDim: Color(0xff94d955),
      onTertiaryFixedVariant: Color(0xff295000),
      surfaceDim: Color(0xff0e1417),
      surfaceBright: Color(0xff343a3d),
      surfaceContainerLowest: Color(0xff090f12),
      surfaceContainerLow: Color(0xff171c1f),
      surfaceContainer: Color(0xff1b2023),
      surfaceContainerHigh: Color(0xff252b2e),
      surfaceContainerHighest: Color(0xff303639),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb1cbff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff001634),
      primaryContainer: Color(0xff5d91e4),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffddaf),
      onSecondary: Color(0xff3b2600),
      secondaryContainer: Color(0xfff6aa0d),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff9fe560),
      onTertiary: Color(0xff0e2200),
      tertiaryContainer: Color(0xff78ba3a),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5447),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff111318),
      onBackground: Color(0xffe1e2e9),
      surface: Color(0xff0e1417),
      onSurface: Color(0xfff7fbff),
      surfaceVariant: Color(0xff414754),
      onSurfaceVariant: Color(0xffc5cadb),
      outline: Color(0xff9da3b2),
      outlineVariant: Color(0xff7e8392),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e7),
      inverseOnSurface: Color(0xff252b2e),
      inversePrimary: Color(0xff00478f),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff00112b),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff00356e),
      secondaryFixed: Color(0xffffddb0),
      onSecondaryFixed: Color(0xff1b0f00),
      secondaryFixedDim: Color(0xffffba45),
      onSecondaryFixedVariant: Color(0xff4b3100),
      tertiaryFixed: Color(0xffaff66e),
      onTertiaryFixed: Color(0xff071500),
      tertiaryFixedDim: Color(0xff94d955),
      onTertiaryFixedVariant: Color(0xff1f3e00),
      surfaceDim: Color(0xff0e1417),
      surfaceBright: Color(0xff343a3d),
      surfaceContainerLowest: Color(0xff090f12),
      surfaceContainerLow: Color(0xff171c1f),
      surfaceContainer: Color(0xff1b2023),
      surfaceContainerHigh: Color(0xff252b2e),
      surfaceContainerHighest: Color(0xff303639),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffbfaff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb1cbff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf7),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffbf59),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff3ffe2),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff98de59),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff111318),
      onBackground: Color(0xffe1e2e9),
      surface: Color(0xff0e1417),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff414754),
      onSurfaceVariant: Color(0xfffbfaff),
      outline: Color(0xffc5cadb),
      outlineVariant: Color(0xffc5cadb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e7),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff002958),
      primaryFixed: Color(0xffdde7ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb1cbff),
      onPrimaryFixedVariant: Color(0xff001634),
      secondaryFixed: Color(0xffffe3bd),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffbf59),
      onSecondaryFixedVariant: Color(0xff211300),
      tertiaryFixed: Color(0xffb3fb72),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff98de59),
      onTertiaryFixedVariant: Color(0xff0a1a00),
      surfaceDim: Color(0xff0e1417),
      surfaceBright: Color(0xff343a3d),
      surfaceContainerLowest: Color(0xff090f12),
      surfaceContainerLow: Color(0xff171c1f),
      surfaceContainer: Color(0xff1b2023),
      surfaceContainerHigh: Color(0xff252b2e),
      surfaceContainerHighest: Color(0xff303639),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
