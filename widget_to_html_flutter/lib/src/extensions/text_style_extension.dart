import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

import 'color_extension.dart';
import 'font_style_extension.dart';
import 'font_weight_extension.dart';
import 'text_decoration_extension.dart';

extension TextStyleHtmlExtension on flutter.TextStyle {
  html.TextStyle toHtml() {
    return html.TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight?.toHtml(),
      fontStyle: fontStyle?.toHtml(),
      color: color?.toHtml(),
      backgroundColor: backgroundColor?.toHtml(),
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration?.toHtml(),
    );
  }
}
