import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

extension ColorHtmlExtension on flutter.Color {
  html.Color toHtml() => html.Color(toARGB32());
}
