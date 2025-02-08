
import 'package:bloc_booking/models/my_booking_model.dart';


import '../../../../common_path.dart';

class FlightBookingCard extends StatelessWidget {
  final MyBookingModel?  bookingModel;
  final GestureTapCallback? onTap;
  const FlightBookingCard({super.key, this.bookingModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Image.asset(imageAssets.bookingBg,  height: 125,),
        Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 12,top: 8),
            height: 125,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageAssets.bookingBg),
                    fit: BoxFit.fill)),
            child: Column(children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(bookingModel!.totalDays!.toString(),
                        style: AppCss.figtreeSB12
                            .copyWith(color: appTheme.secondary)),
                    Row(
                      children: [
                        Image.asset(bookingModel!.airlines!,
                            height: 20, width: 20),
                        Text(bookingModel!.airlineName!.toString(),
                            style: AppCss.figtreeSB12
                                .copyWith(
                                color: appTheme.secondary)),
                      ],
                    ),
                  ],
                ),
                DottedLine(dashColor: appTheme.lightGrey)
                    .paddingSymmetric(
                    vertical: 15, horizontal: 10)
              ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(bookingModel!.arrival!,
                              style: AppCss.figtreeRegular12
                                  .copyWith(
                                  color: appTheme.greyText)),
                          Text(bookingModel!.arrivalAirport!,
                              style: AppCss.figtreeSB16
                                  .copyWith(
                                  color: appTheme.secondary)),
                          Text(bookingModel!.arrivalTime!,
                              style: AppCss.figtreeRegular8
                                  .copyWith(
                                  color: appTheme.secondary))
                        ]),
                    Container(
                        padding: const EdgeInsets.all(2.5),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color:
                            appTheme.greyText.withValues(alpha:.40),
                            shape: BoxShape.circle),
                        child: Container(
                            decoration: BoxDecoration(
                                color: appTheme.secondary,
                                shape: BoxShape.circle))),
                    Expanded(
                        child: DottedLine(
                            direction: Axis.horizontal,
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
                            dashGapRadius: 0.0)),
                    RotatedBox(
                        quarterTurns: -1,
                        child: SvgPicture.asset(svgAssets.flight)),
                    Expanded(
                        child: DottedLine(
                            direction: Axis.horizontal,
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
                            dashGapRadius: 0.0)),
                    Container(
                        padding: const EdgeInsets.all(2.5),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color:
                            appTheme.greyText.withValues(alpha:.40),
                            shape: BoxShape.circle),
                        child: Container(
                            decoration: BoxDecoration(
                                color: appTheme.secondary,
                                shape: BoxShape.circle))),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(bookingModel!.depart!,
                              style: AppCss.figtreeRegular8
                                  .copyWith(
                                  color: appTheme.greyText)),
                          Text(bookingModel!.departAirport!,
                              style: AppCss.figtreeSB16
                                  .copyWith(
                                  color: appTheme.secondary)),
                          Text(bookingModel!.departTime!,
                              style: AppCss.figtreeRegular8
                                  .copyWith(
                                  color: appTheme.secondary)),
                        ])
                  ])
            ])),
        Text(bookingModel!.status!,
            style: AppCss.figtreeSB8
                .copyWith(color: appTheme.white)).paddingSymmetric(horizontal: 6,vertical: 4)
            .decorated(
            color: bookingModel!.status!.toLowerCase() == fonts.checkedIn.toLowerCase()
                ? appTheme.checkInColor
                : bookingModel!.status!.toLowerCase() == fonts.pending.toLowerCase()
                ? appTheme.pendingColor
                : appTheme.red,
            borderRadius: BorderRadius.circular(6)).alignment(Alignment.topRight).paddingSymmetric(horizontal: 9)
      ],
    ).inkWell(onTap: onTap);
  }
}
