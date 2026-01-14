import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart';

import '../utils/html_test_utils.dart';

void main() {
  group('HtmlColumn', () {
    test('renders as table with 100% width', () {
      final widget = HtmlColumn(children: [HtmlText('Item 1')]);
      final fragment = renderAndParse(widget);
      final table = findFirst(fragment, 'table');

      expect(table, isNotNull);
      expect(getAttribute(table!, 'width'), equals('100%'));
      expect(getAttribute(table, 'border'), equals('0'));
    });

    test('renders each child in separate row', () {
      final widget = HtmlColumn(children: [HtmlText('Item 1'), HtmlText('Item 2'), HtmlText('Item 3')]);
      final fragment = renderAndParse(widget);
      final trs = findAll(fragment, 'tr');

      expect(trs.length, equals(3));
    });

    test('applies spacing between children', () {
      final widget = HtmlColumn(children: [HtmlText('Item 1'), HtmlText('Item 2')], spacing: 15);
      final fragment = renderAndParse(widget);
      final trs = findAll(fragment, 'tr');

      // 2 content rows + 1 spacing row = 3 rows
      expect(trs.length, equals(3));

      // Check spacing row
      final spacingRow = trs[1];
      final spacingTd = spacingRow.querySelector('td');
      expect(spacingTd, isNotNull);
      expect(hasStyle(spacingTd!, 'height', '15.0px'), isTrue);
    });

    test('applies crossAxisAlignment start (left)', () {
      final widget = HtmlColumn(children: [HtmlText('Item')], crossAxisAlignment: CrossAxisAlignment.start);
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('left'));
    });

    test('applies crossAxisAlignment center', () {
      final widget = HtmlColumn(children: [HtmlText('Item')], crossAxisAlignment: CrossAxisAlignment.center);
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('center'));
    });

    test('applies crossAxisAlignment end (right)', () {
      final widget = HtmlColumn(children: [HtmlText('Item')], crossAxisAlignment: CrossAxisAlignment.end);
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('right'));
    });

    test('has border-collapse style', () {
      final widget = HtmlColumn(children: [HtmlText('Item')]);
      final fragment = renderAndParse(widget);
      final table = findFirst(fragment, 'table');

      expect(table, isNotNull);
      expect(hasStyle(table!, 'border-collapse', 'collapse'), isTrue);
    });

    test('nested columns work correctly', () {
      final widget = HtmlColumn(
        children: [
          HtmlColumn(children: [HtmlText('Nested 1'), HtmlText('Nested 2')]),
          HtmlText('Outer'),
        ],
      );
      final fragment = renderAndParse(widget);
      final tables = findAll(fragment, 'table');

      // Outer column table + inner column table
      expect(tables.length, equals(2));
    });
  });
}
