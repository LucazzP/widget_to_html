import '../html_base.dart';

/// Center widget for HTML emails
class HtmlCenter extends HtmlRenderableWithChild {
  @override
  final HtmlRenderable child;

  HtmlCenter({required this.child});

  @override
  String renderAsHtml(HtmlContext context) {
    final childHtml = child.renderAsHtml(context.nested());

    // Using table-based centering for email compatibility
    return '''<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse;">
  <tr>
    <td align="center" valign="middle" style="padding:0;">$childHtml</td>
  </tr>
</table>''';
  }
}
