import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:meta/meta.dart';

/// Abstract base class for all HTML renderable widgets
abstract class HtmlRenderable {
  String renderAsHtml(HtmlContext context);

  @mustCallSuper
  Future<void> prepare() => Future.value();

  @mustCallSuper
  FutureOr<void> dispose() => Future.value();
}

abstract class HtmlRenderableWithChild extends HtmlRenderable {
  HtmlRenderable? get child;

  @override
  Future<void> prepare() async {
    await child?.prepare();
    return super.prepare();
  }

  @override
  Future<void> dispose() async {
    await child?.dispose();
    return super.dispose();
  }
}

abstract class HtmlRenderableWithChildren extends HtmlRenderable {
  List<HtmlRenderable> get children;

  @override
  Future<void> prepare() async {
    await Future.wait(children.map((child) => child.prepare()));
    return super.prepare();
  }

  @override
  Future<void> dispose() async {
    await Future.wait(children.map((child) async => await child.dispose()));
    return super.dispose();
  }
}

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

/// HTML builder utility for constructing HTML elements
class HtmlBuilder {
  final HtmlContext _context;

  HtmlBuilder(this._context);

  /// Opens an HTML tag
  void openTag(String tagName, {Map<String, String>? attributes}) {
    _context.buffer.write('<$tagName');
    if (attributes != null) {
      attributes.forEach((key, value) {
        _context.buffer.write(' $key="$value"');
      });
    }
    _context.buffer.write('>');
  }

  /// Closes an HTML tag
  void closeTag(String tagName) {
    _context.buffer.write('</$tagName>');
  }

  /// Adds text content
  void text(String text) {
    _context.buffer.write(htmlEscape(text));
  }

  /// Adds raw HTML content (be careful with XSS)
  void raw(String html) {
    _context.buffer.write(html);
  }

  /// Builds a complete HTML element
  String element(String tagName, String content, {Map<String, String>? attributes}) {
    final attrs = StringBuffer();
    if (attributes != null) {
      attributes.forEach((key, value) {
        attrs.write(' $key="$value"');
      });
    }
    return '<$tagName${attrs.toString()}>$content</$tagName>';
  }

  /// Builds a self-closing HTML element
  String selfClosingElement(String tagName, {Map<String, String>? attributes}) {
    final attrs = StringBuffer();
    if (attributes != null) {
      attributes.forEach((key, value) {
        attrs.write(' $key="$value"');
      });
    }
    return '<$tagName${attrs.toString()} />';
  }

  /// Converts CSS properties to inline style string
  String inlineStyle(Map<String, String> properties) {
    if (properties.isEmpty) return '';
    final styles = properties.entries.map((e) => '${e.key}:${e.value}').join(';');
    return ' style="$styles"';
  }

  /// Builds a table structure for layout
  void tableLayout(List<List<HtmlRenderable>> rows, {Map<String, String>? tableAttributes}) {
    openTag(
      'table',
      attributes: {
        'border': '0',
        'cellpadding': '0',
        'cellspacing': '0',
        'width': '100%',
        'style': 'border-collapse:collapse;',
        ...?tableAttributes,
      },
    );

    for (final row in rows) {
      openTag('tr');
      for (final cell in row) {
        openTag('td', attributes: {'style': 'padding:0;'});
        raw(cell.renderAsHtml(_context.nested()));
        closeTag('td');
      }
      closeTag('tr');
    }
    closeTag('table');
  }

  /// Builds a vertical column layout using tables
  void columnLayout(List<HtmlRenderable> children) {
    final rows = children.map((child) => [child]).toList();
    tableLayout(rows);
  }

  /// Builds a horizontal row layout using tables
  void rowLayout(List<HtmlRenderable> children) {
    tableLayout([children]);
  }
}

/// HTML escape utility
String htmlEscape(String text) {
  return text
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;')
      .replaceAll('"', '&quot;')
      .replaceAll("'", '&#x27;')
      .replaceAll('/', '&#x2F;');
}

/// Converts Uint8List to base64 data URI for embedding images
String toBase64DataUri(Uint8List bytes, {String mimeType = 'image/png'}) {
  final base64 = base64Encode(bytes);
  return 'data:$mimeType;base64,$base64';
}
