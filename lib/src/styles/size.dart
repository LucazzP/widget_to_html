/// Holds a 2D size with width and height.
class Size {
  final double width;
  final double height;

  const Size(this.width, this.height);

  /// Creates a square size.
  const Size.square(double dimension)
      : width = dimension,
        height = dimension;

  /// Creates a size with the given width and infinite height.
  const Size.fromWidth(double width)
      : width = width,
        height = double.infinity;

  /// Creates a size with the given height and infinite width.
  const Size.fromHeight(double height)
      : width = double.infinity,
        height = height;

  /// Creates a size from a radius (width = height = radius * 2).
  const Size.fromRadius(double radius)
      : width = radius * 2,
        height = radius * 2;

  static const Size zero = Size(0.0, 0.0);
  static const Size infinite = Size(double.infinity, double.infinity);

  /// Whether this size has a finite width.
  bool get isFinite => width.isFinite && height.isFinite;

  /// Whether this size is empty (either width or height is <= 0).
  bool get isEmpty => width <= 0.0 || height <= 0.0;

  /// The aspect ratio of this size (width / height).
  double get aspectRatio => height != 0.0 ? width / height : 0.0;

  /// The shorter side.
  double get shortestSide => width < height ? width : height;

  /// The longer side.
  double get longestSide => width > height ? width : height;

  /// Returns a size with width and height flipped.
  Size get flipped => Size(height, width);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Size && width == other.width && height == other.height;

  @override
  int get hashCode => Object.hash(width, height);

  @override
  String toString() => 'Size(${width.toStringAsFixed(1)}, ${height.toStringAsFixed(1)})';
}
