import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart' as html;

import '../utils/test_utils.dart';

void main() {
  group('Divider', () {
    test('renders as hr element', () {
      final widget = html.Divider();
      final fragment = renderAndParse(widget);
      final hr = findFirst(fragment, 'hr');

      expect(hr, isNotNull);
    });

    test('applies default height of 1px', () {
      final widget = html.Divider();
      final fragment = renderAndParse(widget);
      final hr = findFirst(fragment, 'hr');

      expect(hr, isNotNull);
      expect(hasStyle(hr!, 'height', '1.0px'), isTrue);
    });

    test('applies custom height', () {
      final widget = html.Divider(height: 3);
      final fragment = renderAndParse(widget);
      final hr = findFirst(fragment, 'hr');

      expect(hr, isNotNull);
      expect(hasStyle(hr!, 'height', '3.0px'), isTrue);
    });

    test('applies default color', () {
      final widget = html.Divider();
      final fragment = renderAndParse(widget);
      final hr = findFirst(fragment, 'hr');

      expect(hr, isNotNull);
      expect(hasStyle(hr!, 'background-color', '#e0e0e0'), isTrue);
    });

    test('applies custom color', () {
      final widget = html.Divider(color: html.Colors.red);
      final fragment = renderAndParse(widget);
      final hr = findFirst(fragment, 'hr');

      expect(hr, isNotNull);
      expect(hasStyle(hr!, 'background-color', '#ff0000'), isTrue);
    });

    test('applies default margin', () {
      final widget = html.Divider();
      final fragment = renderAndParse(widget);
      final hr = findFirst(fragment, 'hr');

      expect(hr, isNotNull);
      // Default is EdgeInsets.symmetric(vertical: 16)
      expect(hasStyle(hr!, 'margin', '16.0px 0.0px 16.0px 0.0px'), isTrue);
    });

    test('applies custom margin', () {
      final widget = html.Divider(
        margin: const html.EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      );
      final fragment = renderAndParse(widget);
      final hr = findFirst(fragment, 'hr');

      expect(hr, isNotNull);
      expect(hasStyle(hr!, 'margin', '10.0px 20.0px 10.0px 20.0px'), isTrue);
    });

    test('has border none', () {
      final widget = html.Divider();
      final fragment = renderAndParse(widget);
      final hr = findFirst(fragment, 'hr');

      expect(hr, isNotNull);
      expect(hasStyle(hr!, 'border', 'none'), isTrue);
    });

    test('combines all custom properties', () {
      final widget = html.Divider(
        height: 2,
        color: const html.Color(0xFF333333),
        margin: const html.EdgeInsets.all(8),
      );
      final fragment = renderAndParse(widget);
      final hr = findFirst(fragment, 'hr');

      expect(hr, isNotNull);
      expect(hasStyle(hr!, 'height', '2.0px'), isTrue);
      expect(hasStyle(hr, 'background-color', '#333333'), isTrue);
      expect(hasStyle(hr, 'margin', '8.0px 8.0px 8.0px 8.0px'), isTrue);
    });
  });
}
