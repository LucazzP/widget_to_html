import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

extension TextDirectionHtmlExtension on flutter.TextDirection {
  html.TextDirection toHtml() {
    return switch (this) {
      flutter.TextDirection.ltr => html.TextDirection.ltr,
      flutter.TextDirection.rtl => html.TextDirection.rtl,
    };
  }
}
