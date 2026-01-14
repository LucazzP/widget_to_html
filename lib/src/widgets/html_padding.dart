import '../html_base.dart';
import '../styles/styles.dart';

/// Padding widget for HTML emails
class HtmlPadding extends HtmlRenderableWithChild {
  @override
  final HtmlRenderable child;
  final EdgeInsetsGeometry padding;

  HtmlPadding({required this.child, required this.padding});

  @override
  String renderAsHtml(HtmlContext context) {
    final styles = <String, String>{'padding': padding.toCss()};

    final builder = HtmlBuilder(context);
    final styleAttr = builder.inlineStyle(styles);
    final childHtml = child.renderAsHtml(context.nested());

    return '<div$styleAttr>$childHtml</div>';
  }
}
