import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart' as html;

import '../utils/test_utils.dart';

void main() {
  group('Text', () {
    test('renders as p element', () {
      final widget = html.Text('Hello World');
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(p!.text, equals('Hello World'));
    });

    test('applies default margin and padding', () {
      final widget = html.Text('Hello');
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'margin', '0'), isTrue);
      expect(hasStyle(p, 'padding', '0'), isTrue);
    });

    test('applies font family', () {
      final widget = html.Text(
        'Hello',
        style: const html.TextStyle(fontFamily: 'Arial'),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'font-family', 'Arial'), isTrue);
    });

    test('applies font size', () {
      final widget = html.Text(
        'Hello',
        style: const html.TextStyle(fontSize: 18),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'font-size', '18.0px'), isTrue);
    });

    test('applies font weight', () {
      final widget = html.Text(
        'Hello',
        style: const html.TextStyle(fontWeight: html.FontWeight.bold),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'font-weight', '700'), isTrue);
    });

    test('applies font style italic', () {
      final widget = html.Text(
        'Hello',
        style: const html.TextStyle(fontStyle: html.FontStyle.italic),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'font-style', 'italic'), isTrue);
    });

    test('applies text color', () {
      final widget = html.Text(
        'Hello',
        style: const html.TextStyle(color: html.Color(0xFF0000FF)),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'color', '#0000ff'), isTrue);
    });

    test('applies background color', () {
      final widget = html.Text(
        'Hello',
        style: const html.TextStyle(
          backgroundColor: html.Color(0xFFFFFF00),
        ),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'background-color', '#ffff00'), isTrue);
    });

    test('applies line height', () {
      final widget = html.Text(
        'Hello',
        style: const html.TextStyle(height: 1.5),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'line-height', '1.5'), isTrue);
    });

    test('applies letter spacing', () {
      final widget = html.Text(
        'Hello',
        style: const html.TextStyle(letterSpacing: 2),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'letter-spacing', '2.0px'), isTrue);
    });

    test('applies text decoration underline', () {
      final widget = html.Text(
        'Hello',
        style: const html.TextStyle(
          decoration: html.TextDecoration.underline,
        ),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'text-decoration', 'underline'), isTrue);
    });

    test('applies text decoration line-through', () {
      final widget = html.Text(
        'Hello',
        style: const html.TextStyle(
          decoration: html.TextDecoration.lineThrough,
        ),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'text-decoration', 'line-through'), isTrue);
    });

    test('applies text align center', () {
      final widget = html.Text(
        'Hello',
        textAlign: html.TextAlign.center,
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'text-align', 'center'), isTrue);
    });

    test('applies text align right', () {
      final widget = html.Text(
        'Hello',
        textAlign: html.TextAlign.right,
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'text-align', 'right'), isTrue);
    });

    test('escapes HTML special characters', () {
      final widget = html.Text('<script>alert("XSS")</script>');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('&lt;script&gt;'));
      expect(htmlOutput, contains('&lt;&#x2F;script&gt;'));
      expect(htmlOutput, isNot(contains('<script>')));
    });

    test('escapes ampersands', () {
      final widget = html.Text('Tom & Jerry');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('Tom &amp; Jerry'));
    });

    test('escapes quotes', () {
      final widget = html.Text('Say "Hello"');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('&quot;Hello&quot;'));
    });
  });
}
