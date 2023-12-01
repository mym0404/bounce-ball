import '../../export.dart';

abstract interface class C {
  static const primary = Color(0xFFAAC7FF);
  static const onPrimary = Color(0xFF002F64);
  static const primaryContainer = Color(0xFF00458D);
  static const onPrimaryContainer = Color(0xFFD6E3FF);
  static const secondary = Color(0xFFBEC6DC);
  static const onSecondary = Color(0xFF283141);
  static const secondaryContainer = Color(0xFF3E4759);
  static const onSecondaryContainer = Color(0xFFDAE2F9);
  static const tertiary = Color(0xFFB0C6FF);
  static const onTertiary = Color(0xFF002C6F);
  static const tertiaryContainer = Color(0xFF01419C);
  static const onTertiaryContainer = Color(0xFFD9E2FF);
  static const error = Color(0xFFFFB4AB);
  static const errorContainer = Color(0xFF93000A);
  static const onError = Color(0xFF690005);
  static const onErrorContainer = Color(0xFFFFDAD6);
  static const bg = Color(0xFF1A1A1A);
  static const onBg = Color(0xFFE3E3E3);
  static const surface = Color(0xFF1A1A1A);
  static const onSurface = Color(0xFFF3F3F3);
  static const surfaceVariant = Color(0xFF44474E);
  static const onSurfaceVariant = Color(0xFFC4C6D0);
  static const outline = Color(0xFF8E9099);
  static const onInverseSurface = Color(0xFF1A1A1A);
  static const inverseSurface = Color(0xFFE3E3E3);
  static const inversePrimary = Color(0xFF2A5EA7);
  static const shadow = Color(0xFF000000);
  static const surfaceTint = Color(0xFFAAC7FF);

  static Color get surface30 => surface.withOpacity(0.3);
  static Color get surface50 => surface.withOpacity(0.5);
  static Color get surface70 => surface.withOpacity(0.7);
  static Color get onSurface30 => onSurface.withOpacity(0.3);
  static Color get onSurface50 => onSurface.withOpacity(0.5);
  static Color get onSurface70 => onSurface.withOpacity(0.7);
  static Color get primary30 => primary.withOpacity(0.3);
  static Color get primary50 => primary.withOpacity(0.5);
  static Color get primary70 => primary.withOpacity(0.7);

  static const white = Colors.white;
  static const black = Colors.black;
  static const transparent = Colors.transparent;
}

const appColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFAAC7FF),
  onPrimary: Color(0xFF002F64),
  primaryContainer: Color(0xFF00458D),
  onPrimaryContainer: Color(0xFFD6E3FF),
  secondary: Color(0xFFBEC6DC),
  onSecondary: Color(0xFF283141),
  secondaryContainer: Color(0xFF3E4759),
  onSecondaryContainer: Color(0xFFDAE2F9),
  tertiary: Color(0xFFB0C6FF),
  onTertiary: Color(0xFF002C6F),
  tertiaryContainer: Color(0xFF01419C),
  onTertiaryContainer: Color(0xFFD9E2FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1A1A1A),
  onBackground: Color(0xFFE3E3E3),
  surface: Color(0xFF1A1A1A),
  onSurface: Color(0xFFF3F3F3),
  surfaceVariant: Color(0xFF44474E),
  onSurfaceVariant: Color(0xFFC4C6D0),
  outline: Color(0xFF8E9099),
  onInverseSurface: Color(0xFF1A1A1A),
  inverseSurface: Color(0xFFE3E3E3),
  inversePrimary: Color(0xFF2A5EA7),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFAAC7FF),
);
