import '../html_base.dart';
import '../styles/styles.dart';

/// Container widget for HTML emails
class HtmlContainer extends HtmlRenderableWithChild {
  @override
  final HtmlRenderable? child;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Border? border;
  final BorderRadiusGeometry? borderRadius;

  HtmlContainer({
    this.child,
    this.width,
    this.height,
    this.constraints,
    this.color,
    this.padding,
    this.margin,
    this.border,
    this.borderRadius,
  });

  @override
  String renderAsHtml(HtmlContext context) {
    final styles = <String, String>{};

    if (width != null) styles['width'] = '${width}px';
    if (height != null) styles['height'] = '${height}px';

    // BoxConstraints
    if (constraints != null) {
      if (constraints!.minWidth > 0 && constraints!.minWidth != double.infinity) {
        styles['min-width'] = '${constraints!.minWidth}px';
      }
      if (constraints!.maxWidth < double.infinity) {
        styles['max-width'] = '${constraints!.maxWidth}px';
      }
      if (constraints!.minHeight > 0 && constraints!.minHeight != double.infinity) {
        styles['min-height'] = '${constraints!.minHeight}px';
      }
      if (constraints!.maxHeight < double.infinity) {
        styles['max-height'] = '${constraints!.maxHeight}px';
      }
    }

    if (color != null) styles['background-color'] = color!.toCss();
    if (padding != null) styles['padding'] = padding!.toCss();
    if (margin != null) styles['margin'] = margin!.toCss();
    if (border != null) {
      final borderCss = border!.toCss();
      if (borderCss != 'none') styles['border'] = borderCss;
    }
    if (borderRadius != null) styles['border-radius'] = borderRadius!.toCss();

    final builder = HtmlBuilder(context);
    final styleAttr = styles.isEmpty ? '' : builder.inlineStyle(styles);
    final childHtml = child?.renderAsHtml(context.nested()) ?? '';

    return '<div$styleAttr>$childHtml</div>';
  }
}
