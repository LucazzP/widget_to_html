import 'dart:typed_data';

import '../html_base.dart';

/// Image widget for HTML emails
class HtmlImage extends HtmlRenderable {
  final String? src;
  final Uint8List? bytes;
  final double? width;
  final double? height;
  final String? alt;
  final String? mimeType;

  HtmlImage({this.src, this.bytes, this.width, this.height, this.alt, this.mimeType})
    : assert(src != null || bytes != null, 'Either src or bytes must be provided');

  @override
  String renderAsHtml(HtmlContext context) {
    final imgSrc = bytes != null ? toBase64DataUri(bytes!, mimeType: mimeType ?? 'image/png') : src!;

    final styles = <String, String>{'display': 'block', 'border': '0', 'outline': 'none'};

    if (width != null) styles['width'] = '${width}px';
    if (height != null) styles['height'] = '${height}px';

    final builder = HtmlBuilder(context);
    final styleAttr = builder.inlineStyle(styles);

    final attrs = <String, String>{'src': imgSrc, 'alt': alt ?? ''};
    if (width != null) attrs['width'] = '${width!.toInt()}';
    if (height != null) attrs['height'] = '${height!.toInt()}';

    final attrStr = attrs.entries.map((e) => '${e.key}="${e.value}"').join(' ');

    return '<img $attrStr$styleAttr />';
  }
}
