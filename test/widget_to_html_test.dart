import 'package:html/parser.dart' as htmlParser;
import 'package:test/test.dart';
import 'package:widget_to_html/widget_to_html.dart';

void main() {
  group('A group of tests', () {
    test('generateHtml - comprehensive email template', () async {
      final start = DateTime.now();

      // Create a comprehensive email template using all widgets
      final email = HtmlContainer(
        // width: 600,
        color: const Color(0xFFF5F5F5),
        padding: const EdgeInsets.all(20),
        child: HtmlColumn(
          children: [
            // Header with centered logo
            HtmlCenter(
              child: HtmlContainer(
                padding: const EdgeInsets.all(20),
                child: HtmlImage(src: 'https://placehold.co/100x100', width: 100, height: 100, alt: 'Company Logo'),
              ),
            ),

            HtmlSizedBox(height: 20),

            // Navigation row
            HtmlRow(
              children: [
                HtmlLink(
                  text: 'Home',
                  href: '#home',
                  style: const TextStyle(color: Color(0xFF007BFF), fontSize: 14),
                ),
                HtmlLink(
                  text: 'Products',
                  href: '#products',
                  style: const TextStyle(color: Color(0xFF007BFF), fontSize: 14),
                ),
                HtmlLink(
                  text: 'About',
                  href: '#about',
                  style: const TextStyle(color: Color(0xFF007BFF), fontSize: 14),
                ),
                HtmlLink(
                  text: 'Contact',
                  href: '#contact',
                  style: const TextStyle(color: Color(0xFF007BFF), fontSize: 14),
                ),
              ],
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
            ),

            HtmlSizedBox(height: 30),

            // Main content container
            HtmlContainer(
              color: Colors.white,
              padding: const EdgeInsets.all(30),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
              child: HtmlColumn(
                children: [
                  // Title with rich text
                  HtmlRichText(
                    spans: [
                      HtmlTextSpan('Welcome to ', style: const TextStyle(fontSize: 24, color: Color(0xFF333333))),
                      HtmlTextSpan(
                        'Our Service',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF007BFF)),
                      ),
                    ],
                  ),

                  HtmlSizedBox(height: 20),

                  // Regular text
                  HtmlText(
                    'This is a comprehensive test of all HTML email widgets. '
                    'We are testing various styling options and layouts.',
                    style: const TextStyle(fontSize: 16, color: Color(0xFF666666), height: 1.5),
                  ),

                  HtmlSizedBox(height: 20),

                  // Divider
                  HtmlDivider(
                    height: 2,
                    color: const Color(0xFFE0E0E0),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                  ),

                  // Two-column layout
                  HtmlRow(
                    children: [
                      HtmlContainer(
                        width: 250,
                        padding: const EdgeInsets.all(15),
                        color: const Color(0xFFF8F9FA),
                        borderRadius: BorderRadius.circular(4),
                        child: HtmlColumn(
                          children: [
                            HtmlText(
                              'Feature 1',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333),
                              ),
                            ),
                            HtmlSizedBox(height: 10),
                            HtmlText(
                              'Description of the first feature with some details.',
                              style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                      HtmlContainer(
                        width: 250,
                        padding: const EdgeInsets.all(15),
                        color: const Color(0xFFF8F9FA),
                        borderRadius: BorderRadius.circular(4),
                        child: HtmlColumn(
                          children: [
                            HtmlText(
                              'Feature 2',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333),
                              ),
                            ),
                            HtmlSizedBox(height: 10),
                            HtmlText(
                              'Description of the second feature with some details.',
                              style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),

                  HtmlSizedBox(height: 30),

                  // Centered button
                  HtmlCenter(
                    child: HtmlButton(
                      text: 'Get Started',
                      href: '#get-started',
                      backgroundColor: const Color(0xFF007BFF),
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      borderRadius: BorderRadius.circular(6),
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),

                  HtmlSizedBox(height: 20),

                  // Aligned content (right-aligned)
                  HtmlAlign(
                    alignment: Alignment.centerRight,
                    child: HtmlText(
                      'Right-aligned text',
                      style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Color(0xFF999999)),
                    ),
                  ),

                  HtmlSizedBox(height: 20),

                  // Sized box with child
                  HtmlSizedBox(
                    width: 500,
                    height: 100,
                    child: HtmlContainer(
                      color: const Color(0xFFE3F2FD),
                      padding: const EdgeInsets.all(15),
                      borderRadius: BorderRadius.circular(4),
                      child: HtmlText(
                        'This is inside a SizedBox with specific dimensions.',
                        style: const TextStyle(fontSize: 14, color: Color(0xFF1976D2)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  HtmlSizedBox(height: 20),

                  // Padding widget
                  HtmlPadding(
                    padding: const EdgeInsets.all(20),
                    child: HtmlContainer(
                      color: const Color(0xFFFFF3E0),
                      child: HtmlText(
                        'This content is wrapped in a Padding widget.',
                        style: const TextStyle(fontSize: 14, color: Color(0xFFE65100)),
                      ),
                    ),
                  ),

                  HtmlSizedBox(height: 20),

                  // Rich text with links
                  HtmlRichText(
                    spans: [
                      HtmlTextSpan('Visit our ', style: const TextStyle(fontSize: 14, color: Color(0xFF333333))),
                      HtmlTextSpan(
                        'website',
                        href: 'https://example.com',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF007BFF),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      HtmlTextSpan(
                        ' for more information.',
                        style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
                      ),
                    ],
                  ),

                  HtmlSizedBox(height: 20),

                  // Text with various styles
                  HtmlText(
                    'Bold and colored text example',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD32F2F),
                      backgroundColor: Color(0xFFFFEBEE),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  HtmlSizedBox(height: 10),

                  HtmlText(
                    'Underlined text example',
                    style: const TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      color: Color(0xFF333333),
                    ),
                  ),

                  HtmlSizedBox(height: 20),

                  // Final divider
                  HtmlDivider(color: const Color(0xFFBDBDBD), margin: const EdgeInsets.symmetric(vertical: 10)),

                  // Footer text
                  HtmlText(
                    '© 2024 Company Name. All rights reserved.',
                    style: const TextStyle(fontSize: 12, color: Color(0xFF999999)),
                    textAlign: TextAlign.center,
                  ),
                ],
                spacing: 15,
              ),
            ),

            HtmlSizedBox(height: 20),

            // Footer links
            HtmlCenter(
              child: HtmlRow(
                children: [
                  HtmlLink(
                    text: 'Privacy Policy',
                    href: '#privacy',
                    style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
                  ),
                  HtmlText(' | ', style: const TextStyle(fontSize: 12, color: Color(0xFF999999))),
                  HtmlLink(
                    text: 'Terms of Service',
                    href: '#terms',
                    style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
                  ),
                  HtmlText(' | ', style: const TextStyle(fontSize: 12, color: Color(0xFF999999))),
                  HtmlLink(
                    text: 'Unsubscribe',
                    href: '#unsubscribe',
                    style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
                  ),
                ],
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ],
          spacing: 10,
        ),
      );

      // Generate HTML
      final html = await generateHtml(email);

      final end = DateTime.now();
      print('Time taken: ${end.difference(start).inMilliseconds}ms');

      // validate the html
      final document = htmlParser.parse(html);
      expect(document.hasContent(), isTrue);

      // Verify the HTML contains expected elements
      expect(html, contains('<!DOCTYPE html>'));
      expect(html, contains('<html>'));
      expect(html, contains('Company Logo')); // Image alt text
      expect(html, contains('Welcome to')); // Rich text
      expect(html, contains('Get Started')); // Button
      expect(html, contains('<a href')); // Links
      expect(html, contains('border-radius')); // Border radius
      expect(html, contains('background-color')); // Background colors
    });
  });
}
