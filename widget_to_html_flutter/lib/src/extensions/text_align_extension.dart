import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

extension TextAlignHtmlExtension on flutter.TextAlign {
  html.TextAlign toHtml() {
    return switch (this) {
      flutter.TextAlign.left => html.TextAlign.left,
      flutter.TextAlign.right => html.TextAlign.right,
      flutter.TextAlign.center => html.TextAlign.center,
      flutter.TextAlign.justify => html.TextAlign.justify,
      flutter.TextAlign.start => html.TextAlign.start,
      flutter.TextAlign.end => html.TextAlign.end,
    };
  }
}
