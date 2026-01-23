import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

extension EdgeInsetsHtmlExtension on flutter.EdgeInsets {
  html.EdgeInsets toHtml() {
    return html.EdgeInsets.fromLTRB(left, top, right, bottom);
  }
}

extension EdgeInsetsDirectionalHtmlExtension on flutter.EdgeInsetsDirectional {
  html.EdgeInsetsDirectional toHtml() {
    return html.EdgeInsetsDirectional.fromSTEB(start, top, end, bottom);
  }
}

extension EdgeInsetsGeometryHtmlExtension on flutter.EdgeInsetsGeometry {
  html.EdgeInsetsGeometry toHtml({
    flutter.TextDirection direction = flutter.TextDirection.ltr,
  }) {
    if (this is flutter.EdgeInsetsDirectional) {
      return (this as flutter.EdgeInsetsDirectional).toHtml();
    }
    if (this is flutter.EdgeInsets) {
      return (this as flutter.EdgeInsets).toHtml();
    }
    return resolve(direction).toHtml();
  }
}
