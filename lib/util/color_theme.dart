import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff3f5f90),
      surfaceTint: Color(0xff405f90),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd6e3ff),
      onPrimaryContainer: Color(0xff001b3d),
      secondary: Color(0xff7e570f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffddb0),
      onSecondaryContainer: Color(0xff281800),
      tertiary: Color(0xff49672e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcaeea6),
      onTertiaryContainer: Color(0xff0d2000),
      error: Color(0xff904a42),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad5),
      onErrorContainer: Color(0xff3b0906),
      background: Color(0xfff9f9ff),
      onBackground: Color(0xff191c20),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff181c1f),
      surfaceVariant: Color(0xffdfe2eb),
      onSurfaceVariant: Color(0xff43474e),
      outline: Color(0xff73777f),
      outlineVariant: Color(0xffc3c6cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3135),
      inverseOnSurface: Color(0xffeef1f6),
      inversePrimary: Color(0xffa9c7ff),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3d),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff264777),
      secondaryFixed: Color(0xffffddb0),
      onSecondaryFixed: Color(0xff281800),
      secondaryFixedDim: Color(0xfff2be6e),
      onSecondaryFixedVariant: Color(0xff614000),
      tertiaryFixed: Color(0xffcaeea6),
      onTertiaryFixed: Color(0xff0d2000),
      tertiaryFixedDim: Color(0xffaed18c),
      onTertiaryFixedVariant: Color(0xff324e18),
      surfaceDim: Color(0xffd7dadf),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffebeef3),
      surfaceContainerHigh: Color(0xffe5e8ed),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff3f5f90),
      surfaceTint: Color(0xff405f90),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5675a8),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff5c3d00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff976d25),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2e4a14),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5e7e42),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff6e3029),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffaa6057),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff9f9ff),
      onBackground: Color(0xff191c20),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff181c1f),
      surfaceVariant: Color(0xffdfe2eb),
      onSurfaceVariant: Color(0xff3f434a),
      outline: Color(0xff5b5f67),
      outlineVariant: Color(0xff777b83),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3135),
      inverseOnSurface: Color(0xffeef1f6),
      inversePrimary: Color(0xffa9c7ff),
      primaryFixed: Color(0xff5675a8),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3d5c8e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff976d25),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff7b540c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5e7e42),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff47642c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dadf),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffebeef3),
      surfaceContainerHigh: Color(0xffe5e8ed),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff3f5f90),
      surfaceTint: Color(0xff405f90),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff214373),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff311e00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5c3d00),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff112800),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff2e4a14),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff44100c),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff6e3029),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff9f9ff),
      onBackground: Color(0xff191c20),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffdfe2eb),
      onSurfaceVariant: Color(0xff20242b),
      outline: Color(0xff3f434a),
      outlineVariant: Color(0xff3f434a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3135),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffe5ecff),
      primaryFixed: Color(0xff214373),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff022c5b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5c3d00),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3f2800),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff2e4a14),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff193301),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dadf),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffebeef3),
      surfaceContainerHigh: Color(0xffe5e8ed),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa9c7ff),
      surfaceTint: Color(0xffa9c7ff),
      onPrimary: Color(0xff08305f),
      primaryContainer: Color(0xff264777),
      onPrimaryContainer: Color(0xffd6e3ff),
      secondary: Color(0xfff2be6e),
      onSecondary: Color(0xff442c00),
      secondaryContainer: Color(0xff614000),
      onSecondaryContainer: Color(0xffffddb0),
      tertiary: Color(0xffaed18c),
      onTertiary: Color(0xff1c3703),
      tertiaryContainer: Color(0xff324e18),
      onTertiaryContainer: Color(0xffcaeea6),
      error: Color(0xffffb4aa),
      onError: Color(0xff561e19),
      errorContainer: Color(0xff73342d),
      onErrorContainer: Color(0xffffdad5),
      background: Color(0xff111318),
      onBackground: Color(0xffe2e2e9),
      surface: Color(0xff0f1417),
      onSurface: Color(0xffdfe3e7),
      surfaceVariant: Color(0xff43474e),
      onSurfaceVariant: Color(0xffc3c6cf),
      outline: Color(0xff8d9199),
      outlineVariant: Color(0xff43474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inverseOnSurface: Color(0xff2c3135),
      inversePrimary: Color(0xff405f90),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3d),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff264777),
      secondaryFixed: Color(0xffffddb0),
      onSecondaryFixed: Color(0xff281800),
      secondaryFixedDim: Color(0xfff2be6e),
      onSecondaryFixedVariant: Color(0xff614000),
      tertiaryFixed: Color(0xffcaeea6),
      onTertiaryFixed: Color(0xff0d2000),
      tertiaryFixedDim: Color(0xffaed18c),
      onTertiaryFixedVariant: Color(0xff324e18),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff181c1f),
      surfaceContainer: Color(0xff1c2024),
      surfaceContainerHigh: Color(0xff262a2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa8c8ff),
      surfaceTint: Color(0xffa9c7ff),
      onPrimary: Color(0xff001633),
      primaryContainer: Color(0xff7391c6),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff7c271),
      onSecondary: Color(0xff211300),
      secondaryContainer: Color(0xffb7883e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb3d690),
      onTertiary: Color(0xff0a1a00),
      tertiaryContainer: Color(0xff7a9a5b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff330403),
      errorContainer: Color(0xffcc7b71),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff111318),
      onBackground: Color(0xffe2e2e9),
      surface: Color(0xff0f1417),
      onSurface: Color(0xfff8fbff),
      surfaceVariant: Color(0xff43474e),
      onSurfaceVariant: Color(0xffc7cbd3),
      outline: Color(0xff9fa3ab),
      outlineVariant: Color(0xff7f838b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inverseOnSurface: Color(0xff262b2e),
      inversePrimary: Color(0xff274878),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff00112a),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff113665),
      secondaryFixed: Color(0xffffddb0),
      onSecondaryFixed: Color(0xff1b0f00),
      secondaryFixedDim: Color(0xfff2be6e),
      onSecondaryFixedVariant: Color(0xff4b3100),
      tertiaryFixed: Color(0xffcaeea6),
      onTertiaryFixed: Color(0xff071500),
      tertiaryFixedDim: Color(0xffaed18c),
      onTertiaryFixedVariant: Color(0xff223d08),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff181c1f),
      surfaceContainer: Color(0xff1c2024),
      surfaceContainerHigh: Color(0xff262a2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa9c7ff),
      surfaceTint: Color(0xffa9c7ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb0ccff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf7),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xfff7c271),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff3ffe2),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb3d690),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff111318),
      onBackground: Color(0xffe2e2e9),
      surface: Color(0xff0f1417),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff43474e),
      onSurfaceVariant: Color(0xfffafaff),
      outline: Color(0xffc7cbd3),
      outlineVariant: Color(0xffc7cbd3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff002957),
      primaryFixed: Color(0xffdde7ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb0ccff),
      onPrimaryFixedVariant: Color(0xff001633),
      secondaryFixed: Color(0xffffe3bd),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xfff7c271),
      onSecondaryFixedVariant: Color(0xff211300),
      tertiaryFixed: Color(0xffcef2aa),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb3d690),
      onTertiaryFixedVariant: Color(0xff0a1a00),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff181c1f),
      surfaceContainer: Color(0xff1c2024),
      surfaceContainerHigh: Color(0xff262a2e),
      surfaceContainerHighest: Color(0xff313539),
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
    scaffoldBackgroundColor: colorScheme.background,
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
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
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
