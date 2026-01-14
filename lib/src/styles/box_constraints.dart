/// Immutable layout constraints for boxes.
class BoxConstraints {
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;

  const BoxConstraints({
    this.minWidth = 0.0,
    this.maxWidth = double.infinity,
    this.minHeight = 0.0,
    this.maxHeight = double.infinity,
  });

  const BoxConstraints.tightFor({double? width, double? height})
      : minWidth = width ?? 0.0,
        maxWidth = width ?? double.infinity,
        minHeight = height ?? 0.0,
        maxHeight = height ?? double.infinity;

  const BoxConstraints.expand({double? width, double? height})
      : minWidth = width ?? double.infinity,
        maxWidth = width ?? double.infinity,
        minHeight = height ?? double.infinity,
        maxHeight = height ?? double.infinity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoxConstraints &&
          minWidth == other.minWidth &&
          maxWidth == other.maxWidth &&
          minHeight == other.minHeight &&
          maxHeight == other.maxHeight;

  @override
  int get hashCode => Object.hash(minWidth, maxWidth, minHeight, maxHeight);
}
