/// Whether to use a normal or italic font style.
enum FontStyle {
  normal,
  italic;

  /// Converts this font style to a CSS font-style value.
  String toCss() {
    return switch (this) {
      FontStyle.normal => 'normal',
      FontStyle.italic => 'italic',
    };
  }
}
