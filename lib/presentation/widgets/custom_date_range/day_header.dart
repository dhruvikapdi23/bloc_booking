
import '../../../common_path.dart';
import '../../../core/helper/statis_values.dart';
import 'month_item_grid_delegate.dart';

const MonthItemGridDelegate monthItemGridDelegate = MonthItemGridDelegate();

class DayHeaders extends StatelessWidget {
  const DayHeaders({super.key});

  /// Builds widgets showing abbreviated days of week. The first widget in the
  /// returned list corresponds to the first day of week for the current locale.
  ///
  /// Examples:
  ///
  ///     ┌ Sunday is the first day of week in the US (en_US)
  ///     |
  ///     S M T W T F S  ← the returned list contains these widgets
  ///     _ _ _ _ _ 1 2
  ///     3 4 5 6 7 8 9
  ///
  ///     ┌ But it's Monday in the UK (en_GB)
  ///     |
  ///     M T W T F S S  ← the returned list contains these widgets
  ///     _ _ _ _ 1 2 3
  ///     4 5 6 7 8 9 10
  ///
  List<Widget> _getDayHeaders(
      TextStyle headerStyle, MaterialLocalizations localizations) {
    final List<Widget> result = <Widget>[];
    for (int i = localizations.firstDayOfWeekIndex;
    result.length < DateTime.daysPerWeek;
    i = (i + 1) % DateTime.daysPerWeek) {
      final String weekday = localizations.narrowWeekdays[i];
      result.add(ExcludeSemantics(
        child: Center(
            child: Text(weekday,
                style: AppCss.figtreeRegular14.textColor(weekday.contains("S")
                    ? appTheme.primary
                    : appTheme.secondary))),
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextStyle textStyle =
    themeData.textTheme.titleSmall!.apply(color: colorScheme.onSurface);
    final MaterialLocalizations localizations =
    MaterialLocalizations.of(context);

    final List<Widget> labels = _getDayHeaders(textStyle, localizations);

    // Add leading and trailing containers for edges of the custom grid layout.
    labels.insert(0, Container());
    labels.add(Container());

    return Container(
      decoration: BoxDecoration(
          color: appTheme.bgLight, borderRadius: BorderRadius.circular(4)),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.orientationOf(context) == Orientation.landscape
            ? maxCalendarWidthLandscape
            : maxCalendarWidthPortrait,
        maxHeight: monthItemRowHeight,
      ),
      child: GridView.custom(
        shrinkWrap: true,
        gridDelegate: monthItemGridDelegate,
        childrenDelegate: SliverChildListDelegate(
          labels,
          addRepaintBoundaries: false,
        ),
      ),
    );
  }
}