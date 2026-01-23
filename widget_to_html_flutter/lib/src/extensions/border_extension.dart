import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

import 'color_extension.dart';

extension BorderStyleHtmlExtension on flutter.BorderStyle {
  html.BorderStyle toHtml() {
    return switch (this) {
      flutter.BorderStyle.none => html.BorderStyle.none,
      flutter.BorderStyle.solid => html.BorderStyle.solid,
    };
  }
}

extension BorderSideHtmlExtension on flutter.BorderSide {
  html.BorderSide toHtml() {
    return html.BorderSide(
      color: color.toHtml(),
      width: width,
      style: style.toHtml(),
    );
  }
}

extension BorderHtmlExtension on flutter.Border {
  html.Border toHtml() {
    return html.Border(
      top: top.toHtml(),
      right: right.toHtml(),
      bottom: bottom.toHtml(),
      left: left.toHtml(),
    );
  }
}
