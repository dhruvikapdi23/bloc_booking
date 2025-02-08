import '../../../common_path.dart';
import '../../bloc/my_flight_booking/my_flight_booking_cubit.dart';

class FlightBookingDetailInit extends StatelessWidget {
  const FlightBookingDetailInit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator.get<MyFlightBookingCubit>()..initState(context),
      child: const FlightBookDetail(),
    );
  }
}

class FlightBookDetail extends StatefulWidget {
  const FlightBookDetail({super.key});

  @override
  State<FlightBookDetail> createState() => _FlightBookDetailState();
}

class _FlightBookDetailState extends State<FlightBookDetail> {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    MyFlightBookingCubit flight = context.read<MyFlightBookingCubit>();

    return BlocConsumer<MyFlightBookingCubit, MyFlightBookingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: Stack(
          children: [
            Image.asset(imageAssets.map),
            SvgPicture.asset(svgAssets.cancel,
                    colorFilter:
                        ColorFilter.mode(appTheme.secondary, BlendMode.srcIn))
                .paddingAll(4)
                .decorated(
                    color: appTheme.lightGrey.withValues(alpha:.80),
                    borderRadius: BorderRadius.circular(12))
                .marginOnly(left: 21, top: 48)
                .inkWell(onTap: () => context.pop(context)),
            if (flight.bookingModel != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: DraggableScrollableSheet(
                  controller: sheetController,
                  initialChildSize: .69,
                  maxChildSize: 0.9,
                  minChildSize: .69,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Row(children: [
                                    Image.asset(imageAssets.appLogo,
                                        height: 24, width: 24),
                                    const HSpace(8),
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Text("Los Angeles to London",
                                              style: AppCss.figtreeSB14
                                                  .copyWith(
                                                      color:
                                                          appTheme.secondary)),
                                          Text(
                                              flight.bookingModel!.status ==
                                                      "Checked in"
                                                  ? "Fri, Aug 20 | DL 493 | Operated by Delta"
                                                  : "Fri, Aug 20 | DL 493, Alaska 906 | Operated by Alaska Airline",
                                              style: AppCss.figtreeRegular12
                                                  .copyWith(
                                                      color:
                                                          appTheme.greyText)),
                                        ]))
                                  ])),
                                  (flight.bookingModel!.status == fonts.pending)
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(svgAssets.edit,
                                                height: 24, width: 24),
                                            const HSpace(4),
                                            Text(fonts.edit,
                                                style: AppCss.figtreeRegular12
                                                    .copyWith(
                                                        color:
                                                            appTheme.greyText))
                                          ],
                                        )
                                          .paddingSymmetric(vertical: 6)
                                          .decorated(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: appTheme
                                                      .textBoxBorderGrey))
                                          .width(74)
                                      : (flight.bookingModel!.status ==
                                              fonts.seatNotSelected)
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(svgAssets.seat,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            appTheme.white,
                                                            BlendMode.srcIn),
                                                    height: 24,
                                                    width: 24),
                                                const HSpace(4),
                                                Text(fonts.selectSeat,
                                                    style: AppCss
                                                        .figtreeRegular12
                                                        .copyWith(
                                                            color:
                                                                appTheme.white))
                                              ],
                                            )
                                              .paddingSymmetric(vertical: 6)
                                              .decorated(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: appTheme.primary)
                                              .width(114)
                                              .inkWell(
                                                  onTap: () => context
                                                      .pushNamed(RouteName
                                                          .selectSeats))
                                          : Container(),
                                ],
                              ).paddingSymmetric(horizontal: 24),
                              const VSpace(24),
                              if (flight.bookingModel!.status!.toLowerCase() !=
                                  fonts.checkedIn.toLowerCase())
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        flight.bookingModel!.status ==
                                                fonts.pending
                                            ? svgAssets.info
                                            : svgAssets.question,
                                        colorFilter: ColorFilter.mode(
                                            flight.bookingModel!.status ==
                                                    fonts.pending
                                                ? appTheme.infoColor
                                                : appTheme.darkOrange,
                                            BlendMode.srcIn),
                                        height: 24,
                                        width: 24),
                                    const HSpace(5),
                                    Expanded(
                                        child: Text(
                                            flight.bookingModel!.status ==
                                                    fonts.pending
                                                ? "The system will automatically check in once check in portal opens."
                                                : "You haven’t select seat. Select your seat now!",
                                            style: AppCss.figtreeRegular14
                                                .copyWith(
                                                    color: flight.bookingModel!
                                                                .status ==
                                                            fonts.pending
                                                        ? appTheme.infoColor
                                                        : appTheme.darkOrange)))
                                  ],
                                )
                                    .paddingSymmetric(
                                        horizontal: 24, vertical: 8)
                                    .backgroundColor(
                                        flight.bookingModel!.status ==
                                                fonts.pending
                                            ? appTheme.infoLightColor
                                            : appTheme.alertClr)
                                    .paddingOnly(bottom: 24),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(2.5),
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                              color: appTheme.greyText
                                                  .withValues(alpha:.40),
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
                                              color: appTheme.greyText
                                                  .withValues(alpha:.40),
                                              shape: BoxShape.circle),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: appTheme.secondary,
                                                  shape: BoxShape.circle)))
                                    ],
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("LAX",
                                                  style: AppCss.figtreeSB28
                                                      .textColor(
                                                          appTheme.secondary)),
                                              const VSpace(5),
                                              Text("Los Angeles Intl",
                                                  style: AppCss.figtreeRegular12
                                                      .textColor(
                                                          appTheme.greyText)),
                                              const VSpace(4),
                                              Text("Terminal 3 | Gate 4",
                                                  style: AppCss.figtreeRegular12
                                                      .textColor(
                                                          appTheme.greyText)),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text("Departing on time",
                                                  style: AppCss.figtreeSB14
                                                      .copyWith(
                                                          color:
                                                              appTheme.green)),
                                              Text("Aug 20, 10:45AM",
                                                  style: AppCss.figtreeRegular12
                                                      .copyWith(
                                                          color: appTheme
                                                              .greyText)),
                                            ],
                                          )
                                        ],
                                      ),
                                      const VSpace(65),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("LHR",
                                                  style: AppCss.figtreeSB28
                                                      .textColor(
                                                          appTheme.secondary)),
                                              const VSpace(5),
                                              Text("Heathrow",
                                                  style: AppCss.figtreeRegular12
                                                      .textColor(
                                                          appTheme.greyText)),
                                              const VSpace(4),
                                              Text("Terminal 3 | Gate 4",
                                                  style: AppCss.figtreeRegular12
                                                      .textColor(
                                                          appTheme.greyText)),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text("Departing on time",
                                                  style: AppCss.figtreeSB14
                                                      .copyWith(
                                                          color: appTheme.red)),
                                              Text("Aug 21, 10:45AM",
                                                  style: AppCss.figtreeRegular12
                                                      .copyWith(
                                                          color: appTheme
                                                              .greyText)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ).marginSymmetric(horizontal: 20)),
                                ],
                              ).marginSymmetric(horizontal: 24),
                              const VSpace(25),
                              Row(
                                children: [
                                  Expanded(
                                      child: DottedLine(
                                          dashColor: appTheme.greyText)),
                                  Text("Total 10hr 35mins | 4850mi | Overnight",
                                          style: AppCss.figtreeRegular12
                                              .copyWith(
                                                  color: appTheme.greyText))
                                      .marginSymmetric(horizontal: 4),
                                  Expanded(
                                      child: DottedLine(
                                          dashColor: appTheme.greyText))
                                ],
                              ).marginSymmetric(horizontal: 24),
                              const VSpace(17),
                              Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(svgAssets.travel),
                                      const VSpace(4),
                                      Text("Class",
                                          style: AppCss.figtreeSB14.copyWith(
                                              color: appTheme.secondary)),
                                      const VSpace(4),
                                      Text("Economy",
                                          style: AppCss.figtreeRegular12
                                              .copyWith(
                                                  color: appTheme.secondary))
                                    ],
                                  ).paddingAll(12).decorated(
                                          border: Border.all(
                                              color: appTheme.lightGrey),
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  const HSpace(12),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(svgAssets.seat),
                                      const VSpace(4),
                                      Text("Seat",
                                          style: AppCss.figtreeSB14.copyWith(
                                              color: appTheme.secondary)),
                                      const VSpace(4),
                                      Text("35B",
                                          style: AppCss.figtreeRegular12
                                              .copyWith(
                                                  color: appTheme.secondary))
                                    ],
                                  ).paddingAll(12).decorated(
                                          border: Border.all(
                                              color: appTheme.lightGrey),
                                          borderRadius:
                                              BorderRadius.circular(8)))
                                ],
                              ).paddingSymmetric(horizontal: 24),
                              const VSpace(24),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Detailed Timeline",
                                      style: AppCss.figtreeSB20
                                          .copyWith(color: appTheme.secondary)),
                                  const VSpace(16),
                                  Text("DEPARTURE",
                                      style: AppCss.figtreeM12
                                          .copyWith(color: appTheme.greyText)),
                                  const VSpace(16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Gate Departure",
                                          style: AppCss.figtreeM12.copyWith(
                                              color: appTheme.secondary)),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text("Scheduled",
                                                  style: AppCss.figtreeRegular12
                                                      .copyWith(
                                                          color: appTheme
                                                              .greyText)),
                                              Text("10:35AM",
                                                  style: AppCss.figtreeM14
                                                      .copyWith(
                                                          color: appTheme
                                                              .secondary)),
                                            ],
                                          ),
                                          const HSpace(12),
                                          Column(
                                            children: [
                                              Text("Estimated",
                                                  style: AppCss.figtreeRegular12
                                                      .copyWith(
                                                          color: appTheme
                                                              .greyText)),
                                              Text("10:35AM",
                                                  style: AppCss.figtreeM14
                                                      .copyWith(
                                                          color:
                                                              appTheme.green)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const VSpace(20),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Takeoff",
                                            style: AppCss.figtreeM12.copyWith(
                                                color: appTheme.secondary)),
                                        Row(children: [
                                          Column(
                                            children: [
                                              Text("Scheduled",
                                                  style: AppCss.figtreeRegular12
                                                      .copyWith(
                                                          color: appTheme
                                                              .greyText)),
                                              Text("10:45AM",
                                                  style: AppCss.figtreeM14
                                                      .copyWith(
                                                          color: appTheme
                                                              .secondary)),
                                            ],
                                          ),
                                          const HSpace(12),
                                          Column(children: [
                                            Text("Estimated",
                                                style: AppCss.figtreeRegular12
                                                    .copyWith(
                                                        color:
                                                            appTheme.greyText)),
                                            Text("10:35AM",
                                                style: AppCss.figtreeM14
                                                    .copyWith(
                                                        color: appTheme.green))
                                          ])
                                        ])
                                      ]),
                                  Divider(color: appTheme.lightGrey, height: 0)
                                      .marginSymmetric(vertical: 16),
                                  Text("ARRIVAL",
                                      style: AppCss.figtreeM12
                                          .copyWith(color: appTheme.greyText)),
                                  const VSpace(16),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Land",
                                            style: AppCss.figtreeM12.copyWith(
                                                color: appTheme.secondary)),
                                        Row(children: [
                                          Column(
                                            children: [
                                              Text("Scheduled",
                                                  style: AppCss.figtreeRegular12
                                                      .copyWith(
                                                          color: appTheme
                                                              .greyText)),
                                              Text("10:35AM",
                                                  style: AppCss.figtreeM14
                                                      .copyWith(
                                                          color: appTheme
                                                              .secondary)),
                                            ],
                                          ),
                                          const HSpace(12),
                                          Column(children: [
                                            Text("Estimated",
                                                style: AppCss.figtreeRegular12
                                                    .copyWith(
                                                        color:
                                                            appTheme.greyText)),
                                            Text("10:35AM",
                                                style: AppCss.figtreeM14
                                                    .copyWith(
                                                        color: appTheme.green))
                                          ])
                                        ])
                                      ]),
                                  const VSpace(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Gate Arrival",
                                          style: AppCss.figtreeM12.copyWith(
                                              color: appTheme.secondary)),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text("Scheduled",
                                                  style: AppCss.figtreeRegular12
                                                      .copyWith(
                                                          color: appTheme
                                                              .greyText)),
                                              Text("10:45AM",
                                                  style: AppCss.figtreeM14
                                                      .copyWith(
                                                          color: appTheme
                                                              .secondary)),
                                            ],
                                          ),
                                          const HSpace(12),
                                          Column(
                                            children: [
                                              Text("Estimated",
                                                  style: AppCss.figtreeRegular12
                                                      .copyWith(
                                                          color: appTheme
                                                              .greyText)),
                                              Text("10:35AM",
                                                  style: AppCss.figtreeM14
                                                      .copyWith(
                                                          color:
                                                              appTheme.green)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )
                                  .paddingAll(12)
                                  .decorated(
                                      border:
                                          Border.all(color: appTheme.lightGrey),
                                      borderRadius: BorderRadius.circular(8))
                                  .marginSymmetric(horizontal: 24)
                            ],
                          ).paddingSymmetric(vertical: 24)),
                    );
                  },
                ),
              )
          ],
        ).height(MediaQuery.sizeOf(context).height));
      },
    );
  }
}
