import 'package:intl/intl.dart' as date;

import '../../../common_path.dart';
import '../../../core/enums/common_enums.dart';
import '../../../core/helper/statis_values.dart';
import 'highlight_painter.dart';

class DayItem extends StatefulWidget {
  const DayItem({super.key, 
    required this.day,
    required this.focusNode,
    required this.onChanged,
    required this.onFocusChange,
    required this.highlightColor,
    required this.isDisabled,
    required this.isRangeSelected,
    required this.isSelectedDayStart,
    required this.isSelectedDayEnd,
    required this.isInRange,
    required this.isOneDayRange,
    required this.isToday,
  });

  final DateTime day;

  final FocusNode focusNode;

  final ValueChanged<DateTime> onChanged;

  final ValueChanged<bool> onFocusChange;

  final Color highlightColor;

  final bool isDisabled;

  final bool isRangeSelected;

  final bool isSelectedDayStart;

  final bool isSelectedDayEnd;

  final bool isInRange;

  final bool isOneDayRange;

  final bool isToday;

  @override
  State<DayItem> createState() => DayItemState();
}

class DayItemState extends State<DayItem> {
  final WidgetStatesController _statesController = WidgetStatesController();

  @override
  void dispose() {
    _statesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final MaterialLocalizations localizations =
    MaterialLocalizations.of(context);
    final DatePickerThemeData datePickerTheme = DatePickerTheme.of(context);
    final DatePickerThemeData defaults = DatePickerTheme.defaults(context);
    const TextDirection textDirection = TextDirection.ltr;
    final Color highlightColor = appTheme.red.withValues(alpha:.05);

    BoxDecoration? decoration;

    T? effectiveValue<T>(T? Function(DatePickerThemeData? theme) getProperty) {
      return getProperty(datePickerTheme) ?? getProperty(defaults);
    }

    final Set<WidgetState> states = <WidgetState>{
      if (widget.isDisabled) WidgetState.disabled,
      if (widget.isSelectedDayStart || widget.isSelectedDayEnd)
        WidgetState.selected,
    };

    _statesController.value = states;

    final WidgetStateProperty<Color?> dayOverlayColor =
    WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) => effectiveValue(
              (DatePickerThemeData? theme) => widget.isInRange
              ? theme?.rangeSelectionOverlayColor?.resolve(states)
              : theme?.dayOverlayColor?.resolve(states),
        ));

    HighlightPainter? highlightPainter;

    if (widget.isSelectedDayStart || widget.isSelectedDayEnd) {
      // The selected start and end dates gets a circle background
      // highlight, and a contrasting text color.

      decoration = BoxDecoration(
        color: appTheme.secondary,
        shape: BoxShape.circle,
      );

      if (widget.isRangeSelected && !widget.isOneDayRange) {
        final HighlightPainterStyle style = widget.isSelectedDayStart
            ? HighlightPainterStyle.highlightTrailing
            : HighlightPainterStyle.highlightLeading;
        highlightPainter = HighlightPainter(
          color: highlightColor,
          date: widget.day,
          style: style,
          textDirection: textDirection,
        );
      }
    } else if (widget.isInRange) {
      // The days within the range get a light background highlight.
      highlightPainter = HighlightPainter(
        color: highlightColor,
        date: widget.day,
        style: HighlightPainterStyle.highlightAll,
        textDirection: textDirection,
      );
    } else if (widget.isToday) {
      decoration = BoxDecoration(
        border: Border.all(color: colorScheme.primary),
        shape: BoxShape.circle,
      );
    }

    final String dayText = localizations.formatDecimal(widget.day.day);

    // We want the day of month to be spoken first irrespective of the
    // locale-specific preferences or TextDirection. This is because
    // an accessibility user is more likely to be interested in the
    // day of month before the rest of the date, as they are looking
    // for the day of month. To do that we prepend day of month to the
    // formatted full date.
    final String semanticLabelSuffix =
    widget.isToday ? ', ${localizations.currentDateLabel}' : '';
    String semanticLabel =
        '$dayText, ${localizations.formatFullDate(widget.day)}$semanticLabelSuffix';
    if (widget.isSelectedDayStart) {
      semanticLabel =
          localizations.dateRangeStartDateSemanticLabel(semanticLabel);
    } else if (widget.isSelectedDayEnd) {
      semanticLabel =
          localizations.dateRangeEndDateSemanticLabel(semanticLabel);
    }

    Widget dayWidget = Container(
      height: 40,
      width: 40,
      decoration: decoration,
      child: Center(
        child: Semantics(
          label: semanticLabel,
          selected: widget.isSelectedDayStart || widget.isSelectedDayEnd,
          child: ExcludeSemantics(
            child: Text(dayText,
                style: AppCss.figtreeRegular14.textColor(
                    widget.isSelectedDayStart || widget.isSelectedDayEnd
                        ? appTheme.white
                        : appTheme.secondary)),
          ),
        ),
      ),
    );
    final lastDayOfMonth = DateTime(widget.day.year, widget.day.month + 1, 0);

    if (highlightPainter != null) {
      dayWidget = Container(
        decoration: date.DateFormat("EEEE").format(widget.day) == "Saturday" ||
            widget.day.day == lastDayOfMonth.day
            ? BoxDecoration(
            color: appTheme.secondary.withValues(alpha:.05),
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                topRight: Radius.circular(50)))
            : date.DateFormat("EEEE").format(widget.day) == "Sunday" ||
            widget.day.day == 1
            ? BoxDecoration(
            color: appTheme.secondary.withValues(alpha:.05),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50)))
            : widget.isSelectedDayStart || widget.isSelectedDayEnd
            ? BoxDecoration(
            color: appTheme.secondary.withValues(alpha:.05),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    widget.isSelectedDayStart ? 50 : 0),
                bottomLeft: Radius.circular(
                    widget.isSelectedDayStart ? 50 : 0),
                bottomRight: Radius.circular(
                    !widget.isSelectedDayStart ? 50 : 0),
                topRight: Radius.circular(
                    !widget.isSelectedDayStart ? 50 : 0)))
            : BoxDecoration(
            color: appTheme.secondary.withValues(alpha:.05),
            borderRadius: widget.isInRange
                ? null
                : widget.isSelectedDayStart
                ? null
                : BorderRadius.circular(50)),
        child: dayWidget,
      );
    }

    if (!widget.isDisabled) {
      dayWidget = InkResponse(
        focusNode: widget.focusNode,
        onTap: () => widget.onChanged(widget.day),
        radius: monthItemRowHeight / 2 + 4,
        statesController: _statesController,
        overlayColor: dayOverlayColor,
        onFocusChange: widget.onFocusChange,
        child: dayWidget,
      );
    }

    return dayWidget;
  }
}