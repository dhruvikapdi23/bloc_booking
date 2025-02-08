enum CarouselEvent { next, previous }

enum DatePickerEntryModeClass {
  /// User picks a date from calendar grid. Can switch to [input] by activating
  /// a mode button in the dialog.
  calendar,

  /// User can input the date by typing it into a text field.
  ///
  /// Can switch to [calendar] by activating a mode button in the dialog.
  input,

  /// User can only pick a date from calendar grid.
  ///
  /// There is no user interface to switch to another mode.
  calendarOnly,

  /// User can only input the date by typing it into a text field.
  ///
  /// There is no user interface to switch to another mode.
  inputOnly,
}

enum HighlightPainterStyle {
  /// Paints nothing.
  none,

  /// Paints a rectangle that occupies the leading half of the space.
  highlightLeading,

  /// Paints a rectangle that occupies the trailing half of the space.
  highlightTrailing,

  /// Paints a rectangle that occupies all available space.
  highlightAll,
}
