
import '../../../../common_path.dart';

class CitiesSelectionLayout extends StatelessWidget {
  final String? title,cityName,airportName;
  final GestureTapCallback? onTap;

  const CitiesSelectionLayout({super.key, this.title, this.cityName, this.onTap, this.airportName});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: appTheme.bdrClr),
            color: appTheme.bgLight,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topLeft: Radius.circular(8))),
        child: Column(
            crossAxisAlignment: title == fonts.to ?CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(title!,
                  style: AppCss.figtreeRegular12
                      .textColor(appTheme.greyText)),
              Text(cityName ?? "Where",
                  style: AppCss.figtreeSB20
                      .textColor(appTheme.secondary)),
              Text(airportName?? 'Airports or cities',
                  textAlign: title == fonts.to ?TextAlign.end:TextAlign.start,
                  style: AppCss.figtreeRegular12
                      .textColor(appTheme.greyText))
            ])).inkWell(onTap: onTap);
  }
}
