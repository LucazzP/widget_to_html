import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

extension MainAxisAlignmentHtmlExtension on flutter.MainAxisAlignment {
  html.MainAxisAlignment toHtml() {
    return switch (this) {
      flutter.MainAxisAlignment.start => html.MainAxisAlignment.start,
      flutter.MainAxisAlignment.end => html.MainAxisAlignment.end,
      flutter.MainAxisAlignment.center => html.MainAxisAlignment.center,
      flutter.MainAxisAlignment.spaceBetween => html.MainAxisAlignment.spaceBetween,
      flutter.MainAxisAlignment.spaceAround => html.MainAxisAlignment.spaceAround,
      flutter.MainAxisAlignment.spaceEvenly => html.MainAxisAlignment.spaceEvenly,
    };
  }
}

extension CrossAxisAlignmentHtmlExtension on flutter.CrossAxisAlignment {
  html.CrossAxisAlignment toHtml() {
    return switch (this) {
      flutter.CrossAxisAlignment.start => html.CrossAxisAlignment.start,
      flutter.CrossAxisAlignment.end => html.CrossAxisAlignment.end,
      flutter.CrossAxisAlignment.center => html.CrossAxisAlignment.center,
      flutter.CrossAxisAlignment.stretch => html.CrossAxisAlignment.stretch,
      flutter.CrossAxisAlignment.baseline => html.CrossAxisAlignment.baseline,
    };
  }
}
