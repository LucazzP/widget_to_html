import 'package:widget_to_html/widget_to_html.dart' as html;

void main(List<String> args) {
  final email = html.Page(
    body: html.Container(
      padding: html.EdgeInsets.all(24),
      color: html.Color(0xFFF5F5F5),
      child: html.Column(
        spacing: 16,
        children: [
          html.Text(
            'Welcome!',
            style: html.TextStyle(
              fontSize: 24,
              fontWeight: html.FontWeight.bold,
              color: html.Color(0xFF333333),
            ),
          ),
          html.Text('Thanks for signing up.'),
          html.Button(
            text: 'Get Started',
            href: 'https://example.com',
            backgroundColor: html.Color(0xFF007BFF),
          ),
        ],
      ),
    ),
  );

  final htmlOutput = email.render();

  print(htmlOutput);
}
