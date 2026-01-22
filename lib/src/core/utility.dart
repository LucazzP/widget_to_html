import 'dart:convert';
import 'dart:typed_data';

/// HTML escape utility
String htmlEscape(String text) {
  return text
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;')
      .replaceAll('"', '&quot;')
      .replaceAll("'", '&#x27;')
      .replaceAll('/', '&#x2F;');
}

/// Converts Uint8List to base64 data URI for embedding images
String toBase64DataUri(Uint8List bytes, {String mimeType = 'image/png'}) {
  final base64 = base64Encode(bytes);
  return 'data:$mimeType;base64,$base64';
}

/// Builds a complete HTML element
String element(
  String tagName,
  String content, {
  Map<String, String>? attributes,
}) {
  final attrs = StringBuffer();
  if (attributes != null) {
    attributes.forEach((key, value) {
      attrs.write(' $key="$value"');
    });
  }
  return '<$tagName${attrs.toString()}>$content</$tagName>';
}

/// Builds a self-closing HTML element
String selfClosingElement(String tagName, {Map<String, String>? attributes}) {
  final attrs = StringBuffer();
  if (attributes != null) {
    attributes.forEach((key, value) {
      attrs.write(' $key="$value"');
    });
  }
  return '<$tagName${attrs.toString()} />';
}

/// Converts CSS properties to inline style string
String inlineStyle(Map<String, String> properties) {
  if (properties.isEmpty) return '';
  final styles = properties.entries.map((e) => '${e.key}:${e.value}').join(';');
  return ' style="$styles"';
}
