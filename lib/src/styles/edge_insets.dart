import 'text_direction.dart';

/// Base class for edge insets.
abstract class EdgeInsetsGeometry {
  const EdgeInsetsGeometry();

  /// Resolves the insets to concrete values.
  EdgeInsets resolve(TextDirection? direction);

  /// Converts this edge insets to a CSS padding/margin value.
  String toCss([TextDirection? direction]) {
    final resolved = resolve(direction ?? TextDirection.ltr);
    return '${resolved.top}px ${resolved.right}px ${resolved.bottom}px ${resolved.left}px';
  }
}

/// Immutable set of offsets in each of the four cardinal directions.
class EdgeInsets extends EdgeInsetsGeometry {
  final double left;
  final double top;
  final double right;
  final double bottom;

  const EdgeInsets.fromLTRB(this.left, this.top, this.right, this.bottom);

  const EdgeInsets.all(double value)
    : left = value,
      top = value,
      right = value,
      bottom = value;

  const EdgeInsets.only({
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0,
  });

  const EdgeInsets.symmetric({double vertical = 0.0, double horizontal = 0.0})
    : left = horizontal,
      top = vertical,
      right = horizontal,
      bottom = vertical;

  static const EdgeInsets zero = EdgeInsets.all(0.0);

  /// Total horizontal padding.
  double get horizontal => left + right;

  /// Total vertical padding.
  double get vertical => top + bottom;

  @override
  EdgeInsets resolve(TextDirection? direction) => this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EdgeInsets &&
          left == other.left &&
          top == other.top &&
          right == other.right &&
          bottom == other.bottom;

  @override
  int get hashCode => Object.hash(left, top, right, bottom);

  @override
  String toString() =>
      'EdgeInsets(${left.toStringAsFixed(1)}, ${top.toStringAsFixed(1)}, ${right.toStringAsFixed(1)}, ${bottom.toStringAsFixed(1)})';
}

/// An EdgeInsets with start and end instead of left and right.
/// These are resolved based on text direction.
class EdgeInsetsDirectional extends EdgeInsetsGeometry {
  final double start;
  final double top;
  final double end;
  final double bottom;

  const EdgeInsetsDirectional.fromSTEB(
    this.start,
    this.top,
    this.end,
    this.bottom,
  );

  const EdgeInsetsDirectional.all(double value)
    : start = value,
      top = value,
      end = value,
      bottom = value;

  const EdgeInsetsDirectional.only({
    this.start = 0.0,
    this.top = 0.0,
    this.end = 0.0,
    this.bottom = 0.0,
  });

  const EdgeInsetsDirectional.symmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) : start = horizontal,
       top = vertical,
       end = horizontal,
       bottom = vertical;

  static const EdgeInsetsDirectional zero = EdgeInsetsDirectional.all(0.0);

  @override
  EdgeInsets resolve(TextDirection? direction) {
    switch (direction) {
      case TextDirection.rtl:
        return EdgeInsets.fromLTRB(end, top, start, bottom);
      case TextDirection.ltr:
      case null:
        return EdgeInsets.fromLTRB(start, top, end, bottom);
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EdgeInsetsDirectional &&
          start == other.start &&
          top == other.top &&
          end == other.end &&
          bottom == other.bottom;

  @override
  int get hashCode => Object.hash(start, top, end, bottom);

  @override
  String toString() =>
      'EdgeInsetsDirectional(${start.toStringAsFixed(1)}, ${top.toStringAsFixed(1)}, ${end.toStringAsFixed(1)}, ${bottom.toStringAsFixed(1)})';
}
