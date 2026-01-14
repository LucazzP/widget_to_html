/// How children are placed along the main axis.
enum MainAxisAlignment {
  start,
  end,
  center,
  spaceBetween,
  spaceAround,
  spaceEvenly;

  /// Converts this alignment to an HTML table align value.
  String toHtml() {
    return switch (this) {
      MainAxisAlignment.start => 'left',
      MainAxisAlignment.end => 'right',
      MainAxisAlignment.center => 'center',
      MainAxisAlignment.spaceBetween => 'left',
      MainAxisAlignment.spaceAround => 'center',
      MainAxisAlignment.spaceEvenly => 'center',
    };
  }
}

/// How children are placed along the cross axis.
enum CrossAxisAlignment {
  start,
  end,
  center,
  stretch,
  baseline;

  /// Converts this alignment to an HTML table align value (horizontal).
  String toHtmlHorizontal() {
    return switch (this) {
      CrossAxisAlignment.start => 'left',
      CrossAxisAlignment.end => 'right',
      CrossAxisAlignment.center => 'center',
      CrossAxisAlignment.stretch => 'left',
      CrossAxisAlignment.baseline => 'left',
    };
  }

  /// Converts this alignment to an HTML table valign value (vertical).
  String toHtmlVertical() {
    return switch (this) {
      CrossAxisAlignment.start => 'top',
      CrossAxisAlignment.end => 'bottom',
      CrossAxisAlignment.center => 'middle',
      CrossAxisAlignment.stretch => 'top',
      CrossAxisAlignment.baseline => 'baseline',
    };
  }
}
