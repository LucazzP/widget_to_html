import 'package:widget_to_html/widget_to_html.dart';

void main(List<String> args) {
  final email = HtmlDocument(
    body: HtmlContainer(
      padding: EdgeInsets.all(24),
      color: Color(0xFFF5F5F5),
      child: HtmlColumn(
        spacing: 16,
        children: [
          HtmlText(
            'Welcome!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          HtmlText('Thanks for signing up.'),
          HtmlButton(
            text: 'Get Started',
            href: 'https://example.com',
            backgroundColor: Color(0xFF007BFF),
          ),
        ],
      ),
    ),
  );

  final html = email.render();

  print(html);
}
