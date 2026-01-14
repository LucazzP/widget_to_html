/// Font weight options.
class FontWeight {
  final int index;
  final int value;

  const FontWeight._(this.index, this.value);

  static const FontWeight w100 = FontWeight._(0, 100);
  static const FontWeight w200 = FontWeight._(1, 200);
  static const FontWeight w300 = FontWeight._(2, 300);
  static const FontWeight w400 = FontWeight._(3, 400);
  static const FontWeight w500 = FontWeight._(4, 500);
  static const FontWeight w600 = FontWeight._(5, 600);
  static const FontWeight w700 = FontWeight._(6, 700);
  static const FontWeight w800 = FontWeight._(7, 800);
  static const FontWeight w900 = FontWeight._(8, 900);

  static const FontWeight normal = w400;
  static const FontWeight bold = w700;

  static const List<FontWeight> values = [
    w100,
    w200,
    w300,
    w400,
    w500,
    w600,
    w700,
    w800,
    w900,
  ];

  /// Converts this font weight to a CSS font-weight value.
  String toCss() => value.toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is FontWeight && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'FontWeight.w$value';
}
