import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart' as html;

import '../utils/test_utils.dart';

void main() {
  group('RichText', () {
    test('renders as p element', () {
      final widget = html.RichText(spans: [html.TextSpan('Hello')]);
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
    });

    test('p element has zero margin and padding', () {
      final widget = html.RichText(spans: [html.TextSpan('Hello')]);
      final fragment = renderAndParse(widget);
      final p = findFirst(fragment, 'p');

      expect(p, isNotNull);
      expect(hasStyle(p!, 'margin', '0'), isTrue);
      expect(hasStyle(p, 'padding', '0'), isTrue);
    });

    test('renders single span as span element', () {
      final widget = html.RichText(spans: [html.TextSpan('Hello')]);
      final fragment = renderAndParse(widget);
      final span = findFirst(fragment, 'span');

      expect(span, isNotNull);
      expect(span!.text, equals('Hello'));
    });

    test('renders multiple spans', () {
      final widget = html.RichText(
        spans: [html.TextSpan('Hello '), html.TextSpan('World')],
      );
      final fragment = renderAndParse(widget);
      final spans = findAll(fragment, 'span');

      expect(spans.length, equals(2));
      expect(spans[0].text, equals('Hello '));
      expect(spans[1].text, equals('World'));
    });

    test('applies font family to span', () {
      final widget = html.RichText(
        spans: [
          html.TextSpan(
            'Hello',
            style: const html.TextStyle(fontFamily: 'Georgia'),
          ),
        ],
      );
      final fragment = renderAndParse(widget);
      final span = findFirst(fragment, 'span');

      expect(span, isNotNull);
      expect(hasStyle(span!, 'font-family', 'Georgia'), isTrue);
    });

    test('applies font size to span', () {
      final widget = html.RichText(
        spans: [
          html.TextSpan(
            'Hello',
            style: const html.TextStyle(fontSize: 20),
          ),
        ],
      );
      final fragment = renderAndParse(widget);
      final span = findFirst(fragment, 'span');

      expect(span, isNotNull);
      expect(hasStyle(span!, 'font-size', '20.0px'), isTrue);
    });

    test('applies font weight to span', () {
      final widget = html.RichText(
        spans: [
          html.TextSpan(
            'Bold',
            style: const html.TextStyle(fontWeight: html.FontWeight.bold),
          ),
        ],
      );
      final fragment = renderAndParse(widget);
      final span = findFirst(fragment, 'span');

      expect(span, isNotNull);
      expect(hasStyle(span!, 'font-weight', '700'), isTrue);
    });

    test('applies font style to span', () {
      final widget = html.RichText(
        spans: [
          html.TextSpan(
            'Italic',
            style: const html.TextStyle(fontStyle: html.FontStyle.italic),
          ),
        ],
      );
      final fragment = renderAndParse(widget);
      final span = findFirst(fragment, 'span');

      expect(span, isNotNull);
      expect(hasStyle(span!, 'font-style', 'italic'), isTrue);
    });

    test('applies color to span', () {
      final widget = html.RichText(
        spans: [
          html.TextSpan(
            'Colored',
            style: const html.TextStyle(color: html.Colors.red),
          ),
        ],
      );
      final fragment = renderAndParse(widget);
      final span = findFirst(fragment, 'span');

      expect(span, isNotNull);
      expect(hasStyle(span!, 'color', '#ff0000'), isTrue);
    });

    test('applies background color to span', () {
      final widget = html.RichText(
        spans: [
          html.TextSpan(
            'Highlighted',
            style: const html.TextStyle(backgroundColor: html.Colors.grey),
          ),
        ],
      );
      final fragment = renderAndParse(widget);
      final span = findFirst(fragment, 'span');

      expect(span, isNotNull);
      expect(hasStyle(span!, 'background-color', '#9e9e9e'), isTrue);
    });

    test('applies text decoration to span', () {
      final widget = html.RichText(
        spans: [
          html.TextSpan(
            'Underlined',
            style: const html.TextStyle(
              decoration: html.TextDecoration.underline,
            ),
          ),
        ],
      );
      final fragment = renderAndParse(widget);
      final span = findFirst(fragment, 'span');

      expect(span, isNotNull);
      expect(hasStyle(span!, 'text-decoration', 'underline'), isTrue);
    });

    test('renders span with href as anchor', () {
      final widget = html.RichText(
        spans: [html.TextSpan('Click here', href: 'https://example.com')],
      );
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(getAttribute(anchor!, 'href'), equals('https://example.com'));
      expect(anchor.text, equals('Click here'));
    });

    test('applies styles to anchor span', () {
      final widget = html.RichText(
        spans: [
          html.TextSpan(
            'Styled Link',
            href: 'https://example.com',
            style: const html.TextStyle(
              color: html.Colors.blue,
              fontWeight: html.FontWeight.bold,
            ),
          ),
        ],
      );
      final fragment = renderAndParse(widget);
      final anchor = findFirst(fragment, 'a');

      expect(anchor, isNotNull);
      expect(hasStyle(anchor!, 'color', '#0000ff'), isTrue);
      expect(hasStyle(anchor, 'font-weight', '700'), isTrue);
    });

    test('escapes HTML in span text', () {
      final widget = html.RichText(spans: [html.TextSpan('<b>Bold</b>')]);
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('&lt;b&gt;Bold&lt;&#x2F;b&gt;'));
      expect(htmlOutput, isNot(contains('<b>Bold</b>')));
    });

    test('mixed styled and unstyled spans', () {
      final widget = html.RichText(
        spans: [
          html.TextSpan('Normal '),
          html.TextSpan(
            'Bold',
            style: const html.TextStyle(fontWeight: html.FontWeight.bold),
          ),
          html.TextSpan(' and '),
          html.TextSpan('Link', href: 'https://example.com'),
        ],
      );
      final fragment = renderAndParse(widget);
      final spans = findAll(fragment, 'span');
      final anchors = findAll(fragment, 'a');

      expect(spans.length, equals(3));
      expect(anchors.length, equals(1));
    });
  });
}
