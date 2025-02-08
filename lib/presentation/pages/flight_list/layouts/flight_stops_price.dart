
import 'package:bloc_booking/presentation/pages/flight_list/layouts/plane_info.dart';

import '../../../../common_path.dart';

class FlightStopsPrice extends StatelessWidget {
  final dynamic data;
final bool isAnotherStops;
  const FlightStopsPrice({super.key, this.data, this.isAnotherStops =false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(2.5),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: appTheme.greyText.withValues(alpha:.40),
                        shape: BoxShape.circle),
                    child: Container(
                        decoration: BoxDecoration(
                            color: appTheme.secondary,
                            shape: BoxShape.circle))),
                SizedBox(
                  height: 100,
                  child: DottedLine(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashGradient: [
                      appTheme.secondary,
                      const Color(0xFF334F90).withValues(alpha:.10)
                    ],
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  ),
                ),
                SvgPicture.asset(svgAssets.flight),
                SizedBox(
                  height: 100,
                  child: DottedLine(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashGradient: [
                      const Color(0xFF334F90).withValues(alpha:.10),
                      appTheme.secondary
                    ],
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(2.5),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: appTheme.greyText.withValues(alpha:.40),
                        shape: BoxShape.circle),
                    child: Container(
                        decoration: BoxDecoration(
                            color: appTheme.secondary, shape: BoxShape.circle)))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['departAirport'],
                    style:
                        AppCss.figtreeSB20.textColor(appTheme.secondary)),
                const VSpace(10),
                PlaneInfo(icon: imageAssets.appLogo, text: data['airNumber']),
                const VSpace(8),
                PlaneInfo(icon: imageAssets.gate, text: data['gate']),
                const VSpace(8),
                PlaneInfo(icon: imageAssets.airlines, text: data['airLines']),
                const VSpace(8),
                PlaneInfo(icon: imageAssets.seat, text: data['airLineType']),
                const VSpace(8),
                PlaneInfo(icon: imageAssets.clock, text: data['hours']),
                const VSpace(24),
                Text(data['arrivalAirport'],
                    style:
                        AppCss.figtreeSB20.textColor(appTheme.secondary)),
              ],
            ).marginSymmetric(horizontal: 20)
          ],
        ),
        if (data['stops'] != null || isAnotherStops )
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fonts.differentTerminal,
                  style: AppCss.figtreeRegular12.textColor(appTheme.red)),
              const VSpace(8),
              Text(fonts.baggageChecked,
                  style: AppCss.figtreeRegular12.textColor(appTheme.green)),
              const VSpace(15),
              Text("${data['hours']} transfer time",
                  style: AppCss.figtreeRegular12.textColor(appTheme.greyText)),
            ],
          ).marginSymmetric(horizontal: 34).paddingOnly(bottom: 24)
      ],
    );
  }
}
