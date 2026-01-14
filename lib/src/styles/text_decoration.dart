/// Text decoration options.
class TextDecoration {
  final int _mask;

  const TextDecoration._(this._mask);

  static const TextDecoration none = TextDecoration._(0x0);
  static const TextDecoration underline = TextDecoration._(0x1);
  static const TextDecoration overline = TextDecoration._(0x2);
  static const TextDecoration lineThrough = TextDecoration._(0x4);

  /// Combines multiple decorations.
  factory TextDecoration.combine(List<TextDecoration> decorations) {
    int mask = 0;
    for (final decoration in decorations) {
      mask |= decoration._mask;
    }
    return TextDecoration._(mask);
  }

  bool contains(TextDecoration other) => (_mask & other._mask) == other._mask;

  /// Converts this text decoration to a CSS text-decoration value.
  String toCss() {
    if (_mask == 0) return 'none';
    final values = <String>[];
    if (contains(underline)) values.add('underline');
    if (contains(overline)) values.add('overline');
    if (contains(lineThrough)) values.add('line-through');
    return values.join(' ');
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TextDecoration && _mask == other._mask;

  @override
  int get hashCode => _mask.hashCode;

  @override
  String toString() {
    if (_mask == 0) return 'TextDecoration.none';
    final values = <String>[];
    if (contains(underline)) values.add('underline');
    if (contains(overline)) values.add('overline');
    if (contains(lineThrough)) values.add('lineThrough');
    return 'TextDecoration.combine([${values.join(', ')}])';
  }
}
