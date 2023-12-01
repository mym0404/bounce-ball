import '../../assets/fonts.gen.dart';
import '../../export.dart';

class TS {
  TS._();

  static const displayLarge = TextStyle(
    fontSize: 56,
    height: 64 / 56,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamily.stardust,
  );
  static const displayMedium = TextStyle(
    fontSize: 45,
    height: 52 / 45,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamily.stardust,
  );
  static const displaySmall = TextStyle(
    fontSize: 36,
    height: 44 / 36,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamily.stardust,
  );

  static const headLarge = TextStyle(
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.stardust,
  );
  static const headMedium = TextStyle(
    fontSize: 28,
    height: 36 / 28,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.stardust,
  );
  static const headSmall = TextStyle(
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.stardust,
  );

  static const h1 = headLarge;
  static const h2 = headMedium;
  static const h3 = headSmall;

  static const titleLarge = TextStyle(
    fontSize: 22,
    height: 28 / 22,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.stardust,
  );
  static const titleMedium = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.stardust,
  );
  static const titleSmall = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.stardust,
  );

  static const t1 = titleLarge;
  static const t2 = titleMedium;
  static const t3 = titleSmall;

  static const bodyLarge = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontFamily: FontFamily.stardust,
  );
  static const bodyMedium = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontFamily: FontFamily.stardust,
  );
  static const bodySmall = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    fontFamily: FontFamily.stardust,
  );

  static const b1 = bodyLarge;
  static const b2 = bodyMedium;
  static const b3 = bodySmall;

  static const labelLarge = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.stardust,
  );
  static const labelMedium = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.stardust,
  );
  static const labelSmall = TextStyle(
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.stardust,
  );

  static const l1 = labelLarge;
  static const l2 = labelMedium;
  static const l3 = labelSmall;

  static const bold = TextStyle(fontWeight: FontWeight.bold);
  static const medium = TextStyle(fontWeight: FontWeight.w500);
}

extension TextStyleExtension on TextStyle {
  TextStyle c(Color c) => copyWith(color: c);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
}
