
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../common_path.dart';


class EasyDateTimeLineCustom extends StatefulWidget {
  const EasyDateTimeLineCustom({
    super.key,
    required this.initialDate,
    this.disabledDates,
    this.headerProps = const EasyHeaderProps(),
    this.timeLineProps = const EasyTimeLineProps(),
    this.dayProps = const EasyDayProps(),
    this.onDateChange,
    this.itemBuilder,
    this.activeColor,
    this.locale = "en_US",
  });

  final DateTime initialDate;

  final List<DateTime>? disabledDates;

  final Color? activeColor;

  final EasyHeaderProps headerProps;

  final EasyTimeLineProps timeLineProps;

  final EasyDayProps dayProps;

  final OnDateChangeCallBack? onDateChange;

  final ItemBuilderCallBack? itemBuilder;

  final String locale;

  @override
  State<EasyDateTimeLineCustom> createState() => _EasyDateTimeLineCustomState();
}

class _EasyDateTimeLineCustomState extends State<EasyDateTimeLineCustom> {
  late EasyMonth _easyMonth;
  late int _initialDay;

  late ValueNotifier<DateTime?> _focusedDateListener;

  DateTime get initialDate => widget.initialDate;

  @override
  void initState() {
    // Init easy date timeline locale
    initializeDateFormatting(widget.locale, null);
    super.initState();
    // Get initial month
    _easyMonth =
        EasyDateUtils.convertDateToEasyMonth(widget.initialDate, widget.locale);
    _initialDay = widget.initialDate.day;
    _focusedDateListener = ValueNotifier(initialDate);
  }

  void _onFocusedDateChanged(DateTime date) {
    _focusedDateListener.value = date;
    widget.onDateChange?.call(date);
  }

  @override
  void dispose() {
    _focusedDateListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeDayColor = widget.activeColor ?? Theme.of(context).primaryColor;

    final brightness = ThemeData.estimateBrightnessForColor(
      widget.activeColor ?? activeDayColor,
    );

    final activeDayTextColor =
    brightness == Brightness.light ? Colors.red : Colors.white;
    return ValueListenableBuilder(
        valueListenable: _focusedDateListener,
        builder: (context, focusedDate, child) => TimeLineWidget(
            initialDate: initialDate.copyWith(
              month: _easyMonth.vale,
              day: _initialDay,
            ),
            inactiveDates: widget.disabledDates,
            focusedDate: focusedDate,
            onDateChange: _onFocusedDateChanged,
            timeLineProps: widget.timeLineProps,
            dayProps: widget.dayProps,
            itemBuilder: widget.itemBuilder,
            activeDayTextColor: activeDayTextColor,
            activeDayColor: activeDayColor,
            locale: widget.locale));
  }
}

typedef OnDateChangeCallBack = void Function(DateTime selectedDate);

typedef ItemBuilderCallBack = Widget Function(
    BuildContext context,
    DateTime date,
    bool isSelected,
    VoidCallback onTap,
    );

typedef OnMonthChangeCallBack = void Function(EasyMonth? month);

typedef HeaderBuilderCallBack = Widget Function(
    BuildContext context,
    DateTime date,
    );

class EasyMonth {
  const EasyMonth({
    required this.name,
    required this.vale,
  });

  final String name;

  final int vale;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EasyMonth &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              vale == other.vale;

  @override
  int get hashCode => Object.hash(
    name.hashCode,
    vale.hashCode,
  );

  @override
  String toString() => "<$name,$vale>";
}

abstract class EasyDateUtils {
  static int getDaysInMonth(DateTime date) {
    return DateUtils.getDaysInMonth(date.year, date.month);
  }

  static bool isSameDay(DateTime dateA, DateTime dateB) {
    return DateUtils.isSameDay(dateA, dateB);
  }

  static EasyMonth convertDateToEasyMonth(DateTime date, String locale) {
    return EasyMonth(
      name: EasyDateFormatter.shortMonthName(
          DateTime(date.year, date.month), locale),
      vale: date.month,
    );
  }

  static bool isToday(DateTime date) {
    DateTime now = DateTime.now();
    return isSameDay(now, date);
  }

  static int calculateDaysCount(DateTime firstDate, DateTime lastDate) {
    return lastDate.difference(firstDate).inDays + 1;
  }
}

class EasyConstants {
  EasyConstants._();

  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration selectionModeAnimationDuration =
  Duration(milliseconds: 400);

  // Day widget constants
  static const double dayWidgetBorderRadius = 12.0;
  static const BorderRadius daySplashBorder =
  BorderRadius.all(Radius.circular(dayWidgetBorderRadius));
  static const double dayWidgetWidth = 68.0;
  static const double dayWidgetHeight = 112.0;
  static const double dayAsNumFontSize = 20.0;
  static const double dayAsStrFontSize = 12.0;
  static const double landscapeDayPadding = 4.0;

  // Timeline list constants
  static const double separatorPadding = 8.0;
  static const double timelinePadding = 8.0;
  static const String startLocale = "en_US";

  // Month dropdown constants
  static const double monthDropDownRadius = 12.0;
  static const int monthDropDownElevation = 4;
  static const double monthAsStrFontSize = 12.0;

  // Header constants
  static const double selectedDateFontSize = 16.0;
}

class TimeLineWidget extends StatefulWidget {
  TimeLineWidget({
    super.key,
    required this.initialDate,
    required this.focusedDate,
    required this.activeDayTextColor,
    required this.activeDayColor,
    this.inactiveDates,
    this.dayProps = const EasyDayProps(),
    this.locale = "en_US",
    this.timeLineProps = const EasyTimeLineProps(),
    this.onDateChange,
    this.itemBuilder,
  })  : assert(timeLineProps.hPadding > -1,
  "Can't set timeline hPadding less than zero."),
        assert(timeLineProps.separatorPadding > -1,
        "Can't set timeline separatorPadding less than zero."),
        assert(timeLineProps.vPadding > -1,
        "Can't set timeline vPadding less than zero.");

  final DateTime initialDate;

  final DateTime? focusedDate;

  final Color activeDayTextColor;

  final Color activeDayColor;

  final List<DateTime>? inactiveDates;

  final EasyTimeLineProps timeLineProps;

  final EasyDayProps dayProps;

  final OnDateChangeCallBack? onDateChange;

  final ItemBuilderCallBack? itemBuilder;

  final String locale;

  @override
  State<TimeLineWidget> createState() => _TimeLineWidgetState();
}

class _TimeLineWidgetState extends State<TimeLineWidget> {
  EasyDayProps get _dayProps => widget.dayProps;

  EasyTimeLineProps get _timeLineProps => widget.timeLineProps;

  bool get _isLandscapeMode => _dayProps.landScapeMode;

  double get _dayWidth => _dayProps.width;

  double get _dayHeight => _dayProps.height;

  double get _dayOffsetConstrains => _isLandscapeMode ? _dayHeight : _dayWidth;

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(
      initialScrollOffset: _calculateDateOffset(widget.initialDate),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _calculateDateOffset(DateTime date) {
    final startDate = DateTime(date.year, date.month, 1);
    int offset = date.difference(startDate).inDays;
    double adjustedHPadding =
    _timeLineProps.hPadding > EasyConstants.timelinePadding
        ? (_timeLineProps.hPadding - EasyConstants.timelinePadding)
        : 0.0;
    if (offset == 0) {
      return 0.0;
    }
    return (offset * _dayOffsetConstrains) +
        (offset * _timeLineProps.separatorPadding) +
        adjustedHPadding;
  }

  @override
  Widget build(BuildContext context) {
    final initialDate = widget.initialDate;
    final effectiveTimeLineHeight = _isLandscapeMode ? _dayWidth : _dayHeight;
    final effectiveTimeLineBackgroundColor = _timeLineProps.decoration == null
        ? _timeLineProps.backgroundColor
        : null;
    final effectiveTimeLineBorderRadius =
        _timeLineProps.decoration?.borderRadius ?? BorderRadius.zero;

    return SizedBox(
      height: effectiveTimeLineHeight,
      child: ClipRRect(
        borderRadius: effectiveTimeLineBorderRadius,
        child: ListView.separated(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final currentDate =
            DateTime(initialDate.year, initialDate.month, index + 1);

            final isSelected = EasyDateUtils.isSameDay(
                widget.focusedDate ?? initialDate, currentDate);

            bool isDisabledDay = false;

            if (widget.inactiveDates != null) {
              for (DateTime inactiveDate in widget.inactiveDates!) {
                if (EasyDateUtils.isSameDay(currentDate, inactiveDate)) {
                  isDisabledDay = true;
                  break;
                }
              }
            }
            return _dayItemBuilder(context, isSelected, currentDate);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 5);
          },
          itemCount: EasyDateUtils.getDaysInMonth(initialDate),
        ),
      ),
    );
  }

  Widget _dayItemBuilder(
      BuildContext context,
      bool isSelected,
      DateTime date,
      ) {
    return widget.itemBuilder!(
      context,
      date,
      isSelected,
          () => _onDayChanged(date),
    );
  }

  void _onDayChanged(DateTime currentDate) {
    // A date is selected
    widget.onDateChange?.call(currentDate);
  }
}

final class EasyTextStyles {
  EasyTextStyles._();

  static const TextStyle dayNumStyle = TextStyle(
    fontSize: EasyConstants.dayAsNumFontSize,
    fontWeight: FontWeight.bold,
    color: EasyColors.dayAsNumColor,
  );

  static const TextStyle dayStrStyle = TextStyle(
    fontSize: EasyConstants.dayAsStrFontSize,
    color: EasyColors.dayAsStrColor,
  );

  static const TextStyle monthStrStyle = TextStyle(
    fontSize: EasyConstants.monthAsStrFontSize,
    color: EasyColors.monthAsStrColor,
  );

  static const TextStyle selectedDateStyle = TextStyle(
    fontSize: EasyConstants.selectedDateFontSize,
    fontWeight: FontWeight.bold,
    color: EasyColors.dayAsNumColor,
  );
}

final class EasyColors {
  EasyColors._();

  static const Color dayWidgetBorderColor = Color(0xffF2F2F2);

  static const Color dayAsNumColor = Color(0xff0D0C0D);

  static const Color dayAsStrColor = Color(0xff8F8F8F);

  static const Color monthAsStrColor = Color(0xff8F8F8F);

  static const Color disabledDayColor = Color(0xB39CA3AF);
}

final class EasyDayProps {
  const EasyDayProps({
    this.activeDayStyle = const DayStyle(),
    this.inactiveDayStyle = const DayStyle(),
    this.disabledDayStyle = const DayStyle(),
    this.todayStyle = const DayStyle(),
    @Deprecated(
      'Use `activeDayStyle` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.activeDayDecoration,
    @Deprecated(
      'Use `inactiveDayStyle` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.inactiveDayDecoration,
    this.dayStructure = DayStructure.monthDayNumDayStr,
    @Deprecated(
      'Use `activeDayStyle` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.activeBorderRadius = EasyConstants.dayWidgetBorderRadius,
    @Deprecated(
      'Use `inactiveDayStyle` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.inactiveBorderRadius = EasyConstants.dayWidgetBorderRadius,
    this.borderColor = EasyColors.dayWidgetBorderColor,
    this.width = EasyConstants.dayWidgetWidth,
    this.height = EasyConstants.dayWidgetHeight,
    @Deprecated(
      'Use `activeDayStyle` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.activeDayNumStyle,
    @Deprecated(
      'Use `inactiveDayStyle` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.inactiveDayNumStyle,
    @Deprecated(
      'Use `todayStyle` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.todayNumStyle,
    @Deprecated(
      'Use `TodayProps` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.todayStrStyle,
    @Deprecated(
      'Use `activeDayStyle` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.activeDayStrStyle,
    @Deprecated(
      'Use `inactiveDayStyle` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.inactiveDayStrStyle,
    @Deprecated(
      'Use `todayStyle` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.todayMonthStrStyle,
    @Deprecated(
      'Use `activeDayStyle` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.activeMothStrStyle,
    @Deprecated(
      'Use `inactiveDayStyle` instead. '
          'This feature was deprecated after v0.0.7',
    )
    this.inactiveMothStrStyle,
    this.landScapeMode = false,
    this.todayHighlightColor,
    this.todayHighlightStyle = TodayHighlightStyle.withBorder,
  });

  final DayStyle activeDayStyle;

  final DayStyle inactiveDayStyle;

  final DayStyle disabledDayStyle;

  final DayStyle todayStyle;

  final BoxDecoration? activeDayDecoration;

  final BoxDecoration? inactiveDayDecoration;

  final DayStructure dayStructure;

  final double activeBorderRadius;

  final double inactiveBorderRadius;

  final Color borderColor;

  final TextStyle? activeDayNumStyle;

  final TextStyle? inactiveDayNumStyle;

  final TextStyle? todayNumStyle;

  final TextStyle? activeDayStrStyle;

  final TextStyle? inactiveDayStrStyle;

  final TextStyle? todayStrStyle;

  final TextStyle? activeMothStrStyle;

  final TextStyle? inactiveMothStrStyle;

  final TextStyle? todayMonthStrStyle;

  final double width;

  final double height;

  final bool landScapeMode;

  final Color? todayHighlightColor;

  final TodayHighlightStyle todayHighlightStyle;
}

enum DayStructure {
  monthDayNumDayStr,
  dayStrDayNumMonth,
  dayNumDayStr,
  dayStrDayNum,
  dayNumberOnly,
  dayNameOnly,
}

enum TodayHighlightStyle {
  withBorder,
  withBackground,
  none,
}

final class EasyHeaderProps {
  const EasyHeaderProps({
    this.showHeader = true,
    this.showSelectedDate = true,
    this.showMonthPicker = true,
    this.centerHeader = false,
    @Deprecated(
      'Use `dateFormatter` instead. '
          'This feature was deprecated after v1.0.2',
    )
    this.selectedDateFormat = SelectedDateFormat.dayOnly,
    this.monthPickerType = MonthPickerType.dropDown,
    this.selectedDateStyle,
    this.monthStyle,
    this.padding,
  });

  final bool showHeader;

  final bool showSelectedDate;

  final bool showMonthPicker;

  final bool centerHeader;

  final SelectedDateFormat selectedDateFormat;

  final MonthPickerType monthPickerType;

  final TextStyle? selectedDateStyle;

  final TextStyle? monthStyle;

  final EdgeInsets? padding;
}

enum SelectedDateFormat {
  dayOnly("EEEE"),
  monthOnly("MMMM"),
  fullDateDMY("dd/MM/yyyy"),
  fullDateMDY("MM/dd/yyyy"),
  fullDateDayAsStrMY("EEEE M,y"),
  fullDateDMonthAsStrY("d MMMM, yyyy"),
  fullDateMonthAsStrDY("MMMM d, yyyy");

  const SelectedDateFormat(this.formatter);

  final String formatter;
}

enum MonthPickerType {
  dropDown,
  switcher,
}

final class EasyTimeLineProps {
  const EasyTimeLineProps({
    this.hPadding = EasyConstants.timelinePadding,
    this.vPadding = 0.0,
    this.separatorPadding = EasyConstants.separatorPadding,
    this.backgroundColor,
    this.margin,
    this.decoration,
  });

  final double hPadding;

  final double vPadding;

  final double separatorPadding;

  final Color? backgroundColor;

  final EdgeInsets? margin;

  final BoxDecoration? decoration;
}

abstract final class EasyDateFormatter {
  static String shortDayName(DateTime date, String locale) {
    return DateFormat("E", locale).format(date);
  }

  static String fullDayName(DateTime date, String locale) {
    return DateFormat("EEEE", locale).format(date);
  }

  static String shortMonthName(DateTime date, String locale) {
    return DateFormat("MMM", locale).format(date);
  }

  static String customFormat(String format, DateTime date, String locale) {
    return DateFormat(format, locale).format(date);
  }

  static String fullMonthName(DateTime date, String locale) {
    return DateFormat("MMMM", locale).format(date);
  }

  static String fullDateDMY(DateTime date, String locale) {
    return DateFormat("dd/MM/yyyy", locale).format(date);
  }
}

class DayStyle {
  const DayStyle({
    this.decoration,
    this.borderRadius,
    this.dayNumStyle,
    this.dayStrStyle,
    this.monthStrStyle,
    this.splashBorder = EasyConstants.daySplashBorder,
  });

  final BoxDecoration? decoration;

  final double? borderRadius;

  final TextStyle? dayNumStyle;

  final TextStyle? dayStrStyle;

  final TextStyle? monthStrStyle;

  final BorderRadius splashBorder;
}
