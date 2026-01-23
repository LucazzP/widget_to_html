import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

extension AlignmentHtmlExtension on flutter.Alignment {
  html.Alignment toHtml() => html.Alignment(x, y);
}
