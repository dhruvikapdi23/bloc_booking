
import 'package:bloc_booking/presentation/widgets/custom_date_range/restorable_date_picker_entry_mode.dart';

import '../../../common_path.dart';
import '../../../core/enums/common_enums.dart';
import '../../../core/helper/statis_values.dart';
import 'calendar_range_picker_dialog.dart';


class DateRangePickerDialogCustom extends StatefulWidget {
  /// A Material-style date range picker dialog.
  const DateRangePickerDialogCustom({
    super.key,
    this.initialDateRange,
    required this.firstDate,
    required this.lastDate,
    this.currentDate,
    this.initialEntryMode = DatePickerEntryModeClass.calendar,
    this.helpText,
    this.cancelText,
    this.confirmText,
    this.saveText,
    this.errorInvalidRangeText,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldStartHintText,
    this.fieldEndHintText,
    this.fieldStartLabelText,
    this.fieldEndLabelText,
    this.keyboardType = TextInputType.datetime,
    this.restorationId,
    this.switchToInputEntryModeIcon,
    this.switchToCalendarEntryModeIcon,
    this.onValueChange,
    this.startDateSelect,
    this.endDateSelect,
  });

  /// The date range that the date range picker starts with when it opens.
  ///
  /// If an initial date range is provided, `initialDateRange.start`
  /// and `initialDateRange.end` must both fall between or on [firstDate] and
  /// [lastDate]. For all of these [DateTime] values, only their dates are
  /// considered. Their time fields are ignored.
  ///
  /// If [initialDateRange] is non-null, then it will be used as the initially
  /// selected date range. If it is provided, `initialDateRange.start` must be
  /// before or on `initialDateRange.end`.
  final DateTimeRange? initialDateRange;

  /// The earliest allowable date on the date range.
  final DateTime firstDate;

  /// The latest allowable date on the date range.
  final DateTime lastDate;

  /// The [currentDate] represents the current day (i.e. today).
  ///
  /// This date will be highlighted in the day grid.
  ///
  /// If `null`, the date of `DateTime.now()` will be used.
  final DateTime? currentDate;

  /// The initial date range picker entry mode.
  ///
  /// The date range has two main modes: [DatePickerEntryModeClass.calendar] (a
  /// scrollable calendar month grid) or [DatePickerEntryModeClass.input] (two text
  /// input fields) mode.
  ///
  /// It defaults to [DatePickerEntryModeClass.calendar].
  final DatePickerEntryModeClass initialEntryMode;

  /// The label on the cancel button for the text input mode.
  ///
  /// If null, the localized value of
  /// [MaterialLocalizations.cancelButtonLabel] is used.
  final String? cancelText;

  /// The label on the "OK" button for the text input mode.
  ///
  /// If null, the localized value of
  /// [MaterialLocalizations.okButtonLabel] is used.
  final String? confirmText;

  /// The label on the save button for the fullscreen calendar mode.
  ///
  /// If null, the localized value of
  /// [MaterialLocalizations.saveButtonLabel] is used.
  final String? saveText;

  /// The label displayed at the top of the dialog.
  ///
  /// If null, the localized value of
  /// [MaterialLocalizations.dateRangePickerHelpText] is used.
  final String? helpText;

  /// The message used when the date range is invalid (e.g. start date is after
  /// end date).
  ///
  /// If null, the localized value of
  /// [MaterialLocalizations.invalidDateRangeLabel] is used.
  final String? errorInvalidRangeText;

  /// The message used when an input text isn't in a proper date format.
  ///
  /// If null, the localized value of
  /// [MaterialLocalizations.invalidDateFormatLabel] is used.
  final String? errorFormatText;

  /// The message used when an input text isn't a selectable date.
  ///
  /// If null, the localized value of
  /// [MaterialLocalizations.dateOutOfRangeLabel] is used.
  final String? errorInvalidText;

  /// The text used to prompt the user when no text has been entered in the
  /// start field.
  ///
  /// If null, the localized value of
  /// [MaterialLocalizations.dateHelpText] is used.
  final String? fieldStartHintText;

  /// The text used to prompt the user when no text has been entered in the
  /// end field.
  ///
  /// If null, the localized value of [MaterialLocalizations.dateHelpText] is
  /// used.
  final String? fieldEndHintText;

  /// The label for the start date text input field.
  ///
  /// If null, the localized value of [MaterialLocalizations.dateRangeStartLabel]
  /// is used.
  final String? fieldStartLabelText;

  /// The label for the end date text input field.
  ///
  /// If null, the localized value of [MaterialLocalizations.dateRangeEndLabel]
  /// is used.
  final String? fieldEndLabelText;

  /// {@macro flutter.material.datePickerDialog}
  final TextInputType keyboardType;

  /// Restoration ID to save and restore the state of the [DateRangePickerDialogCustom].
  ///
  /// If it is non-null, the date range picker will persist and restore the
  /// date range selected on the dialog.
  ///
  /// The state of this widget is persisted in a [RestorationBucket] claimed
  /// from the surrounding [RestorationScope] using the provided restoration ID.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  final String? restorationId;

  /// {@macro flutter.material.date_picker.switchToInputEntryModeIcon}
  final Icon? switchToInputEntryModeIcon;

  /// {@macro flutter.material.date_picker.switchToCalendarEntryModeIcon}
  final Icon? switchToCalendarEntryModeIcon;

  final Function(DateTimeRange)? onValueChange;
  final Function(DateTime)? startDateSelect,endDateSelect;

  @override
  State<DateRangePickerDialogCustom> createState() =>
      DateRangePickerDialogCustomState();
}

class DateRangePickerDialogCustomState
    extends State<DateRangePickerDialogCustom> with RestorationMixin {
  late final RestorableDatePickerEntryModeClass _entryMode =
  RestorableDatePickerEntryModeClass(widget.initialEntryMode);
  late final RestorableDateTimeN _selectedStart =
  RestorableDateTimeN(widget.initialDateRange?.start);
  late final RestorableDateTimeN _selectedEnd =
  RestorableDateTimeN(widget.initialDateRange?.end);
  final RestorableBool _autoValidate = RestorableBool(false);
  final GlobalKey _calendarPickerKey = GlobalKey();

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_entryMode, 'entry_mode');
    registerForRestoration(_selectedStart, 'selected_start');
    registerForRestoration(_selectedEnd, 'selected_end');
    registerForRestoration(_autoValidate, 'autovalidate');
  }

  @override
  void dispose() {
    _entryMode.dispose();
    _selectedStart.dispose();
    _selectedEnd.dispose();
    _autoValidate.dispose();
    super.dispose();
  }

  void _handleOk() {
    final DateTimeRange? selectedRange = _hasSelectedDateRange
        ? DateTimeRange(start: _selectedStart.value!, end: _selectedEnd.value!)
        : null;
    widget.onValueChange!(selectedRange!);
    Navigator.pop(context);
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  void _handleStartDateChanged(DateTime? date) {
    setState(() => _selectedStart.value = date);
    print("ddd :${_selectedStart.value}");
    widget.startDateSelect!(_selectedStart.value!);
  }

  void _handleEndDateChanged(DateTime? date) {
    setState(() => _selectedEnd.value = date);
    print("sf :${_selectedEnd.value}");
    if (_selectedEnd.value != null) {
      widget.endDateSelect!(_selectedEnd.value!);
      _handleOk();
    }
  }

  bool get _hasSelectedDateRange =>
      _selectedStart.value != null && _selectedEnd.value != null;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;

    final MaterialLocalizations localizations =
    MaterialLocalizations.of(context);
    final DatePickerThemeData datePickerTheme = DatePickerTheme.of(context);
    final DatePickerThemeData defaults = DatePickerTheme.defaults(context);

    final Widget contents;
    final Size size;
    final double? elevation;
    final Color? shadowColor;
    final Color? surfaceTintColor;
    final ShapeBorder? shape;
    final EdgeInsets insetPadding;

    contents = CalendarRangePickerDialog(
      key: _calendarPickerKey,
      selectedStartDate: _selectedStart.value,
      selectedEndDate: _selectedEnd.value,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      currentDate: widget.currentDate,
      onStartDateChanged: _handleStartDateChanged,
      onEndDateChanged: _handleEndDateChanged,
      onConfirm: _hasSelectedDateRange ? _handleOk : null,
      onCancel: _handleCancel,
      entryModeButton: null,
      confirmText: widget.saveText ??
          (useMaterial3
              ? localizations.saveButtonLabel
              : localizations.saveButtonLabel.toUpperCase()),
      helpText: widget.helpText ??
          (useMaterial3
              ? localizations.dateRangePickerHelpText
              : localizations.dateRangePickerHelpText.toUpperCase()),
    );
    size = MediaQuery.sizeOf(context);
    insetPadding = EdgeInsets.zero;
    elevation =
        datePickerTheme.rangePickerElevation ?? defaults.rangePickerElevation!;
    shadowColor = datePickerTheme.rangePickerShadowColor ??
        defaults.rangePickerShadowColor!;
    surfaceTintColor = datePickerTheme.rangePickerSurfaceTintColor ??
        defaults.rangePickerSurfaceTintColor!;
    shape = datePickerTheme.rangePickerShape ?? defaults.rangePickerShape;

    return Dialog(
      insetPadding: insetPadding,
      backgroundColor:
      datePickerTheme.backgroundColor ?? defaults.backgroundColor,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        width: size.width,
        height: size.height,
        duration: dialogSizeAnimationDuration,
        curve: Curves.easeIn,
        child: MediaQuery.withClampedTextScaling(
          maxScaleFactor: kMaxTextScaleFactor,
          child: Builder(builder: (BuildContext context) {
            return contents;
          }),
        ),
      ),
    );
  }
}