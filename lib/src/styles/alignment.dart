/// How a child is aligned within its parent.
class Alignment {
  final double x;
  final double y;

  const Alignment(this.x, this.y);

  static const Alignment topLeft = Alignment(-1.0, -1.0);
  static const Alignment topCenter = Alignment(0.0, -1.0);
  static const Alignment topRight = Alignment(1.0, -1.0);
  static const Alignment centerLeft = Alignment(-1.0, 0.0);
  static const Alignment center = Alignment(0.0, 0.0);
  static const Alignment centerRight = Alignment(1.0, 0.0);
  static const Alignment bottomLeft = Alignment(-1.0, 1.0);
  static const Alignment bottomCenter = Alignment(0.0, 1.0);
  static const Alignment bottomRight = Alignment(1.0, 1.0);

  /// Converts this alignment to HTML table align/valign values.
  /// Returns (horizontal, vertical) tuple.
  (String horizontal, String vertical) toHtml() {
    String horizontal;
    String vertical;

    if (x <= -0.5) {
      horizontal = 'left';
    } else if (x >= 0.5) {
      horizontal = 'right';
    } else {
      horizontal = 'center';
    }

    if (y <= -0.5) {
      vertical = 'top';
    } else if (y >= 0.5) {
      vertical = 'bottom';
    } else {
      vertical = 'middle';
    }

    return (horizontal, vertical);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Alignment && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'Alignment($x, $y)';
}
