import 'color.dart';
import 'font_style.dart';
import 'font_weight.dart';
import 'text_decoration.dart';

/// Styling for text.
class TextStyle {
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final Color? backgroundColor;
  final double? height;
  final double? letterSpacing;
  final TextDecoration? decoration;

  const TextStyle({
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.color,
    this.backgroundColor,
    this.height,
    this.letterSpacing,
    this.decoration,
  });

  /// Creates a copy with the given fields replaced.
  TextStyle copyWith({
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    Color? color,
    Color? backgroundColor,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      height: height ?? this.height,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      decoration: decoration ?? this.decoration,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextStyle &&
          fontFamily == other.fontFamily &&
          fontSize == other.fontSize &&
          fontWeight == other.fontWeight &&
          fontStyle == other.fontStyle &&
          color == other.color &&
          backgroundColor == other.backgroundColor &&
          height == other.height &&
          letterSpacing == other.letterSpacing &&
          decoration == other.decoration;

  @override
  int get hashCode => Object.hash(
    fontFamily,
    fontSize,
    fontWeight,
    fontStyle,
    color,
    backgroundColor,
    height,
    letterSpacing,
    decoration,
  );
}
