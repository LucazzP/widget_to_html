import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart';

import '../utils/html_test_utils.dart';

void main() {
  group('HtmlText', () {
    test('renders as p element', () {
      final widget = HtmlText('Hello World');
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(p!.text, equals('Hello World'));
    });

    test('applies default margin and padding', () {
      final widget = HtmlText('Hello');
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'margin', '0'), isTrue);
      expect(hasStyle(p, 'padding', '0'), isTrue);
    });

    test('applies font family', () {
      final widget = HtmlText(
        'Hello',
        style: const TextStyle(fontFamily: 'Arial'),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'font-family', 'Arial'), isTrue);
    });

    test('applies font size', () {
      final widget = HtmlText('Hello', style: const TextStyle(fontSize: 18));
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'font-size', '18.0px'), isTrue);
    });

    test('applies font weight', () {
      final widget = HtmlText(
        'Hello',
        style: const TextStyle(fontWeight: FontWeight.bold),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'font-weight', '700'), isTrue);
    });

    test('applies font style italic', () {
      final widget = HtmlText(
        'Hello',
        style: const TextStyle(fontStyle: FontStyle.italic),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'font-style', 'italic'), isTrue);
    });

    test('applies text color', () {
      final widget = HtmlText(
        'Hello',
        style: const TextStyle(color: Color(0xFF0000FF)),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'color', '#0000ff'), isTrue);
    });

    test('applies background color', () {
      final widget = HtmlText(
        'Hello',
        style: const TextStyle(backgroundColor: Color(0xFFFFFF00)),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'background-color', '#ffff00'), isTrue);
    });

    test('applies line height', () {
      final widget = HtmlText('Hello', style: const TextStyle(height: 1.5));
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'line-height', '1.5'), isTrue);
    });

    test('applies letter spacing', () {
      final widget = HtmlText(
        'Hello',
        style: const TextStyle(letterSpacing: 2),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'letter-spacing', '2.0px'), isTrue);
    });

    test('applies text decoration underline', () {
      final widget = HtmlText(
        'Hello',
        style: const TextStyle(decoration: TextDecoration.underline),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'text-decoration', 'underline'), isTrue);
    });

    test('applies text decoration line-through', () {
      final widget = HtmlText(
        'Hello',
        style: const TextStyle(decoration: TextDecoration.lineThrough),
      );
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'text-decoration', 'line-through'), isTrue);
    });

    test('applies text align center', () {
      final widget = HtmlText('Hello', textAlign: TextAlign.center);
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'text-align', 'center'), isTrue);
    });

    test('applies text align right', () {
      final widget = HtmlText('Hello', textAlign: TextAlign.right);
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'text-align', 'right'), isTrue);
    });

    test('escapes HTML special characters', () {
      final widget = HtmlText('<script>alert("XSS")</script>');
      final html = renderWidget(widget);

      expect(html, contains('&lt;script&gt;'));
      expect(html, contains('&lt;&#x2F;script&gt;'));
      expect(html, isNot(contains('<script>')));
    });

    test('escapes ampersands', () {
      final widget = HtmlText('Tom & Jerry');
      final html = renderWidget(widget);

      expect(html, contains('Tom &amp; Jerry'));
    });

    test('escapes quotes', () {
      final widget = HtmlText('Say "Hello"');
      final html = renderWidget(widget);

      expect(html, contains('&quot;Hello&quot;'));
    });
  });
}
