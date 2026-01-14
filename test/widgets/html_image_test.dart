import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart';

import '../utils/html_test_utils.dart';

void main() {
  group('HtmlImage', () {
    test('renders as img element with src', () {
      final widget = HtmlImage(src: 'https://example.com/image.png');
      final fragment = renderAndParse(widget);
      final img = findFirst(fragment, 'img');

      expect(img, isNotNull);
      expect(getAttribute(img!, 'src'), equals('https://example.com/image.png'));
    });

    test('applies width attribute and style', () {
      final widget = HtmlImage(src: 'https://example.com/image.png', width: 200);
      final fragment = renderAndParse(widget);
      final img = findFirst(fragment, 'img');

      expect(img, isNotNull);
      expect(getAttribute(img!, 'width'), equals('200'));
      expect(hasStyle(img, 'width', '200.0px'), isTrue);
    });

    test('applies height attribute and style', () {
      final widget = HtmlImage(src: 'https://example.com/image.png', height: 150);
      final fragment = renderAndParse(widget);
      final img = findFirst(fragment, 'img');

      expect(img, isNotNull);
      expect(getAttribute(img!, 'height'), equals('150'));
      expect(hasStyle(img, 'height', '150.0px'), isTrue);
    });

    test('applies alt attribute', () {
      final widget = HtmlImage(src: 'https://example.com/image.png', alt: 'A sample image');
      final fragment = renderAndParse(widget);
      final img = findFirst(fragment, 'img');

      expect(img, isNotNull);
      expect(getAttribute(img!, 'alt'), equals('A sample image'));
    });

    test('applies empty alt when not specified', () {
      final widget = HtmlImage(src: 'https://example.com/image.png');
      final fragment = renderAndParse(widget);
      final img = findFirst(fragment, 'img');

      expect(img, isNotNull);
      expect(getAttribute(img!, 'alt'), equals(''));
    });

    test('has display block style', () {
      final widget = HtmlImage(src: 'https://example.com/image.png');
      final fragment = renderAndParse(widget);
      final img = findFirst(fragment, 'img');

      expect(img, isNotNull);
      expect(hasStyle(img!, 'display', 'block'), isTrue);
    });

    test('has border 0 style', () {
      final widget = HtmlImage(src: 'https://example.com/image.png');
      final fragment = renderAndParse(widget);
      final img = findFirst(fragment, 'img');

      expect(img, isNotNull);
      expect(hasStyle(img!, 'border', '0'), isTrue);
    });

    test('has outline none style', () {
      final widget = HtmlImage(src: 'https://example.com/image.png');
      final fragment = renderAndParse(widget);
      final img = findFirst(fragment, 'img');

      expect(img, isNotNull);
      expect(hasStyle(img!, 'outline', 'none'), isTrue);
    });

    test('renders bytes as base64 data URI with default mime type', () {
      final bytes = Uint8List.fromList([0x89, 0x50, 0x4E, 0x47]); // PNG header
      final widget = HtmlImage(bytes: bytes);
      final fragment = renderAndParse(widget);
      final img = findFirst(fragment, 'img');

      expect(img, isNotNull);
      final src = getAttribute(img!, 'src');
      expect(src, startsWith('data:image/png;base64,'));
    });

    test('renders bytes as base64 data URI with custom mime type', () {
      final bytes = Uint8List.fromList([0xFF, 0xD8, 0xFF]); // JPEG header
      final widget = HtmlImage(bytes: bytes, mimeType: 'image/jpeg');
      final fragment = renderAndParse(widget);
      final img = findFirst(fragment, 'img');

      expect(img, isNotNull);
      final src = getAttribute(img!, 'src');
      expect(src, startsWith('data:image/jpeg;base64,'));
    });

    test('prefers bytes over src when both provided', () {
      final bytes = Uint8List.fromList([0x89, 0x50, 0x4E, 0x47]);
      final widget = HtmlImage(src: 'https://example.com/image.png', bytes: bytes);
      final fragment = renderAndParse(widget);
      final img = findFirst(fragment, 'img');

      expect(img, isNotNull);
      final src = getAttribute(img!, 'src');
      expect(src, startsWith('data:'));
      expect(src, isNot(equals('https://example.com/image.png')));
    });

    test('combines width, height, and alt', () {
      final widget = HtmlImage(src: 'https://example.com/logo.png', width: 100, height: 50, alt: 'Company Logo');
      final fragment = renderAndParse(widget);
      final img = findFirst(fragment, 'img');

      expect(img, isNotNull);
      expect(getAttribute(img!, 'width'), equals('100'));
      expect(getAttribute(img, 'height'), equals('50'));
      expect(getAttribute(img, 'alt'), equals('Company Logo'));
      expect(hasStyle(img, 'width', '100.0px'), isTrue);
      expect(hasStyle(img, 'height', '50.0px'), isTrue);
    });
  });
}
