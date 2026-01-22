import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart' as html;

import '../utils/test_utils.dart';

void main() {
  group('Link', () {
    test('renders as anchor element', () {
      final widget =
          html.Link(text: 'Click me', href: 'https://example.com');
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
    });

    test('sets href attribute', () {
      final widget =
          html.Link(text: 'Click me', href: 'https://example.com');
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(getAttribute(anchor!, 'href'), equals('https://example.com'));
    });

    test('renders text content', () {
      final widget = html.Link(text: 'Visit our site', href: '#');
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(anchor!.text, equals('Visit our site'));
    });

    test('applies default underline decoration', () {
      final widget = html.Link(text: 'Link', href: '#');
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(hasStyle(anchor!, 'text-decoration', 'underline'), isTrue);
    });

    test('applies color style', () {
      final widget = html.Link(
        text: 'Link',
        href: '#',
        style: const html.TextStyle(color: html.Color(0xFF007BFF)),
      );
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(hasStyle(anchor!, 'color', '#007bff'), isTrue);
    });

    test('applies font family', () {
      final widget = html.Link(
        text: 'Link',
        href: '#',
        style: const html.TextStyle(fontFamily: 'Verdana'),
      );
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(hasStyle(anchor!, 'font-family', 'Verdana'), isTrue);
    });

    test('applies font size', () {
      final widget = html.Link(
        text: 'Link',
        href: '#',
        style: const html.TextStyle(fontSize: 14),
      );
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(hasStyle(anchor!, 'font-size', '14.0px'), isTrue);
    });

    test('applies font weight', () {
      final widget = html.Link(
        text: 'Link',
        href: '#',
        style: const html.TextStyle(fontWeight: html.FontWeight.bold),
      );
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(hasStyle(anchor!, 'font-weight', '700'), isTrue);
    });

    test('applies font style', () {
      final widget = html.Link(
        text: 'Link',
        href: '#',
        style: const html.TextStyle(fontStyle: html.FontStyle.italic),
      );
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(hasStyle(anchor!, 'font-style', 'italic'), isTrue);
    });

    test('applies custom text decoration', () {
      final widget = html.Link(
        text: 'Link',
        href: '#',
        style: const html.TextStyle(decoration: html.TextDecoration.none),
      );
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(hasStyle(anchor!, 'text-decoration', 'none'), isTrue);
    });

    test('escapes HTML in text', () {
      final widget =
          html.Link(text: '<script>alert("XSS")</script>', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('&lt;script&gt;'));
      expect(htmlOutput, isNot(contains('<script>')));
    });

    test('escapes special characters in text', () {
      final widget = html.Link(text: 'Tom & Jerry', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('Tom &amp; Jerry'));
    });

    test('supports internal href with hash', () {
      final widget = html.Link(text: 'Go to section', href: '#section1');
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(getAttribute(anchor!, 'href'), equals('#section1'));
    });

    test('supports mailto href', () {
      final widget = html.Link(
        text: 'Email us',
        href: 'mailto:test@example.com',
      );
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(getAttribute(anchor!, 'href'), equals('mailto:test@example.com'));
    });
  });
}
