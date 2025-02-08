import 'package:intl/intl.dart';

import '../../../../common_path.dart';
import '../../../widgets/custom_horizontal_calendar/easy_date_time_custom.dart';

class HorizontalDateWithPrice extends StatelessWidget {
  const HorizontalDateWithPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLineCustom(
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {
          //`selectedDate` the new date selected.
        },
        dayProps: const EasyDayProps(height: 42),
        headerProps: const EasyHeaderProps(showHeader: false),
        itemBuilder: (context, date, isSelected, onTap) {
          return InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                      color: isSelected ? appTheme.primary : null,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(DateFormat("EEE, MMM dd").format(date),
                            style: AppCss.figtreeRegular8.textColor(
                                isSelected
                                    ? appTheme.white
                                    : appTheme.greyText)),
                        Text("USD 235",
                            style: AppCss.figtreeSB12.textColor(
                                isSelected
                                    ? appTheme.white
                                    : appTheme.black))
                      ])));
        });
  }
}
