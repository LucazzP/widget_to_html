import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart' as html;

import '../utils/test_utils.dart';

void main() {
  group('SizedBox', () {
    test('renders as div with display block', () {
      final widget = html.SizedBox();
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'display', 'block'), isTrue);
    });

    test('applies width', () {
      final widget = html.SizedBox(width: 100);
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'width', '100.0px'), isTrue);
    });

    test('applies height', () {
      final widget = html.SizedBox(height: 50);
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'height', '50.0px'), isTrue);
    });

    test('applies both width and height', () {
      final widget = html.SizedBox(width: 200, height: 150);
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'width', '200.0px'), isTrue);
      expect(hasStyle(div, 'height', '150.0px'), isTrue);
    });

    test('renders empty when no child', () {
      final widget = html.SizedBox(width: 100, height: 50);
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(div!.innerHtml, isEmpty);
    });

    test('renders child content', () {
      final widget = html.SizedBox(
        width: 200,
        height: 100,
        child: html.Text('Inside SizedBox'),
      );
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(div!.innerHtml, contains('Inside SizedBox'));
    });

    test('works as vertical spacer', () {
      final widget = html.SizedBox(height: 20);
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'height', '20.0px'), isTrue);
      expect(getStyleProperty(div, 'width'), isNull);
    });

    test('works as horizontal spacer', () {
      final widget = html.SizedBox(width: 30);
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'width', '30.0px'), isTrue);
      expect(getStyleProperty(div, 'height'), isNull);
    });
  });
}
