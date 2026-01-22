import 'package:widget_to_html/src/core/context.dart';
import 'package:widget_to_html/src/core/renderable.dart';
import 'package:widget_to_html/src/core/utility.dart';

import '../styles/styles.dart';

/// Link widget for HTML emails
class Link extends HtmlRenderable {
  final String text;
  final String href;
  final TextStyle? style;

  Link({required this.text, required this.href, this.style});

  @override
  String renderAsHtml(HtmlContext context) {
    final styles = <String, String>{};

    if (style != null) {
      if (style!.color != null) styles['color'] = style!.color!.toCss();
      if (style!.fontFamily != null) styles['font-family'] = style!.fontFamily!;
      if (style!.fontSize != null) styles['font-size'] = '${style!.fontSize}px';
      if (style!.fontWeight != null) {
        styles['font-weight'] = style!.fontWeight!.toCss();
      }
      if (style!.fontStyle != null) {
        styles['font-style'] = style!.fontStyle!.toCss();
      }
      if (style!.decoration != null) {
        styles['text-decoration'] = style!.decoration!.toCss();
      } else {
        styles['text-decoration'] = 'underline';
      }
    } else {
      styles['text-decoration'] = 'underline';
    }

    final styleAttr = inlineStyle(styles);

    return '<a href="$href"$styleAttr>${htmlEscape(text)}</a>';
  }
}
