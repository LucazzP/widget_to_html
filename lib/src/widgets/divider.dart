import 'package:widget_to_html/src/core/context.dart';
import 'package:widget_to_html/src/core/renderable.dart';
import '../styles/styles.dart';

/// Divider widget for HTML emails
class Divider extends HtmlRenderable {
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  Divider({this.height, this.color, this.margin});

  @override
  String renderAsHtml(HtmlContext context) {
    final h = height ?? 1;
    final c = color?.toCss() ?? '#e0e0e0';
    final m = margin?.resolve(TextDirection.ltr) ?? const EdgeInsets.symmetric(vertical: 16);

    return '<hr style="border:none;height:${h}px;background-color:$c;margin:${m.top}px ${m.right}px ${m.bottom}px ${m.left}px;" />';
  }
}
