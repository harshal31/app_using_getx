import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 131, 85, 0),
);

final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 239, 104, 6),
);

ThemeData darkTheme() => ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kDarkColorScheme.primaryContainer,
        foregroundColor: kDarkColorScheme.onPrimaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
        elevation: 6.0,
      ),
      textTheme: GoogleFonts.jetBrainsMonoTextTheme(
        ThemeData.dark().copyWith(brightness: Brightness.dark).textTheme,
      ),
    );

ThemeData lightTheme() => ThemeData.light().copyWith(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kColorScheme.primaryContainer,
      foregroundColor: kColorScheme.onPrimaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
      elevation: 6.0,
    ),
    textTheme: GoogleFonts.jetBrainsMonoTextTheme(
      ThemeData.light(useMaterial3: true)
          .copyWith(brightness: Brightness.light)
          .textTheme,
    ));

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }

  ColorScheme colorScheme() {
    return Theme.of(this).colorScheme;
  }
}
