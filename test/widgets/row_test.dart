import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart' as html;

import '../utils/test_utils.dart';

void main() {
  group('Row', () {
    test('renders as table with single row', () {
      final widget = html.Row(children: [html.Text('Item 1')]);
      final fragment = renderAndParse(widget);
      final table = findFirst(fragment, 'table');

      expect(table, isNotNull);
      expect(getAttribute(table!, 'border'), equals('0'));
      expect(getAttribute(table, 'cellpadding'), equals('0'));
      expect(getAttribute(table, 'cellspacing'), equals('0'));
    });

    test('renders multiple children in single row', () {
      final widget = html.Row(
        children: [
          html.Text('Item 1'),
          html.Text('Item 2'),
          html.Text('Item 3'),
        ],
      );
      final fragment = renderAndParse(widget);
      final tds = findAll(fragment, 'td');

      // Should have 3 cells for 3 children
      expect(tds.length, equals(3));
    });

    test('applies spacing between children', () {
      final widget = html.Row(
        children: [html.Text('Item 1'), html.Text('Item 2')],
        spacing: 20,
      );
      final fragment = renderAndParse(widget);
      final tds = findAll(fragment, 'td');

      // 2 content cells + 1 spacing cell = 3 cells
      expect(tds.length, equals(3));

      // Check spacing cell
      final spacingCell = tds[1];
      expect(hasStyle(spacingCell, 'width', '20.0px'), isTrue);
    });

    test('applies mainAxisAlignment start', () {
      final widget = html.Row(
        children: [html.Text('Item')],
        mainAxisAlignment: html.MainAxisAlignment.start,
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('left'));
    });

    test('applies mainAxisAlignment center', () {
      final widget = html.Row(
        children: [html.Text('Item')],
        mainAxisAlignment: html.MainAxisAlignment.center,
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('center'));
    });

    test('applies mainAxisAlignment end', () {
      final widget = html.Row(
        children: [html.Text('Item')],
        mainAxisAlignment: html.MainAxisAlignment.end,
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('right'));
    });

    test('applies crossAxisAlignment start', () {
      final widget = html.Row(
        children: [html.Text('Item')],
        crossAxisAlignment: html.CrossAxisAlignment.start,
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'valign'), equals('top'));
    });

    test('applies crossAxisAlignment center', () {
      final widget = html.Row(
        children: [html.Text('Item')],
        crossAxisAlignment: html.CrossAxisAlignment.center,
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'valign'), equals('middle'));
    });

    test('applies crossAxisAlignment end', () {
      final widget = html.Row(
        children: [html.Text('Item')],
        crossAxisAlignment: html.CrossAxisAlignment.end,
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'valign'), equals('bottom'));
    });

    test('has border-collapse style', () {
      final widget = html.Row(children: [html.Text('Item')]);
      final fragment = renderAndParse(widget);
      final table = findFirst(fragment, 'table');

      expect(table, isNotNull);
      expect(hasStyle(table!, 'border-collapse', 'collapse'), isTrue);
    });
  });
}
