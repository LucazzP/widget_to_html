import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart';

import '../utils/html_test_utils.dart';

void main() {
  group('HtmlContainer', () {
    test('renders empty container as div', () {
      final widget = HtmlContainer();
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(div!.innerHtml, isEmpty);
    });

    test('renders child content', () {
      final widget = HtmlContainer(child: HtmlText('Hello'));
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(div!.innerHtml, contains('<p'));
      expect(div.innerHtml, contains('Hello'));
    });

    test('applies width style', () {
      final widget = HtmlContainer(width: 200);
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'width', '200.0px'), isTrue);
    });

    test('applies height style', () {
      final widget = HtmlContainer(height: 150);
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'height', '150.0px'), isTrue);
    });

    test('applies background color', () {
      final widget = HtmlContainer(color: const Color(0xFFFF0000));
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'background-color', '#ff0000'), isTrue);
    });

    test('applies padding', () {
      final widget = HtmlContainer(padding: const EdgeInsets.all(10));
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'padding', '10.0px 10.0px 10.0px 10.0px'), isTrue);
    });

    test('applies margin', () {
      final widget = HtmlContainer(margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10));
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'margin', '10.0px 20.0px 10.0px 20.0px'), isTrue);
    });

    test('applies border', () {
      final widget = HtmlContainer(border: Border.all(color: Colors.black, width: 2));
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'border', '2.0px solid #000000'), isTrue);
    });

    test('applies border radius', () {
      final widget = HtmlContainer(borderRadius: BorderRadius.circular(8));
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'border-radius', '8.0px'), isTrue);
    });

    test('applies box constraints min-width', () {
      final widget = HtmlContainer(constraints: const BoxConstraints(minWidth: 100));
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'min-width', '100.0px'), isTrue);
    });

    test('applies box constraints max-width', () {
      final widget = HtmlContainer(constraints: const BoxConstraints(maxWidth: 500));
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'max-width', '500.0px'), isTrue);
    });

    test('combines multiple styles', () {
      final widget = HtmlContainer(
        width: 300,
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        borderRadius: BorderRadius.circular(4),
      );
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'width', '300.0px'), isTrue);
      expect(hasStyle(div, 'background-color', '#ffffff'), isTrue);
      expect(hasStyle(div, 'padding', '20.0px 20.0px 20.0px 20.0px'), isTrue);
      expect(hasStyle(div, 'border-radius', '4.0px'), isTrue);
    });
  });
}
