import 'package:widget_to_html/src/core/context.dart';
import 'package:widget_to_html/src/core/renderable.dart';

/// Center widget for HTML emails
class Center extends HtmlRenderableWithChild {
  @override
  final HtmlRenderable child;

  Center({required this.child});

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
