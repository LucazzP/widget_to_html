import 'color.dart';

/// Style of a border side.
enum BorderStyle { none, solid }

/// A side of a border of a box.
class BorderSide {
  final Color color;
  final double width;
  final BorderStyle style;

  const BorderSide({
    this.color = Colors.black,
    this.width = 1.0,
    this.style = BorderStyle.solid,
  });

  static const BorderSide none = BorderSide(
    width: 0.0,
    style: BorderStyle.none,
  );

  /// Converts this border side to a CSS border value.
  String toCss() {
    if (style == BorderStyle.none || width == 0) return 'none';
    return '${width}px solid ${color.toCss()}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BorderSide &&
          color == other.color &&
          width == other.width &&
          style == other.style;

  @override
  int get hashCode => Object.hash(color, width, style);
}

/// A border of a box, consisting of four sides.
class Border {
  final BorderSide top;
  final BorderSide right;
  final BorderSide bottom;
  final BorderSide left;

  const Border({
    this.top = BorderSide.none,
    this.right = BorderSide.none,
    this.bottom = BorderSide.none,
    this.left = BorderSide.none,
  });

  const Border.fromBorderSide(BorderSide side)
    : top = side,
      right = side,
      bottom = side,
      left = side;

  factory Border.all({
    Color color = Colors.black,
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
  }) {
    final side = BorderSide(color: color, width: width, style: style);
    return Border.fromBorderSide(side);
  }

  static const Border none = Border();

  /// Converts this border to a CSS border value (uses top border).
  String toCss() => top.toCss();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Border &&
          top == other.top &&
          right == other.right &&
          bottom == other.bottom &&
          left == other.left;

  @override
  int get hashCode => Object.hash(top, right, bottom, left);
}
