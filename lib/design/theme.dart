import '../export.dart';

class AppTheme {
  static final AppTheme instance = AppTheme._internal();
  AppTheme._internal();

  final _textTheme = const TextTheme(
    displayLarge: TS.displayLarge,
    displayMedium: TS.displayMedium,
    displaySmall: TS.displaySmall,
    headlineLarge: TS.headLarge,
    headlineMedium: TS.headMedium,
    headlineSmall: TS.headLarge,
    titleLarge: TS.titleLarge,
    titleMedium: TS.titleMedium,
    titleSmall: TS.titleSmall,
    labelLarge: TS.labelLarge,
    labelMedium: TS.labelMedium,
    labelSmall: TS.labelSmall,
    bodyLarge: TS.bodyLarge,
    bodyMedium: TS.bodyMedium,
    bodySmall: TS.bodySmall,
  );

  ThemeData createTheme(Brightness brightness) {
    return ThemeData(
      colorScheme: appColorScheme,
      useMaterial3: true,
      textTheme: _textTheme,
      fontFamily: 'Maplestory',
    );
  }
}

extension BuildContextThemeExtension on BuildContext {
  ColorScheme get c => Theme.of(this).colorScheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  TextTheme get text => Theme.of(this).textTheme;
}
