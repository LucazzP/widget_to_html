import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html_parser;
import 'package:widget_to_html/widget_to_html.dart' as html;
import 'package:widget_to_html/src/core/context.dart';

/// Renders an [HtmlRenderable] widget to an HTML string using a root context.
String renderWidget(html.HtmlRenderable widget) {
  final context = HtmlContext.root();
  return widget.renderAsHtml(context);
}

/// Parses an HTML string into a DOM document fragment for assertions.
dom.DocumentFragment parseHtml(String html) {
  return html_parser.parseFragment(html);
}

/// Renders a widget and parses the output into a DOM fragment.
dom.DocumentFragment renderAndParse(html.HtmlRenderable widget) {
  return parseHtml(renderWidget(widget));
}

/// Finds the first element matching the given tag name.
dom.Element? findFirst(dom.DocumentFragment fragment, String tagName) {
  return fragment.querySelector(tagName);
}

/// Finds all elements matching the given tag name.
List<dom.Element> findAll(dom.DocumentFragment fragment, String tagName) {
  return fragment.querySelectorAll(tagName);
}

/// Extracts inline style value for a given property from an element.
String? getStyleProperty(dom.Element element, String property) {
  final style = element.attributes['style'];
  if (style == null) return null;

  final properties = style.split(';');
  for (final prop in properties) {
    final parts = prop.split(':');
    if (parts.length == 2 && parts[0].trim() == property) {
      return parts[1].trim();
    }
  }
  return null;
}

/// Checks if an element has a specific style property with the given value.
bool hasStyle(dom.Element element, String property, String value) {
  return getStyleProperty(element, property) == value;
}

/// Gets an attribute value from an element.
String? getAttribute(dom.Element element, String attribute) {
  return element.attributes[attribute];
}
