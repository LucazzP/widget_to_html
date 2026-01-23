import 'package:flutter/material.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;
import 'package:widget_to_html_flutter/widget_to_html_flutter.dart';

void main() {
  final theme = flutter.ThemeData(
    colorScheme: flutter.ColorScheme.fromSeed(
      seedColor: const flutter.Color(0xFF007BFF),
    ),
    textTheme: const flutter.TextTheme(
      headlineSmall: flutter.TextStyle(
        fontSize: 24,
        fontWeight: flutter.FontWeight.bold,
      ),
      bodyMedium: flutter.TextStyle(fontSize: 16),
    ),
  );

  final titleStyle =
      theme.textTheme.headlineSmall ?? const flutter.TextStyle(fontSize: 24);
  final bodyStyle =
      theme.textTheme.bodyMedium ?? const flutter.TextStyle(fontSize: 16);

  final email = html.Page(
    body: html.Container(
      padding: const flutter.EdgeInsets.all(24).toHtml(),
      color: theme.colorScheme.surface.toHtml(),
      child: html.Column(
        spacing: 16,
        children: [
          html.Text('Welcome!', style: titleStyle.toHtml()),
          html.Text('Thanks for signing up.', style: bodyStyle.toHtml()),
          html.Button(
            text: 'Get Started',
            href: 'https://example.com',
            backgroundColor: theme.colorScheme.primary.toHtml(),
          ),
        ],
      ),
    ),
  );

  final htmlOutput = email.render();
  print(htmlOutput);
}
