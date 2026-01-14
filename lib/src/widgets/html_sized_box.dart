import '../html_base.dart';

/// SizedBox widget for HTML emails
class HtmlSizedBox extends HtmlRenderableWithChild {
  final double? width;
  final double? height;
  @override
  final HtmlRenderable? child;

  HtmlSizedBox({this.width, this.height, this.child});

  @override
  String renderAsHtml(HtmlContext context) {
    final styles = <String, String>{};

    if (width != null) styles['width'] = '${width}px';
    if (height != null) styles['height'] = '${height}px';
    styles['display'] = 'block';

    final builder = HtmlBuilder(context);
    final styleAttr = builder.inlineStyle(styles);
    final childHtml = child?.renderAsHtml(context.nested()) ?? '';

    return '<div$styleAttr>$childHtml</div>';
  }
}
