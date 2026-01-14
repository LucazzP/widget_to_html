/// A color represented as ARGB values.
class Color {
  final int value;

  const Color(this.value);

  /// Creates a color from ARGB components (0-255 each).
  const Color.fromARGB(int a, int r, int g, int b)
    : value =
          ((a & 0xff) << 24) |
          ((r & 0xff) << 16) |
          ((g & 0xff) << 8) |
          (b & 0xff);

  /// Creates a color from RGB components with full opacity.
  const Color.fromRGBO(int r, int g, int b, double opacity)
    : value =
          ((((opacity * 0xff ~/ 1) & 0xff) << 24) |
          ((r & 0xff) << 16) |
          ((g & 0xff) << 8) |
          (b & 0xff));

  /// Alpha channel (0-255).
  int get alpha => (value >> 24) & 0xff;

  /// Red channel (0-255).
  int get red => (value >> 16) & 0xff;

  /// Green channel (0-255).
  int get green => (value >> 8) & 0xff;

  /// Blue channel (0-255).
  int get blue => value & 0xff;

  /// Opacity as a double (0.0 - 1.0).
  double get opacity => alpha / 255.0;

  /// Returns a new color with the given alpha value.
  Color withAlpha(int a) => Color.fromARGB(a, red, green, blue);

  /// Returns a new color with the given opacity.
  Color withOpacity(double opacity) =>
      Color.fromARGB((opacity * 255).round(), red, green, blue);

  /// Converts this color to a CSS color string.
  String toCss() {
    if (alpha == 255) {
      return '#${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}';
    }
    return 'rgba($red,$green,$blue,${(alpha / 255).toStringAsFixed(2)})';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Color && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Color(0x${value.toRadixString(16).padLeft(8, '0')})';
}

/// Common color constants.
abstract class Colors {
  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF00FF00);
  static const Color blue = Color(0xFF0000FF);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color gray = grey;
}
