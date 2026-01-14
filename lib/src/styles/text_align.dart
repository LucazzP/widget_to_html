/// How text should be aligned horizontally.
enum TextAlign {
  left,
  right,
  center,
  justify,
  start,
  end;

  /// Converts this text align to a CSS text-align value.
  String toCss() {
    return switch (this) {
      TextAlign.left => 'left',
      TextAlign.right => 'right',
      TextAlign.center => 'center',
      TextAlign.justify => 'justify',
      TextAlign.start => 'left',
      TextAlign.end => 'right',
    };
  }
}
