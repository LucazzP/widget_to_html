import '../html_base.dart';
import '../styles/styles.dart';

/// Text widget for HTML emails
class HtmlText extends HtmlRenderable {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  HtmlText(this.text, {this.style, this.textAlign});

  @override
  String renderAsHtml(HtmlContext context) {
    final styles = <String, String>{};

    if (style != null) {
      if (style!.fontFamily != null) styles['font-family'] = style!.fontFamily!;
      if (style!.fontSize != null) styles['font-size'] = '${style!.fontSize}px';
      if (style!.fontWeight != null) styles['font-weight'] = style!.fontWeight!.toCss();
      if (style!.fontStyle != null) styles['font-style'] = style!.fontStyle!.toCss();
      if (style!.color != null) styles['color'] = style!.color!.toCss();
      if (style!.height != null) styles['line-height'] = '${style!.height}';
      if (style!.decoration != null) styles['text-decoration'] = style!.decoration!.toCss();
      if (style!.backgroundColor != null) styles['background-color'] = style!.backgroundColor!.toCss();
      if (style!.letterSpacing != null) styles['letter-spacing'] = '${style!.letterSpacing}px';
    }

    if (textAlign != null) styles['text-align'] = textAlign!.toCss();

    styles['margin'] = '0';
    styles['padding'] = '0';

    final builder = HtmlBuilder(context);
    final styleAttr = styles.isEmpty ? '' : builder.inlineStyle(styles);
    return '<p$styleAttr>${htmlEscape(text)}</p>';
  }
}
