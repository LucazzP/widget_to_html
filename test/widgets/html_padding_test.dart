import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart';

import '../utils/html_test_utils.dart';

void main() {
  group('HtmlPadding', () {
    test('renders as div with child', () {
      final widget = HtmlPadding(
        padding: const EdgeInsets.all(10),
        child: HtmlText('Padded'),
      );
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
    });

    test('applies EdgeInsets.all padding', () {
      final widget = HtmlPadding(
        padding: const EdgeInsets.all(20),
        child: HtmlText('Padded'),
      );
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'padding', '20.0px 20.0px 20.0px 20.0px'), isTrue);
    });

    test('applies EdgeInsets.symmetric horizontal padding', () {
      final widget = HtmlPadding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: HtmlText('Padded'),
      );
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'padding', '0.0px 30.0px 0.0px 30.0px'), isTrue);
    });

    test('applies EdgeInsets.symmetric vertical padding', () {
      final widget = HtmlPadding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: HtmlText('Padded'),
      );
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'padding', '15.0px 0.0px 15.0px 0.0px'), isTrue);
    });

    test('applies EdgeInsets.only padding', () {
      final widget = HtmlPadding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 20,
          right: 30,
          bottom: 40,
        ),
        child: HtmlText('Padded'),
      );
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'padding', '20.0px 30.0px 40.0px 10.0px'), isTrue);
    });

    test('applies EdgeInsets.fromLTRB padding', () {
      final widget = HtmlPadding(
        padding: const EdgeInsets.fromLTRB(5, 10, 15, 20),
        child: HtmlText('Padded'),
      );
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(hasStyle(div!, 'padding', '10.0px 15.0px 20.0px 5.0px'), isTrue);
    });

    test('applies EdgeInsetsDirectional padding with LTR', () {
      final widget = HtmlPadding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 30, 40),
        child: HtmlText('Padded'),
      );
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      // LTR: start=left, end=right
      expect(hasStyle(div!, 'padding', '20.0px 30.0px 40.0px 10.0px'), isTrue);
    });

    test('renders child content', () {
      final widget = HtmlPadding(
        padding: const EdgeInsets.all(10),
        child: HtmlText('Hello'),
      );
      final fragment = renderAndParse(widget);
      final div = findFirst(fragment, 'div');

      expect(div, isNotNull);
      expect(div!.innerHtml, contains('Hello'));
    });
  });
}
