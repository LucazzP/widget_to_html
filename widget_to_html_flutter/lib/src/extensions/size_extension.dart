import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

extension SizeHtmlExtension on flutter.Size {
  html.Size toHtml() => html.Size(width, height);
}
