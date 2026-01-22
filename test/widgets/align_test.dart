import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart' as html;

import '../utils/test_utils.dart';

void main() {
  group('Align', () {
    test('renders as table with child', () {
      final widget = html.Align(child: html.Text('Aligned'));
      final fragment = renderAndParse(widget);
      final table = findFirst(fragment, 'table');

      expect(table, isNotNull);
      expect(getAttribute(table!, 'width'), equals('100%'));
    });

    test('defaults to topLeft alignment', () {
      final widget = html.Align(child: html.Text('Aligned'));
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('left'));
      expect(getAttribute(td, 'valign'), equals('top'));
    });

    test('applies topCenter alignment', () {
      final widget = html.Align(
        alignment: html.Alignment.topCenter,
        child: html.Text('Aligned'),
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('center'));
      expect(getAttribute(td, 'valign'), equals('top'));
    });

    test('applies topRight alignment', () {
      final widget = html.Align(
        alignment: html.Alignment.topRight,
        child: html.Text('Aligned'),
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('right'));
      expect(getAttribute(td, 'valign'), equals('top'));
    });

    test('applies centerLeft alignment', () {
      final widget = html.Align(
        alignment: html.Alignment.centerLeft,
        child: html.Text('Aligned'),
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('left'));
      expect(getAttribute(td, 'valign'), equals('middle'));
    });

    test('applies center alignment', () {
      final widget = html.Align(
        alignment: html.Alignment.center,
        child: html.Text('Aligned'),
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('center'));
      expect(getAttribute(td, 'valign'), equals('middle'));
    });

    test('applies centerRight alignment', () {
      final widget = html.Align(
        alignment: html.Alignment.centerRight,
        child: html.Text('Aligned'),
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('right'));
      expect(getAttribute(td, 'valign'), equals('middle'));
    });

    test('applies bottomLeft alignment', () {
      final widget = html.Align(
        alignment: html.Alignment.bottomLeft,
        child: html.Text('Aligned'),
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('left'));
      expect(getAttribute(td, 'valign'), equals('bottom'));
    });

    test('applies bottomCenter alignment', () {
      final widget = html.Align(
        alignment: html.Alignment.bottomCenter,
        child: html.Text('Aligned'),
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('center'));
      expect(getAttribute(td, 'valign'), equals('bottom'));
    });

    test('applies bottomRight alignment', () {
      final widget = html.Align(
        alignment: html.Alignment.bottomRight,
        child: html.Text('Aligned'),
      );
      final fragment = renderAndParse(widget);
      final td = findFirst(fragment, 'td');

      expect(td, isNotNull);
      expect(getAttribute(td!, 'align'), equals('right'));
      expect(getAttribute(td, 'valign'), equals('bottom'));
    });

    test('applies custom alignment values', () {
      final widget = html.Align(
        alignment: const html.Alignment(0.3, -0.8),
        child: html.Text('Aligned'),
      );
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
