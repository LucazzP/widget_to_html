import '../html_base.dart';
import '../styles/styles.dart';

/// Align widget for HTML emails
class HtmlAlign extends HtmlRenderableWithChild {
  @override
  final HtmlRenderable child;
  final Alignment alignment;

  HtmlAlign({required this.child, this.alignment = Alignment.topLeft});

  @override
  String renderAsHtml(HtmlContext context) {
    final childHtml = child.renderAsHtml(context.nested());
    final (horizontal, vertical) = alignment.toHtml();

    return '''<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse;">
  <tr>
    <td align="$horizontal" valign="$vertical" style="padding:0;">$childHtml</td>
  </tr>
</table>''';
  }
}
