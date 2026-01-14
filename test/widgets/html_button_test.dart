import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart';

import '../utils/html_test_utils.dart';

void main() {
  group('HtmlButton', () {
    test('renders with VML for Outlook and anchor fallback', () {
      final widget = HtmlButton(text: 'Click me', href: 'https://example.com');
      final html = renderWidget(widget);

      // Check VML conditional comment for Outlook
      expect(html, contains('<!--[if mso]>'));
      expect(html, contains('<v:roundrect'));
      expect(html, contains('<![endif]-->'));

      // Check anchor fallback
      expect(html, contains('<!--[if !mso]><!-->'));
      expect(html, contains('<a href'));
    });

    test('sets href in both VML and anchor', () {
      final widget = HtmlButton(text: 'Click me', href: 'https://example.com');
      final html = renderWidget(widget);

      expect(html, contains('href="https://example.com"'));
    });

    test('renders button text', () {
      final widget = HtmlButton(text: 'Submit', href: '#');
      final html = renderWidget(widget);

      expect(html, contains('Submit'));
    });

    test('applies default background color', () {
      final widget = HtmlButton(text: 'Button', href: '#');
      final html = renderWidget(widget);

      expect(html, contains('background-color:#007bff'));
      expect(html, contains('fillcolor="#007bff"'));
    });

    test('applies custom background color', () {
      final widget = HtmlButton(
        text: 'Button',
        href: '#',
        backgroundColor: Colors.red,
      );
      final html = renderWidget(widget);

      expect(html, contains('background-color:#ff0000'));
      expect(html, contains('fillcolor="#ff0000"'));
    });

    test('applies default text color', () {
      final widget = HtmlButton(text: 'Button', href: '#');
      final html = renderWidget(widget);

      expect(html, contains('color:#ffffff'));
    });

    test('applies custom text color', () {
      final widget = HtmlButton(
        text: 'Button',
        href: '#',
        textColor: Colors.black,
      );
      final html = renderWidget(widget);

      expect(html, contains('color:#000000'));
    });

    test('applies default padding', () {
      final widget = HtmlButton(text: 'Button', href: '#');
      final html = renderWidget(widget);

      // Default is symmetric(horizontal: 24, vertical: 12)
      // horizontal = 48, vertical = 24; ph = 24, pv = 12
      expect(html, contains('padding:12.0px 24.0px'));
    });

    test('applies custom padding', () {
      final widget = HtmlButton(
        text: 'Button',
        href: '#',
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      );
      final html = renderWidget(widget);

      // horizontal = 80, vertical = 40; ph = 40, pv = 20
      expect(html, contains('padding:20.0px 40.0px'));
    });

    test('applies default border radius', () {
      final widget = HtmlButton(text: 'Button', href: '#');
      final html = renderWidget(widget);

      expect(html, contains('border-radius:4.0px'));
    });

    test('applies custom border radius', () {
      final widget = HtmlButton(
        text: 'Button',
        href: '#',
        borderRadius: BorderRadius.circular(8),
      );
      final html = renderWidget(widget);

      expect(html, contains('border-radius:8.0px'));
    });

    test('applies default font size', () {
      final widget = HtmlButton(text: 'Button', href: '#');
      final html = renderWidget(widget);

      expect(html, contains('font-size:16.0px'));
    });

    test('applies custom font size from textStyle', () {
      final widget = HtmlButton(
        text: 'Button',
        href: '#',
        textStyle: const TextStyle(fontSize: 20),
      );
      final html = renderWidget(widget);

      expect(html, contains('font-size:20.0px'));
    });

    test('applies default font weight bold', () {
      final widget = HtmlButton(text: 'Button', href: '#');
      final html = renderWidget(widget);

      expect(html, contains('font-weight:bold'));
    });

    test('applies custom font weight from textStyle', () {
      final widget = HtmlButton(
        text: 'Button',
        href: '#',
        textStyle: const TextStyle(fontWeight: FontWeight.w500),
      );
      final html = renderWidget(widget);

      expect(html, contains('font-weight:500'));
    });

    test('applies default font family sans-serif', () {
      final widget = HtmlButton(text: 'Button', href: '#');
      final html = renderWidget(widget);

      expect(html, contains('font-family:sans-serif'));
    });

    test('applies custom font family from textStyle', () {
      final widget = HtmlButton(
        text: 'Button',
        href: '#',
        textStyle: const TextStyle(fontFamily: 'Arial'),
      );
      final html = renderWidget(widget);

      expect(html, contains('font-family:Arial'));
    });

    test('has text-decoration none in anchor', () {
      final widget = HtmlButton(text: 'Button', href: '#');
      final html = renderWidget(widget);

      expect(html, contains('text-decoration:none'));
    });

    test('has display inline-block in anchor', () {
      final widget = HtmlButton(text: 'Button', href: '#');
      final html = renderWidget(widget);

      expect(html, contains('display:inline-block'));
    });

    test('has mso-hide all for non-Outlook', () {
      final widget = HtmlButton(text: 'Button', href: '#');
      final html = renderWidget(widget);

      expect(html, contains('mso-hide:all'));
    });

    test('VML has stroke false', () {
      final widget = HtmlButton(text: 'Button', href: '#');
      final html = renderWidget(widget);

      expect(html, contains('stroke="false"'));
    });

    test('VML has v-text-anchor middle', () {
      final widget = HtmlButton(text: 'Button', href: '#');
      final html = renderWidget(widget);

      expect(html, contains('v-text-anchor:middle'));
    });
  });
}
