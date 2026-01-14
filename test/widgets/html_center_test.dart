import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart';

import '../utils/html_test_utils.dart';

void main() {
  group('HtmlCenter', () {
    test('renders as table with child', () {
      final widget = HtmlCenter(child: HtmlText('Centered'));
      final fragment = renderAndParse(widget);
      final table = findFirst(fragment, 'table');

      expect(table, isNotNull);
      expect(getAttribute(table!, 'width'), equals('100%'));
    });

    test('applies center alignment', () {
      final widget = HtmlCenter(child: HtmlText('Centered'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('center'));
      expect(getAttribute(td, 'valign'), equals('middle'));
    });

    test('renders child content', () {
      final widget = HtmlCenter(child: HtmlText('Hello World'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(td!.innerHtml, contains('Hello World'));
    });

    test('has border-collapse style', () {
      final widget = HtmlCenter(child: HtmlText('Centered'));
      final fragment = renderAndParse(widget);
      final table = findFirst(fragment, 'table');

      expect(table, isNotNull);
      expect(hasStyle(table!, 'border-collapse', 'collapse'), isTrue);
    });

    test('td has zero padding', () {
      final widget = HtmlCenter(child: HtmlText('Centered'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(hasStyle(td!, 'padding', '0'), isTrue);
    });

    test('can center nested containers', () {
      final widget = HtmlCenter(
        child: HtmlContainer(
          width: 200,
          color: Colors.red,
          child: HtmlText('In Container'),
        ),
      );
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'width', '200.0px'), isTrue);
    });
  });
}
