import 'package:intl/intl.dart';

import '../../../../common_path.dart';


class DateSelection extends StatelessWidget {
  final String? title;
  final DateTime? dateTime;
  final GestureTapCallback? onTap;

  const DateSelection({super.key, this.title, this.dateTime, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: appTheme.bdrClr),
            color: dateTime != null
                ? appTheme.primary.withValues(alpha:0.08)
                : appTheme.bgLight,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                    title == fonts.depart ? 0 : 8),
                bottomRight: Radius.circular(
                    title == fonts.depart ? 0 : 8),
                bottomLeft: Radius.circular(
                    title == fonts.depart ? 8 : 0),
                topLeft: Radius.circular(
                    title == fonts.depart ? 8 : 0))),
        child: Row(children: [
          if (dateTime != null)
            Image.asset(imageAssets.calendar,
                height: 24, width: 24),
          if (dateTime != null) const SizedBox(width: 4),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title!,
                style: AppCss.figtreeRegular12.textColor(dateTime != null? appTheme.primary:appTheme.greyText)),
            Text(
                dateTime != null
                    ? DateFormat("MMM, dd yyyy").format(dateTime!)
                    : fonts.when,
                style: AppCss.figtreeSB16.textColor(dateTime != null? appTheme.primary:appTheme.greyText))
          ])
        ])).inkWell(onTap: onTap);
  }
}
