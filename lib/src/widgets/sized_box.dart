import 'package:widget_to_html/src/core/context.dart';
import 'package:widget_to_html/src/core/renderable.dart';
import 'package:widget_to_html/src/core/utility.dart';

/// SizedBox widget for HTML emails
class SizedBox extends HtmlRenderableWithChild {
  final double? width;
  final double? height;
  @override
  final HtmlRenderable? child;

  SizedBox({this.width, this.height, this.child});

  @override
  String renderAsHtml(HtmlContext context) {
    final styles = <String, String>{};

    if (width != null) styles['width'] = '${width}px';
    if (height != null) styles['height'] = '${height}px';
    styles['display'] = 'block';

    final styleAttr = inlineStyle(styles);
    final childHtml = child?.renderAsHtml(context.nested()) ?? '';

    return '<div$styleAttr>$childHtml</div>';
  }
}
