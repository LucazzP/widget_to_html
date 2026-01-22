import 'package:widget_to_html/src/core/context.dart';
import 'package:widget_to_html/src/core/renderable.dart';
import '../styles/styles.dart';

/// Row widget for HTML emails (horizontal layout)
class Row extends HtmlRenderableWithChildren {
  @override
  final List<HtmlRenderable> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double? spacing;

  Row({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing,
  });

  @override
  String renderAsHtml(HtmlContext context) {
    final hAlign = mainAxisAlignment.toHtml();
    final vAlign = crossAxisAlignment.toHtmlVertical();
    final buffer = StringBuffer();

    buffer.write(
      '<table border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">',
    );
    buffer.write('<tr>');

    for (var i = 0; i < children.length; i++) {
      buffer.write('<td align="$hAlign" valign="$vAlign" style="padding:0;">');
      buffer.write(children[i].renderAsHtml(context.nested()));
      buffer.write('</td>');

      // Add spacing between items
      if (spacing != null && i < children.length - 1) {
        buffer.write('<td style="width:${spacing}px;padding:0;"></td>');
      }
    }

    buffer.write('</tr></table>');
    return buffer.toString();
  }
}
