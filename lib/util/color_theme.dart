import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff405f91),
      surfaceTint: Color(0xff405f91),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd6e3ff),
      onPrimaryContainer: Color(0xff001b3e),
      secondary: Color(0xff2c638b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcde5ff),
      onSecondaryContainer: Color(0xff001d31),
      tertiary: Color(0xff7e570f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffddb0),
      onTertiaryContainer: Color(0xff281800),
      error: Color(0xff904a42),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad5),
      onErrorContainer: Color(0xff3b0906),
      background: Color(0xfff9f9ff),
      onBackground: Color(0xff191c20),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      surfaceVariant: Color(0xffe0e4d6),
      onSurfaceVariant: Color(0xff44483e),
      outline: Color(0xff74796d),
      outlineVariant: Color(0xffc4c8ba),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inverseOnSurface: Color(0xffecf2f3),
      inversePrimary: Color(0xffaac7ff),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3e),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff274777),
      secondaryFixed: Color(0xffcde5ff),
      onSecondaryFixed: Color(0xff001d31),
      secondaryFixedDim: Color(0xff99ccfa),
      onSecondaryFixedVariant: Color(0xff084b72),
      tertiaryFixed: Color(0xffffddb0),
      onTertiaryFixed: Color(0xff281800),
      tertiaryFixedDim: Color(0xfff2be6e),
      onTertiaryFixedVariant: Color(0xff614000),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff224373),
      surfaceTint: Color(0xff405f91),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5775a8),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00476e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4579a3),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5c3d00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff976d25),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff6e3029),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffaa6057),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff9f9ff),
      onBackground: Color(0xff191c20),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      surfaceVariant: Color(0xffe0e4d6),
      onSurfaceVariant: Color(0xff40443a),
      outline: Color(0xff5c6155),
      outlineVariant: Color(0xff787c70),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inverseOnSurface: Color(0xffecf2f3),
      inversePrimary: Color(0xffaac7ff),
      primaryFixed: Color(0xff5775a8),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3e5c8e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4579a3),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff296089),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff976d25),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7b540c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff00224a),
      surfaceTint: Color(0xff405f91),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff224373),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00243c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff00476e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff311e00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5c3d00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff44100c),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff6e3029),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff9f9ff),
      onBackground: Color(0xff191c20),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffe0e4d6),
      onSurfaceVariant: Color(0xff21251c),
      outline: Color(0xff40443a),
      outlineVariant: Color(0xff40443a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffe5ecff),
      primaryFixed: Color(0xff224373),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff032c5b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff00476e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff002f4c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5c3d00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3f2800),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
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
      onPrimary: Color(0xff09305f),
      primaryContainer: Color(0xff274777),
      onPrimaryContainer: Color(0xffd6e3ff),
      secondary: Color(0xff99ccfa),
      onSecondary: Color(0xff003351),
      secondaryContainer: Color(0xff084b72),
      onSecondaryContainer: Color(0xffcde5ff),
      tertiary: Color(0xfff2be6e),
      onTertiary: Color(0xff442c00),
      tertiaryContainer: Color(0xff614000),
      onTertiaryContainer: Color(0xffffddb0),
      error: Color(0xffffb4aa),
      onError: Color(0xff561e18),
      errorContainer: Color(0xff73342d),
      onErrorContainer: Color(0xffffdad5),
      background: Color(0xff111318),
      onBackground: Color(0xffe2e2e9),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffdee3e5),
      surfaceVariant: Color(0xff44483e),
      onSurfaceVariant: Color(0xffc4c8ba),
      outline: Color(0xff8e9286),
      outlineVariant: Color(0xff44483e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inverseOnSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff405f91),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3e),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff274777),
      secondaryFixed: Color(0xffcde5ff),
      onSecondaryFixed: Color(0xff001d31),
      secondaryFixedDim: Color(0xff99ccfa),
      onSecondaryFixedVariant: Color(0xff084b72),
      tertiaryFixed: Color(0xffffddb0),
      onTertiaryFixed: Color(0xff281800),
      tertiaryFixedDim: Color(0xfff2be6e),
      onTertiaryFixedVariant: Color(0xff614000),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
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
      primaryContainer: Color(0xff7491c6),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff9dd0fe),
      onSecondary: Color(0xff001829),
      secondaryContainer: Color(0xff6395c1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff7c271),
      onTertiary: Color(0xff211300),
      tertiaryContainer: Color(0xffb7893e),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff330403),
      errorContainer: Color(0xffcc7b71),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff111318),
      onBackground: Color(0xffe2e2e9),
      surface: Color(0xff0e1415),
      onSurface: Color(0xfff6fcfd),
      surfaceVariant: Color(0xff44483e),
      onSurfaceVariant: Color(0xffc8ccbe),
      outline: Color(0xffa0a497),
      outlineVariant: Color(0xff808578),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inverseOnSurface: Color(0xff252b2c),
      inversePrimary: Color(0xff284878),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff00112b),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff133665),
      secondaryFixed: Color(0xffcde5ff),
      onSecondaryFixed: Color(0xff001322),
      secondaryFixedDim: Color(0xff99ccfa),
      onSecondaryFixedVariant: Color(0xff00395a),
      tertiaryFixed: Color(0xffffddb0),
      onTertiaryFixed: Color(0xff1b0f00),
      tertiaryFixedDim: Color(0xfff2be6e),
      onTertiaryFixedVariant: Color(0xff4b3100),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
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
      secondary: Color(0xfff9fbff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff9dd0fe),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff7c271),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff111318),
      onBackground: Color(0xffe2e2e9),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff44483e),
      onSurfaceVariant: Color(0xfff9fced),
      outline: Color(0xffc8ccbe),
      outlineVariant: Color(0xffc8ccbe),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff002958),
      primaryFixed: Color(0xffdde7ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb1cbff),
      onPrimaryFixedVariant: Color(0xff001634),
      secondaryFixed: Color(0xffd5e9ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff9dd0fe),
      onSecondaryFixedVariant: Color(0xff001829),
      tertiaryFixed: Color(0xffffe3bd),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff7c271),
      onTertiaryFixedVariant: Color(0xff211300),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
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
