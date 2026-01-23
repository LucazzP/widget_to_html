# widget_to_html_flutter

Flutter extensions for converting Flutter styles to `widget_to_html` models.
This package is an extension of `widget_to_html` and is intended to be used
alongside it.

## Features

- Flutter-to-HTML style conversion helpers (`TextStyle`, `Color`, `EdgeInsets`,
  `Border`, and more)
- Simple `toHtml()` extensions to map Flutter styles to `widget_to_html` types

## Installation

```yaml
dependencies:
  widget_to_html: ^1.1.0
  widget_to_html_flutter: ^1.0.0
```

## Usage

Use an import alias (for example, `as html`) to avoid conflicts with Flutter
widget names like `Text`, `Column`, and `Container`.

```dart
import 'package:flutter/material.dart' as flutter;
import 'package:widget_to_html/widget_to_html.dart' as html;
import 'package:widget_to_html_flutter/widget_to_html_flutter.dart';

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

final email = html.Page(
  body: html.Container(
    padding: const flutter.EdgeInsets.all(24).toHtml(),
    color: theme.colorScheme.surface.toHtml(),
    child: html.Text(
      'Welcome!',
      style: theme.textTheme.headlineSmall?.toHtml(),
    ),
  ),
);

final htmlOutput = email.render();
```

See `example/` for a complete example.
