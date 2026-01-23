import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

extension BoxConstraintsHtmlExtension on flutter.BoxConstraints {
  html.BoxConstraints toHtml() {
    return html.BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }
}
