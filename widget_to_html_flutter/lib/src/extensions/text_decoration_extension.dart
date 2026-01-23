import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

extension TextDecorationHtmlExtension on flutter.TextDecoration {
  html.TextDecoration toHtml() {
    if (this == flutter.TextDecoration.none) {
      return html.TextDecoration.none;
    }

    final decorations = <html.TextDecoration>[];
    if (contains(flutter.TextDecoration.underline)) {
      decorations.add(html.TextDecoration.underline);
    }
    if (contains(flutter.TextDecoration.overline)) {
      decorations.add(html.TextDecoration.overline);
    }
    if (contains(flutter.TextDecoration.lineThrough)) {
      decorations.add(html.TextDecoration.lineThrough);
    }

    if (decorations.isEmpty) {
      return html.TextDecoration.none;
    }
    if (decorations.length == 1) {
      return decorations.first;
    }
    return html.TextDecoration.combine(decorations);
  }
}
