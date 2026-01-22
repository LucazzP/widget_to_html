import 'package:widget_to_html/src/core/context.dart';
import 'package:widget_to_html/src/core/utility.dart';
import 'package:widget_to_html/src/core/renderable.dart';
import '../styles/styles.dart';

/// Padding widget for HTML emails
class Padding extends HtmlRenderableWithChild {
  @override
  final HtmlRenderable child;
  final EdgeInsetsGeometry padding;

  Padding({required this.child, required this.padding});

  @override
  String renderAsHtml(HtmlContext context) {
    final styles = <String, String>{'padding': padding.toCss()};

    final styleAttr = inlineStyle(styles);
    final childHtml = child.renderAsHtml(context.nested());

    return '<div$styleAttr>$childHtml</div>';
  }
}
