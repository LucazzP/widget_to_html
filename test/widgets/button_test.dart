import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart' as html;

import '../utils/test_utils.dart';

void main() {
  group('Button', () {
    test('renders with VML for Outlook and anchor fallback', () {
      final widget =
          html.Button(text: 'Click me', href: 'https://example.com');
      final htmlOutput = renderWidget(widget);

      // Check VML conditional comment for Outlook
      expect(htmlOutput, contains('<!--[if mso]>'));
      expect(htmlOutput, contains('<v:roundrect'));
      expect(htmlOutput, contains('<![endif]-->'));

      // Check anchor fallback
      expect(htmlOutput, contains('<!--[if !mso]><!-->'));
      expect(htmlOutput, contains('<a href'));
    });

    test('sets href in both VML and anchor', () {
      final widget =
          html.Button(text: 'Click me', href: 'https://example.com');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('href="https://example.com"'));
    });

    test('renders button text', () {
      final widget = html.Button(text: 'Submit', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('Submit'));
    });

    test('applies default background color', () {
      final widget = html.Button(text: 'Button', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('background-color:#007bff'));
      expect(htmlOutput, contains('fillcolor="#007bff"'));
    });

    test('applies custom background color', () {
      final widget = html.Button(
        text: 'Button',
        href: '#',
        backgroundColor: html.Colors.red,
      );
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('background-color:#ff0000'));
      expect(htmlOutput, contains('fillcolor="#ff0000"'));
    });

    test('applies default text color', () {
      final widget = html.Button(text: 'Button', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('color:#ffffff'));
    });

    test('applies custom text color', () {
      final widget = html.Button(
        text: 'Button',
        href: '#',
        textColor: html.Colors.black,
      );
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('color:#000000'));
    });

    test('applies default padding', () {
      final widget = html.Button(text: 'Button', href: '#');
      final htmlOutput = renderWidget(widget);

      // Default is symmetric(horizontal: 24, vertical: 12)
      // horizontal = 48, vertical = 24; ph = 24, pv = 12
      expect(htmlOutput, contains('padding:12.0px 24.0px'));
    });

    test('applies custom padding', () {
      final widget = html.Button(
        text: 'Button',
        href: '#',
        padding: const html.EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      );
      final htmlOutput = renderWidget(widget);

      // horizontal = 80, vertical = 40; ph = 40, pv = 20
      expect(htmlOutput, contains('padding:20.0px 40.0px'));
    });

    test('applies default border radius', () {
      final widget = html.Button(text: 'Button', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('border-radius:4.0px'));
    });

    test('applies custom border radius', () {
      final widget = html.Button(
        text: 'Button',
        href: '#',
        borderRadius: html.BorderRadius.circular(8),
      );
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('border-radius:8.0px'));
    });

    test('applies default font size', () {
      final widget = html.Button(text: 'Button', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('font-size:16.0px'));
    });

    test('applies custom font size from textStyle', () {
      final widget = html.Button(
        text: 'Button',
        href: '#',
        textStyle: const html.TextStyle(fontSize: 20),
      );
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('font-size:20.0px'));
    });

    test('applies default font weight bold', () {
      final widget = html.Button(text: 'Button', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('font-weight:bold'));
    });

    test('applies custom font weight from textStyle', () {
      final widget = html.Button(
        text: 'Button',
        href: '#',
        textStyle: const html.TextStyle(fontWeight: html.FontWeight.w500),
      );
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('font-weight:500'));
    });

    test('applies default font family sans-serif', () {
      final widget = html.Button(text: 'Button', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('font-family:sans-serif'));
    });

    test('applies custom font family from textStyle', () {
      final widget = html.Button(
        text: 'Button',
        href: '#',
        textStyle: const html.TextStyle(fontFamily: 'Arial'),
      );
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('font-family:Arial'));
    });

    test('has text-decoration none in anchor', () {
      final widget = html.Button(text: 'Button', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('text-decoration:none'));
    });

    test('has display inline-block in anchor', () {
      final widget = html.Button(text: 'Button', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('display:inline-block'));
    });

    test('has mso-hide all for non-Outlook', () {
      final widget = html.Button(text: 'Button', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('mso-hide:all'));
    });

    test('VML has stroke false', () {
      final widget = html.Button(text: 'Button', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('stroke="false"'));
    });

    test('VML has v-text-anchor middle', () {
      final widget = html.Button(text: 'Button', href: '#');
      final htmlOutput = renderWidget(widget);

      expect(htmlOutput, contains('v-text-anchor:middle'));
    });
  });
}
