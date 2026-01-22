import 'package:widget_to_html/src/core/context.dart';
import 'package:widget_to_html/src/core/renderable.dart';
import '../styles/styles.dart';

/// Column widget for HTML emails (vertical layout)
class Column extends HtmlRenderableWithChildren {
  @override
  final List<HtmlRenderable> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double? spacing;

  Column({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing,
  });

  @override
  String renderAsHtml(HtmlContext context) {
    // mainAxisAlignment translates to spacing; current table layout supports simple spacing inserts
    final align = crossAxisAlignment.toHtmlHorizontal();
    final buffer = StringBuffer();

    buffer.write(
      '<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse;">',
    );

    for (var i = 0; i < children.length; i++) {
      buffer.write('<tr><td align="$align" style="padding:0;">');
      buffer.write(children[i].renderAsHtml(context.nested()));
      buffer.write('</td></tr>');

      // Add spacing between items
      if (spacing != null && i < children.length - 1) {
        buffer.write(
          '<tr><td style="height:${spacing}px;padding:0;"></td></tr>',
        );
      }
    }

    buffer.write('</table>');
    return buffer.toString();
  }
}
