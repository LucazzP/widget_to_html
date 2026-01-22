import 'package:widget_to_html/src/core/context.dart';
import 'package:widget_to_html/src/core/renderable.dart';
import 'package:widget_to_html/src/core/utility.dart';

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

  /// Builds a table structure for layout
  void tableLayout(
    List<List<HtmlRenderable>> rows, {
    Map<String, String>? tableAttributes,
  }) {
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
