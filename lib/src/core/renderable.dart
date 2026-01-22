import 'package:widget_to_html/src/core/context.dart';

/// Abstract base class for all HTML renderable widgets
abstract class HtmlRenderable {
  String renderAsHtml(HtmlContext context);
}

abstract class HtmlRenderableWithChild extends HtmlRenderable {
  HtmlRenderable? get child;
}

abstract class HtmlRenderableWithChildren extends HtmlRenderable {
  List<HtmlRenderable> get children;
}
