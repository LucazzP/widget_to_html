import 'package:widget_to_html/widget_to_html.dart';

class HtmlDocument {
  final String? title;
  final String? header;
  final HtmlRenderable body;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Border? border;
  final BorderRadiusGeometry? borderRadius;
  final BoxConstraints? constraints;
  final bool minify;

  HtmlDocument({
    required this.body,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.border,
    this.borderRadius,
    this.constraints,
    this.title,
    this.header = defaultHeader,
    this.minify = true,
  });

  static const defaultHeader = '''
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="x-apple-disable-message-reformatting">
  <style type="text/css">
    body, table, td, a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }
    table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; }
    img { -ms-interpolation-mode: bicubic; border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }
    body { margin: 0 !important; padding: 0 !important; width: 100% !important; }
  </style>
  <!--[if mso]>
  <style type="text/css">
    body, table, td { font-family: Arial, Helvetica, sans-serif !important; }
  </style>
  <![endif]-->
  ''';

  String render() {
    final context = HtmlContext.root();
    final styles = <String, String>{};

    // BoxConstraints
    if (constraints != null) {
      if (constraints!.minWidth > 0 &&
          constraints!.minWidth != double.infinity) {
        styles['min-width'] = '${constraints!.minWidth}px';
      }
      if (constraints!.maxWidth < double.infinity) {
        styles['max-width'] = '${constraints!.maxWidth}px';
      }
      if (constraints!.minHeight > 0 &&
          constraints!.minHeight != double.infinity) {
        styles['min-height'] = '${constraints!.minHeight}px';
      }
      if (constraints!.maxHeight < double.infinity) {
        styles['max-height'] = '${constraints!.maxHeight}px';
      }
    }

    if (backgroundColor != null) {
      styles['background-color'] = backgroundColor!.toCss();
    }
    if (padding != null) styles['padding'] = padding!.toCss();
    if (margin != null) styles['margin'] = margin!.toCss();
    if (border != null) {
      final borderCss = border!.toCss();
      if (borderCss != 'none') styles['border'] = borderCss;
    }
    if (borderRadius != null) styles['border-radius'] = borderRadius!.toCss();

    final builder = HtmlBuilder(context);
    final styleAttr = styles.isEmpty ? '' : builder.inlineStyle(styles);
    final bodyHtml = body.renderAsHtml(context.nested());

    final document =
        '''<!DOCTYPE html>
<html>
<head>${title != null ? '<title>$title</title>' : ''}$header</head>
<body$styleAttr>
  $bodyHtml
</body>
</html>
''';

    if (minify) {
      return document.replaceAll('\n', '').replaceAll('  ', '');
    }

    return document;
  }
}
