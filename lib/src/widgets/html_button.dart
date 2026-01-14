import '../html_base.dart';
import '../styles/styles.dart';

/// Button widget for HTML emails (bulletproof button)
class HtmlButton extends HtmlRenderable {
  final String text;
  final String href;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  HtmlButton({
    required this.text,
    required this.href,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.textStyle,
    this.borderRadius,
    this.padding,
  });

  @override
  String renderAsHtml(HtmlContext context) {
    final bgColor = backgroundColor?.toCss() ?? '#007bff';
    final txtColor = textColor?.toCss() ?? '#ffffff';

    final resolvedPadding =
        padding?.resolve(TextDirection.ltr) ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
    final ph = resolvedPadding.horizontal / 2;
    final pv = resolvedPadding.vertical / 2;

    final fs = textStyle?.fontSize ?? 16;
    final fw = textStyle?.fontWeight?.toCss() ?? 'bold';
    final fontFamily = textStyle?.fontFamily ?? 'sans-serif';

    final br = borderRadius?.resolve(TextDirection.ltr).topLeft.x ?? 4.0;

    // Using VML for Outlook compatibility (bulletproof button technique)
    final widthAttr = width != null ? 'width="${width!.toInt()}"' : '';
    final heightAttr = height != null ? 'height="${height!.toInt()}"' : '';

    return '''<!--[if mso]>
<v:roundrect xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w="urn:schemas-microsoft-com:office:word" href="$href" style="v-text-anchor:middle;$widthAttr$heightAttr" arcsize="${(br / 50 * 100).toInt()}%" stroke="false" fillcolor="$bgColor">
  <w:anchorlock/>
  <center style="color:$txtColor;font-family:$fontFamily;font-size:${fs}px;font-weight:$fw;">$text</center>
</v:roundrect>
<![endif]-->
<!--[if !mso]><!-->
<a href="$href" style="display:inline-block;background-color:$bgColor;color:$txtColor;font-family:$fontFamily;font-size:${fs}px;font-weight:$fw;text-decoration:none;padding:${pv}px ${ph}px;border-radius:${br}px;mso-hide:all;">$text</a>
<!--<![endif]-->''';
  }
}
