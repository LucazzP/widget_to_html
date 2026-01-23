import 'package:flutter/widgets.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;

extension RadiusHtmlExtension on flutter.Radius {
  html.Radius toHtml() {
    if (x == y) {
      return html.Radius.circular(x);
    }
    return html.Radius.elliptical(x, y);
  }
}

extension BorderRadiusHtmlExtension on flutter.BorderRadius {
  html.BorderRadius toHtml() {
    return html.BorderRadius.only(
      topLeft: topLeft.toHtml(),
      topRight: topRight.toHtml(),
      bottomLeft: bottomLeft.toHtml(),
      bottomRight: bottomRight.toHtml(),
    );
  }
}

extension BorderRadiusDirectionalHtmlExtension on flutter.BorderRadiusDirectional {
  html.BorderRadiusDirectional toHtml() {
    return html.BorderRadiusDirectional.only(
      topStart: topStart.toHtml(),
      topEnd: topEnd.toHtml(),
      bottomStart: bottomStart.toHtml(),
      bottomEnd: bottomEnd.toHtml(),
    );
  }
}

extension BorderRadiusGeometryHtmlExtension on flutter.BorderRadiusGeometry {
  html.BorderRadiusGeometry toHtml({
    flutter.TextDirection direction = flutter.TextDirection.ltr,
  }) {
    if (this is flutter.BorderRadiusDirectional) {
      return (this as flutter.BorderRadiusDirectional).toHtml();
    }
    if (this is flutter.BorderRadius) {
      return (this as flutter.BorderRadius).toHtml();
    }
    return resolve(direction).toHtml();
  }
}
