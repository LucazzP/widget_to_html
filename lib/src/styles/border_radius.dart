import 'text_direction.dart';

/// A radius for either circular or elliptical shapes.
class Radius {
  final double x;
  final double y;

  const Radius.circular(double radius) : x = radius, y = radius;

  const Radius.elliptical(this.x, this.y);

  static const Radius zero = Radius.circular(0.0);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Radius && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() =>
      x == y ? 'Radius.circular($x)' : 'Radius.elliptical($x, $y)';
}

/// Base class for border radius.
abstract class BorderRadiusGeometry {
  const BorderRadiusGeometry();

  /// Resolves to a concrete BorderRadius.
  BorderRadius resolve(TextDirection? direction);

  /// Converts this border radius to a CSS border-radius value.
  String toCss([TextDirection? direction]) {
    final resolved = resolve(direction ?? TextDirection.ltr);
    if (resolved.topLeft == resolved.topRight &&
        resolved.topRight == resolved.bottomRight &&
        resolved.bottomRight == resolved.bottomLeft) {
      return '${resolved.topLeft.x}px';
    }
    return '${resolved.topLeft.x}px ${resolved.topRight.x}px ${resolved.bottomRight.x}px ${resolved.bottomLeft.x}px';
  }
}

/// An immutable set of radii for each corner of a rectangle.
class BorderRadius extends BorderRadiusGeometry {
  final Radius topLeft;
  final Radius topRight;
  final Radius bottomLeft;
  final Radius bottomRight;

  const BorderRadius.only({
    this.topLeft = Radius.zero,
    this.topRight = Radius.zero,
    this.bottomLeft = Radius.zero,
    this.bottomRight = Radius.zero,
  });

  const BorderRadius.all(Radius radius)
    : topLeft = radius,
      topRight = radius,
      bottomLeft = radius,
      bottomRight = radius;

  BorderRadius.circular(double radius) : this.all(Radius.circular(radius));

  static const BorderRadius zero = BorderRadius.all(Radius.zero);

  @override
  BorderRadius resolve(TextDirection? direction) => this;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BorderRadius &&
          topLeft == other.topLeft &&
          topRight == other.topRight &&
          bottomLeft == other.bottomLeft &&
          bottomRight == other.bottomRight;

  @override
  int get hashCode => Object.hash(topLeft, topRight, bottomLeft, bottomRight);
}

/// A BorderRadius with start and end instead of left and right.
/// These are resolved based on text direction.
class BorderRadiusDirectional extends BorderRadiusGeometry {
  final Radius topStart;
  final Radius topEnd;
  final Radius bottomStart;
  final Radius bottomEnd;

  const BorderRadiusDirectional.only({
    this.topStart = Radius.zero,
    this.topEnd = Radius.zero,
    this.bottomStart = Radius.zero,
    this.bottomEnd = Radius.zero,
  });

  const BorderRadiusDirectional.all(Radius radius)
    : topStart = radius,
      topEnd = radius,
      bottomStart = radius,
      bottomEnd = radius;

  BorderRadiusDirectional.circular(double radius)
    : this.all(Radius.circular(radius));

  static const BorderRadiusDirectional zero = BorderRadiusDirectional.all(
    Radius.zero,
  );

  @override
  BorderRadius resolve(TextDirection? direction) {
    switch (direction) {
      case TextDirection.rtl:
        return BorderRadius.only(
          topLeft: topEnd,
          topRight: topStart,
          bottomLeft: bottomEnd,
          bottomRight: bottomStart,
        );
      case TextDirection.ltr:
      case null:
        return BorderRadius.only(
          topLeft: topStart,
          topRight: topEnd,
          bottomLeft: bottomStart,
          bottomRight: bottomEnd,
        );
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BorderRadiusDirectional &&
          topStart == other.topStart &&
          topEnd == other.topEnd &&
          bottomStart == other.bottomStart &&
          bottomEnd == other.bottomEnd;

  @override
  int get hashCode => Object.hash(topStart, topEnd, bottomStart, bottomEnd);
}
