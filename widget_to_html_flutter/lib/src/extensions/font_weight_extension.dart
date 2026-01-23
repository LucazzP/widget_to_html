import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

extension FontWeightHtmlExtension on flutter.FontWeight {
  html.FontWeight toHtml() {
    return html.FontWeight.values.firstWhere(
      (weight) => weight.value == value,
      orElse: () => html.FontWeight.normal,
    );
  }
}
