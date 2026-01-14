import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart';

import '../utils/html_test_utils.dart';

void main() {
  group('HtmlAlign', () {
    test('renders as table with child', () {
      final widget = HtmlAlign(child: HtmlText('Aligned'));
      final fragment = renderAndParse(widget);
      final table = findFirst(fragment, 'table');

      expect(table, isNotNull);
      expect(getAttribute(table!, 'width'), equals('100%'));
    });

    test('defaults to topLeft alignment', () {
      final widget = HtmlAlign(child: HtmlText('Aligned'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('left'));
      expect(getAttribute(td, 'valign'), equals('top'));
    });

    test('applies topCenter alignment', () {
      final widget = HtmlAlign(alignment: Alignment.topCenter, child: HtmlText('Aligned'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('center'));
      expect(getAttribute(td, 'valign'), equals('top'));
    });

    test('applies topRight alignment', () {
      final widget = HtmlAlign(alignment: Alignment.topRight, child: HtmlText('Aligned'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('right'));
      expect(getAttribute(td, 'valign'), equals('top'));
    });

    test('applies centerLeft alignment', () {
      final widget = HtmlAlign(alignment: Alignment.centerLeft, child: HtmlText('Aligned'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('left'));
      expect(getAttribute(td, 'valign'), equals('middle'));
    });

    test('applies center alignment', () {
      final widget = HtmlAlign(alignment: Alignment.center, child: HtmlText('Aligned'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('center'));
      expect(getAttribute(td, 'valign'), equals('middle'));
    });

    test('applies centerRight alignment', () {
      final widget = HtmlAlign(alignment: Alignment.centerRight, child: HtmlText('Aligned'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('right'));
      expect(getAttribute(td, 'valign'), equals('middle'));
    });

    test('applies bottomLeft alignment', () {
      final widget = HtmlAlign(alignment: Alignment.bottomLeft, child: HtmlText('Aligned'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('left'));
      expect(getAttribute(td, 'valign'), equals('bottom'));
    });

    test('applies bottomCenter alignment', () {
      final widget = HtmlAlign(alignment: Alignment.bottomCenter, child: HtmlText('Aligned'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('center'));
      expect(getAttribute(td, 'valign'), equals('bottom'));
    });

    test('applies bottomRight alignment', () {
      final widget = HtmlAlign(alignment: Alignment.bottomRight, child: HtmlText('Aligned'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('right'));
      expect(getAttribute(td, 'valign'), equals('bottom'));
    });

    test('applies custom alignment values', () {
      final widget = HtmlAlign(alignment: const Alignment(0.3, -0.8), child: HtmlText('Aligned'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      // 0.3 is between -0.5 and 0.5, so center
      expect(getAttribute(td!, 'align'), equals('center'));
      // -0.8 is <= -0.5, so top
      expect(getAttribute(td, 'valign'), equals('top'));
    });
  });
}
