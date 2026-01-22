import 'package:html/parser.dart' as html_parser;
import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart' as html;

void main() {
  group('A group of tests', () {
    test('generateHtml - comprehensive email template', () async {
      // Create a comprehensive email template using all widgets
      final email = html.Container(
        // width: 600,
        color: const html.Color(0xFFF5F5F5),
        padding: const html.EdgeInsets.all(20),
        child: html.Column(
          children: [
            // Header with centered logo
            html.Center(
              child: html.Container(
                padding: const html.EdgeInsets.all(20),
                child: html.Image(
                  src: 'https://placehold.co/100x100',
                  width: 100,
                  height: 100,
                  alt: 'Company Logo',
                ),
              ),
            ),

            html.SizedBox(height: 20),

            // Navigation row
            html.Row(
              children: [
                html.Link(
                  text: 'Home',
                  href: '#home',
                  style: const html.TextStyle(
                    color: html.Color(0xFF007BFF),
                    fontSize: 14,
                  ),
                ),
                html.Link(
                  text: 'Products',
                  href: '#products',
                  style: const html.TextStyle(
                    color: html.Color(0xFF007BFF),
                    fontSize: 14,
                  ),
                ),
                html.Link(
                  text: 'About',
                  href: '#about',
                  style: const html.TextStyle(
                    color: html.Color(0xFF007BFF),
                    fontSize: 14,
                  ),
                ),
                html.Link(
                  text: 'Contact',
                  href: '#contact',
                  style: const html.TextStyle(
                    color: html.Color(0xFF007BFF),
                    fontSize: 14,
                  ),
                ),
              ],
              spacing: 20,
              mainAxisAlignment: html.MainAxisAlignment.center,
            ),

            html.SizedBox(height: 30),

            // Main content container
            html.Container(
              color: html.Colors.white,
              padding: const html.EdgeInsets.all(30),
              borderRadius: html.BorderRadius.circular(8),
              border: html.Border.all(
                color: const html.Color(0xFFE0E0E0),
                width: 1,
              ),
              child: html.Column(
                children: [
                  // Title with rich text
                  html.RichText(
                    spans: [
                      html.TextSpan(
                        'Welcome to ',
                        style: const html.TextStyle(
                          fontSize: 24,
                          color: html.Color(0xFF333333),
                        ),
                      ),
                      html.TextSpan(
                        'Our Service',
                        style: const html.TextStyle(
                          fontSize: 24,
                          fontWeight: html.FontWeight.bold,
                          color: html.Color(0xFF007BFF),
                        ),
                      ),
                    ],
                  ),

                  html.SizedBox(height: 20),

                  // Regular text
                  html.Text(
                    'This is a comprehensive test of all HTML email widgets. '
                    'We are testing various styling options and layouts.',
                    style: const html.TextStyle(
                      fontSize: 16,
                      color: html.Color(0xFF666666),
                      height: 1.5,
                    ),
                  ),

                  html.SizedBox(height: 20),

                  // Divider
                  html.Divider(
                    height: 2,
                    color: const html.Color(0xFFE0E0E0),
                    margin: const html.EdgeInsets.symmetric(vertical: 20),
                  ),

                  // Two-column layout
                  html.Row(
                    children: [
                      html.Container(
                        width: 250,
                        padding: const html.EdgeInsets.all(15),
                        color: const html.Color(0xFFF8F9FA),
                        borderRadius: html.BorderRadius.circular(4),
                        child: html.Column(
                          children: [
                            html.Text(
                              'Feature 1',
                              style: const html.TextStyle(
                                fontSize: 18,
                                fontWeight: html.FontWeight.bold,
                                color: html.Color(0xFF333333),
                              ),
                            ),
                            html.SizedBox(height: 10),
                            html.Text(
                              'Description of the first feature with some details.',
                              style: const html.TextStyle(
                                fontSize: 14,
                                color: html.Color(0xFF666666),
                              ),
                            ),
                          ],
                          crossAxisAlignment: html.CrossAxisAlignment.start,
                        ),
                      ),
                      html.Container(
                        width: 250,
                        padding: const html.EdgeInsets.all(15),
                        color: const html.Color(0xFFF8F9FA),
                        borderRadius: html.BorderRadius.circular(4),
                        child: html.Column(
                          children: [
                            html.Text(
                              'Feature 2',
                              style: const html.TextStyle(
                                fontSize: 18,
                                fontWeight: html.FontWeight.bold,
                                color: html.Color(0xFF333333),
                              ),
                            ),
                            html.SizedBox(height: 10),
                            html.Text(
                              'Description of the second feature with some details.',
                              style: const html.TextStyle(
                                fontSize: 14,
                                color: html.Color(0xFF666666),
                              ),
                            ),
                          ],
                          crossAxisAlignment: html.CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                    spacing: 20,
                    mainAxisAlignment: html.MainAxisAlignment.spaceBetween,
                  ),

                  html.SizedBox(height: 30),

                  // Centered button
                  html.Center(
                    child: html.Button(
                      text: 'Get Started',
                      href: '#get-started',
                      backgroundColor: const html.Color(0xFF007BFF),
                      textColor: html.Colors.white,
                      padding: const html.EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      borderRadius: html.BorderRadius.circular(6),
                      textStyle: const html.TextStyle(
                        fontSize: 16,
                        fontWeight: html.FontWeight.bold,
                      ),
                    ),
                  ),

                  html.SizedBox(height: 20),

                  // Aligned content (right-aligned)
                  html.Align(
                    alignment: html.Alignment.centerRight,
                    child: html.Text(
                      'Right-aligned text',
                      style: const html.TextStyle(
                        fontSize: 14,
                        fontStyle: html.FontStyle.italic,
                        color: html.Color(0xFF999999),
                      ),
                    ),
                  ),

                  html.SizedBox(height: 20),

                  // Sized box with child
                  html.SizedBox(
                    width: 500,
                    height: 100,
                    child: html.Container(
                      color: const html.Color(0xFFE3F2FD),
                      padding: const html.EdgeInsets.all(15),
                      borderRadius: html.BorderRadius.circular(4),
                      child: html.Text(
                        'This is inside a SizedBox with specific dimensions.',
                        style: const html.TextStyle(
                          fontSize: 14,
                          color: html.Color(0xFF1976D2),
                        ),
                        textAlign: html.TextAlign.center,
                      ),
                    ),
                  ),

                  html.SizedBox(height: 20),

                  // Padding widget
                  html.Padding(
                    padding: const html.EdgeInsets.all(20),
                    child: html.Container(
                      color: const html.Color(0xFFFFF3E0),
                      child: html.Text(
                        'This content is wrapped in a Padding widget.',
                        style: const html.TextStyle(
                          fontSize: 14,
                          color: html.Color(0xFFE65100),
                        ),
                      ),
                    ),
                  ),

                  html.SizedBox(height: 20),

                  // Rich text with links
                  html.RichText(
                    spans: [
                      html.TextSpan(
                        'Visit our ',
                        style: const html.TextStyle(
                          fontSize: 14,
                          color: html.Color(0xFF333333),
                        ),
                      ),
                      html.TextSpan(
                        'website',
                        href: 'https://example.com',
                        style: const html.TextStyle(
                          fontSize: 14,
                          color: html.Color(0xFF007BFF),
                          decoration: html.TextDecoration.underline,
                        ),
                      ),
                      html.TextSpan(
                        ' for more information.',
                        style: const html.TextStyle(
                          fontSize: 14,
                          color: html.Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),

                  html.SizedBox(height: 20),

                  // Text with various styles
                  html.Text(
                    'Bold and colored text example',
                    style: const html.TextStyle(
                      fontSize: 18,
                      fontWeight: html.FontWeight.bold,
                      color: html.Color(0xFFD32F2F),
                      backgroundColor: html.Color(0xFFFFEBEE),
                    ),
                    textAlign: html.TextAlign.center,
                  ),

                  html.SizedBox(height: 10),

                  html.Text(
                    'Underlined text example',
                    style: const html.TextStyle(
                      fontSize: 16,
                      decoration: html.TextDecoration.underline,
                      color: html.Color(0xFF333333),
                    ),
                  ),

                  html.SizedBox(height: 20),

                  // Final divider
                  html.Divider(
                    color: const html.Color(0xFFBDBDBD),
                    margin: const html.EdgeInsets.symmetric(vertical: 10),
                  ),

                  // Footer text
                  html.Text(
                    '© 2024 Company Name. All rights reserved.',
                    style: const html.TextStyle(
                      fontSize: 12,
                      color: html.Color(0xFF999999),
                    ),
                    textAlign: html.TextAlign.center,
                  ),
                ],
                spacing: 15,
              ),
            ),

            html.SizedBox(height: 20),

            // Footer links
            html.Center(
              child: html.Row(
                children: [
                  html.Link(
                    text: 'Privacy Policy',
                    href: '#privacy',
                    style: const html.TextStyle(
                      fontSize: 12,
                      color: html.Color(0xFF666666),
                    ),
                  ),
                  html.Text(
                    ' | ',
                    style: const html.TextStyle(
                      fontSize: 12,
                      color: html.Color(0xFF999999),
                    ),
                  ),
                  html.Link(
                    text: 'Terms of Service',
                    href: '#terms',
                    style: const html.TextStyle(
                      fontSize: 12,
                      color: html.Color(0xFF666666),
                    ),
                  ),
                  html.Text(
                    ' | ',
                    style: const html.TextStyle(
                      fontSize: 12,
                      color: html.Color(0xFF999999),
                    ),
                  ),
                  html.Link(
                    text: 'Unsubscribe',
                    href: '#unsubscribe',
                    style: const html.TextStyle(
                      fontSize: 12,
                      color: html.Color(0xFF666666),
                    ),
                  ),
                ],
                spacing: 5,
                mainAxisAlignment: html.MainAxisAlignment.center,
              ),
            ),
          ],
          spacing: 10,
        ),
      );

      // Generate HTML
      final htmlOutput = html.Page(body: email).render();

      // validate the html
      final document = html_parser.parse(htmlOutput);
      expect(document.hasContent(), isTrue);

      // Verify the HTML contains expected elements
      expect(htmlOutput, contains('<!DOCTYPE html>'));
      expect(htmlOutput, contains('<html>'));
      expect(htmlOutput, contains('Company Logo')); // Image alt text
      expect(htmlOutput, contains('Welcome to')); // Rich text
      expect(htmlOutput, contains('Get Started')); // Button
      expect(htmlOutput, contains('<a href')); // Links
      expect(htmlOutput, contains('border-radius')); // Border radius
      expect(htmlOutput, contains('background-color')); // Background colors

      print(htmlOutput);
    });
  });
}
