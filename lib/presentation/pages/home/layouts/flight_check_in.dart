

import '../../../../common_path.dart';

class FlightCheckIn extends StatelessWidget {
  const FlightCheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(svgAssets.check)
            .paddingAll(3)
            .decorated(
            shape: BoxShape.circle,
            border: Border.all(color: appTheme.green, width: 1.2))
            .height(24)
            .width(24),
        const HSpace(8),
        Text(fonts.yourFlightToLondon,
            style:
            AppCss.figtreeM14.copyWith(color: appTheme.green))
      ],
    ).paddingAll(12).decorated(color: appTheme.lightGreen);
  }
}
