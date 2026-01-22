import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart' as html;

import '../utils/test_utils.dart';

void main() {
  group('Column', () {
    test('renders as table with 100% width', () {
      final widget = html.Column(children: [html.Text('Item 1')]);
      final fragment = renderAndParse(widget);
      final table = findFirst(fragment, 'table');

      expect(table, isNotNull);
      expect(getAttribute(table!, 'width'), equals('100%'));
      expect(getAttribute(table, 'border'), equals('0'));
    });

    test('renders each child in separate row', () {
      final widget = html.Column(
        children: [
          html.Text('Item 1'),
          html.Text('Item 2'),
          html.Text('Item 3'),
        ],
      );
      final fragment = renderAndParse(widget);
      final trs = findAll(fragment, 'tr');

      expect(trs.length, equals(3));
    });

    test('applies spacing between children', () {
      final widget = html.Column(
        children: [html.Text('Item 1'), html.Text('Item 2')],
        spacing: 15,
      );
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
      final widget = html.Column(
        children: [html.Text('Item')],
        crossAxisAlignment: html.CrossAxisAlignment.start,
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('left'));
    });

    test('applies crossAxisAlignment center', () {
      final widget = html.Column(
        children: [html.Text('Item')],
        crossAxisAlignment: html.CrossAxisAlignment.center,
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('center'));
    });

    test('applies crossAxisAlignment end (right)', () {
      final widget = html.Column(
        children: [html.Text('Item')],
        crossAxisAlignment: html.CrossAxisAlignment.end,
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('right'));
    });

    test('has border-collapse style', () {
      final widget = html.Column(children: [html.Text('Item')]);
      final fragment = renderAndParse(widget);
      final table = findFirst(fragment, 'table');

      expect(table, isNotNull);
      expect(hasStyle(table!, 'border-collapse', 'collapse'), isTrue);
    });

    test('nested columns work correctly', () {
      final widget = html.Column(
        children: [
          html.Column(
            children: [html.Text('Nested 1'), html.Text('Nested 2')],
          ),
          html.Text('Outer'),
        ],
      );
      final fragment = renderAndParse(widget);
      final tables = findAll(fragment, 'table');

      // Outer column table + inner column table
      expect(tables.length, equals(2));
    });
  });
}
