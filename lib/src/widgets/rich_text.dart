import 'package:widget_to_html/src/core/context.dart';
import 'package:widget_to_html/src/core/renderable.dart';
import 'package:widget_to_html/src/core/utility.dart';
import '../styles/styles.dart';

/// RichText widget for HTML emails
class RichText extends HtmlRenderable {
  final List<TextSpan> spans;

  RichText({required this.spans});

  @override
  String renderAsHtml(HtmlContext context) {
    final buffer = StringBuffer();
    buffer.write('<p style="margin:0;padding:0;">');

    for (final span in spans) {
      buffer.write(span.renderAsHtml(context));
    }

    buffer.write('</p>');
    return buffer.toString();
  }
}

/// TextSpan for RichText
class TextSpan {
  final String text;
  final TextStyle? style;
  final String? href;

  TextSpan(this.text, {this.style, this.href});

  String renderAsHtml(HtmlContext context) {
    final styles = <String, String>{};

    if (style != null) {
      if (style!.fontFamily != null) styles['font-family'] = style!.fontFamily!;
      if (style!.fontSize != null) styles['font-size'] = '${style!.fontSize}px';
      if (style!.fontWeight != null) {
        styles['font-weight'] = style!.fontWeight!.toCss();
      }
      if (style!.fontStyle != null) {
        styles['font-style'] = style!.fontStyle!.toCss();
      }
      if (style!.color != null) styles['color'] = style!.color!.toCss();
      if (style!.backgroundColor != null) {
        styles['background-color'] = style!.backgroundColor!.toCss();
      }
      if (style!.decoration != null) {
        styles['text-decoration'] = style!.decoration!.toCss();
      }
    }

    final styleAttr = styles.isEmpty ? '' : inlineStyle(styles);
    final escapedText = htmlEscape(text);

    if (href != null) {
      return '<a href="$href"$styleAttr>$escapedText</a>';
    }
    return '<span$styleAttr>$escapedText</span>';
  }
}
