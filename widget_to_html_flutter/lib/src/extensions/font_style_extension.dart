import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

extension FontStyleHtmlExtension on flutter.FontStyle {
  html.FontStyle toHtml() {
    return switch (this) {
      flutter.FontStyle.normal => html.FontStyle.normal,
      flutter.FontStyle.italic => html.FontStyle.italic,
    };
  }
}
