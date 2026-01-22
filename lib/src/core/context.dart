/// Context passed during HTML rendering
class HtmlContext {
  final StringBuffer _buffer;
  final Map<String, String> _styles;
  int _nestingLevel;

  HtmlContext(this._buffer, this._styles, this._nestingLevel);

  factory HtmlContext.root() => HtmlContext(StringBuffer(), {}, 0);

  StringBuffer get buffer => _buffer;
  Map<String, String> get styles => _styles;
  int get nestingLevel => _nestingLevel;

  HtmlContext nested() {
    return HtmlContext(_buffer, _styles, _nestingLevel + 1);
  }

  String generateInlineStyle(String selector) {
    final style = _styles[selector];
    return style != null ? ' style="$style"' : '';
  }

  void addStyle(String selector, String property, String value) {
    final currentStyle = _styles[selector] ?? '';
    final newStyle = currentStyle.isEmpty ? '$property:$value' : '$currentStyle;$property:$value';
    _styles[selector] = newStyle;
  }
}
