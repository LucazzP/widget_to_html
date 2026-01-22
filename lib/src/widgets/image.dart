import 'dart:typed_data';

import 'package:widget_to_html/src/core/context.dart';
import 'package:widget_to_html/src/core/renderable.dart';
import 'package:widget_to_html/src/core/utility.dart';

/// Image widget for HTML emails
class Image extends HtmlRenderable {
  final String? src;
  final Uint8List? bytes;
  final double? width;
  final double? height;
  final String? alt;
  final String? mimeType;
  final String? link;
  final bool openInNewTab;

  Image({
    this.src,
    this.bytes,
    this.width,
    this.height,
    this.alt,
    this.mimeType,
    this.link,
    this.openInNewTab = true,
  }) : assert(
          src != null || bytes != null,
          'Either src or bytes must be provided',
        );

  @override
  String renderAsHtml(HtmlContext context) {
    final imgSrc = bytes != null ? toBase64DataUri(bytes!, mimeType: mimeType ?? 'image/png') : src!;

    final styles = <String, String>{
      'display': 'block',
      'border': '0',
      'outline': 'none',
    };

    if (width != null) styles['width'] = '${width}px';
    if (height != null) styles['height'] = '${height}px';

    final styleAttr = inlineStyle(styles);

    final attrs = <String, String>{'src': imgSrc, 'alt': alt ?? ''};
    if (width != null) attrs['width'] = '${width!.toInt()}';
    if (height != null) attrs['height'] = '${height!.toInt()}';

    final attrStr = attrs.entries.map((e) => '${e.key}="${e.value}"').join(' ');

    final imgHtml = '<img $attrStr$styleAttr />';

    if (link == null) {
      return imgHtml;
    }

    final linkAttrs = <String, String>{'href': link!};
    if (openInNewTab) {
      linkAttrs['target'] = '_blank';
      linkAttrs['rel'] = 'noopener noreferrer';
    }

    final linkAttrStr = linkAttrs.entries.map((e) => '${e.key}="${e.value}"').join(' ');

    return '<a $linkAttrStr$styleAttr>$imgHtml</a>';
  }
}
