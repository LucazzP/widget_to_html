# Widget to HTML

Build HTML using a widget-like API!
Designed for sending emails, it provides familiar Flutter-style classes that make composing HTML feel like building widgets. Inspired by [react-email](https://react.email).

The produced HTML is fully compatible with Outlook and other email clients.

## Features

- Widget-like API for building HTML
- Email-compatible output (table-based layouts, inline styles)
- Custom style classes (Color, TextStyle, EdgeInsets, etc.)
- No Flutter dependency, works with pure Dart

## Installation

```yaml
dependencies:
  widget_to_html: ^1.0.0
```

## Usage

Use an import alias (for example, `as html`) to avoid conflicts with Flutter
widget names like `Text`, `Column`, and `Container`.

```dart
import 'package:widget_to_html/widget_to_html.dart' as html;

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
```

### Produced HTML (minified):
```html
<!DOCTYPE html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="x-apple-disable-message-reformatting"><style type="text/css">body, table, td, a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; }img { -ms-interpolation-mode: bicubic; border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }body { margin: 0 !important; padding: 0 !important; width: 100% !important; }</style><!--[if mso]><style type="text/css">body, table, td { font-family: Arial, Helvetica, sans-serif !important; }</style><![endif]--></head><body><div style="background-color:#f5f5f5;padding:24.0px 24.0px 24.0px 24.0px"><table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse;"><tr><td align="left" style="padding:0;"><p style="font-size:24.0px;font-weight:700;color:#333333;margin:0;padding:0">Welcome!</p></td></tr><tr><td style="height:16.0px;padding:0;"></td></tr><tr><td align="left" style="padding:0;"><p style="margin:0;padding:0">Thanks for signing up.</p></td></tr><tr><td style="height:16.0px;padding:0;"></td></tr><tr><td align="left" style="padding:0;"><!--[if mso]><v:roundrect xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w="urn:schemas-microsoft-com:office:word" href="https://example.com" style="v-text-anchor:middle;" arcsize="8%" stroke="false" fillcolor="#007bff"><w:anchorlock/><center style="color:#ffffff;font-family:sans-serif;font-size:16.0px;font-weight:bold;">Get Started</center></v:roundrect><![endif]--><!--[if !mso]><!--><a href="https://example.com" style="display:inline-block;background-color:#007bff;color:#ffffff;font-family:sans-serif;font-size:16.0px;font-weight:bold;text-decoration:none;padding:12.0px 24.0px;border-radius:4.0px;mso-hide:all;">Get Started</a><!--<![endif]--></td></tr></table></div></body></html>
```

## Available Widgets

| Widget | Description |
|--------|-------------|
| `Page` | Wraps content in a complete HTML document |
| `Container` | Box with padding, margin, background, border |
| `Column` | Vertical layout |
| `Row` | Horizontal layout |
| `Text` | Styled text paragraph |
| `RichText` | Text with multiple styled spans (`TextSpan`) |
| `Button` | Email-safe button (VML for Outlook) |
| `Link` | Anchor link |
| `Image` | Image (supports base64 embedding) |
| `Divider` | Horizontal rule |
| `Padding` | Padding wrapper |
| `Align` | Alignment wrapper |
| `Center` | Center alignment |
| `SizedBox` | Fixed size box |

## Style Classes

The package includes Flutter-like style classes:

- `Color`, `Colors`
- `TextStyle`, `FontWeight`, `FontStyle`
- `TextAlign`, `TextDecoration`
- `EdgeInsets`, `EdgeInsetsDirectional`
- `BorderRadius`, `Border`, `BorderSide`
- `Alignment`, `MainAxisAlignment`, `CrossAxisAlignment`
- `BoxConstraints`, `Size`

## License

MIT
