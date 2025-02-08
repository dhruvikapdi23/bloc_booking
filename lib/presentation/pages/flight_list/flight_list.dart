
import 'package:intl/intl.dart';
import 'package:bloc_booking/presentation/bloc/flight_list/flight_list_cubit.dart';

import '../../../common_path.dart';
import '../../widgets/common_widget_class.dart';
import 'layouts/flight_card.dart';
import 'layouts/flight_coupons.dart';
import 'layouts/horizontal_date_with_price.dart';


class FlightListInit extends StatelessWidget {
  const FlightListInit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator.get<FlightListCubit>()..initState(context),
      child: const FlightList(),
    );
  }
}


class FlightList extends StatefulWidget {
  const FlightList({super.key});

  @override
  State<FlightList> createState() => _FlightListState();
}

class _FlightListState extends State<FlightList> {
  @override
  void initState() {
    super.initState();
/*    final flightData =
        Provider.of<FlightListController>(context, listen: false);
    flightData.init(context);*/
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    FlightListCubit flight = context.read<FlightListCubit>();

    return BlocConsumer<FlightListCubit, FlightListState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      body: Stack(children: [
        if (flight.isSheetOpen)
          CommonWidgetClass().commonBg(context, appTheme.secondary),
        if (flight.isSheetOpen)
          CommonWidgetClass()
              .commonBg(context, appTheme.secondary.withValues(alpha:.60)),
        flight.depart == null && flight.arrival == null
            ? Container()
            : Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(svgAssets.arrowLeft,
                        colorFilter: ColorFilter.mode(
                            appTheme.black, BlendMode.srcIn))
                        .inkWell(onTap: () => context.pop(context)),
                    Expanded(
                      child:
                      Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Text("Choose flight",
                                style: AppCss.figtreeSB16
                                    .textColor(appTheme.secondary)),
                            const VSpace(4),
                            Text(
                                "${flight.depart['cityCode']} to ${flight.arrival['cityCode']} | ${DateFormat("MMM dd, yyyy").format(flight.fromDate!)} | ${flight.totalTravelers} travelers",
                                style: AppCss.figtreeRegular12
                                    .textColor(appTheme.greyText))
                          ])
                          .paddingOnly(
                          top: flight.isSheetOpen ? 0 : 10)
                          .width(MediaQuery.of(context).size.width),
                    )
                  ],
                )
                    .marginAll(12)
                    .decorated(
                    color: appTheme.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            flight.isSheetOpen ? 12 : 0),
                        topRight: Radius.circular(
                            flight.isSheetOpen ? 12 : 0)))
                    .marginOnly(top: 24),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      const HorizontalDateWithPrice(),
                      const VSpace(10),
                      Column(
                        children: [
                          FlightCoupons(
                              index: flight.currentBannerIndex,
                              onPageChanged: (c, d) =>
                                  flight.onSliderChange(c)),
                          ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics:
                              const NeverScrollableScrollPhysics(),
                              itemCount: appArray.flightList.length,
                              itemBuilder: (c, index) {
                                dynamic data =
                                appArray.flightList[index];
                                return FlightCard(
                                    data: data,
                                    flightEdit: () => flight
                                        .pricePredictTap(context),
                                   /* notifyTap: () =>
                                        notify.notificationBellTap(
                                            context),
                                    onTap: () => flight.flightTap(
                                        context,
                                        data,
                                            () => notify
                                            .notificationBellTap(
                                            context))*/);
                              }),
                        ],
                      ).backgroundColor(appTheme.bgLight),
                      const VSpace(100)
                    ],
                  ),
                )
              ],
            ).height(MediaQuery.of(context).size.height),
            Row(children: [
              Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: 32,
                        width: 32,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appTheme.primary),
                        child: Image.asset(imageAssets.leftRight,
                            height: 24, width: 24)),
                    const HSpace(10),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(fonts.sortBy,
                              style: AppCss.figtreeSB12
                                  .textColor(appTheme.black)),
                          Text(fonts.price,
                              style: AppCss.figtreeRegular8
                                  .textColor(appTheme.greyText))
                        ]),
                    const HSpace(10),
                    SvgPicture.asset(svgAssets.rightArrow1)
                  ])
                  .paddingAll(4)
                  .decorated(
                  color: appTheme.white,
                  boxShadow: [
                    BoxShadow(
                        color: appTheme.secondary.withValues(alpha:.04),
                        offset: const Offset(0, 0),
                        blurRadius: 6,
                        spreadRadius: 6)
                  ],
                  borderRadius: BorderRadius.circular(40))
                  .inkWell(onTap: () => flight.filterTap(context)),
              const HSpace(11),
              Text(fonts.loadMore,
                  style: AppCss.figtreeRegular12
                      .textColor(appTheme.secondary))
                  .paddingSymmetric(
                  vertical: 10, horizontal: 16)
                  .decorated(
                  borderRadius: BorderRadius.circular(8),
                  border:
                  Border.all(color: appTheme.textBoxBorderGrey))
            ])
                .marginOnly(
                bottom: 20,
                left: 15,
                right: 15,
                top: 10)
                .backgroundColor(appTheme.white)
          ],
        )
            .backgroundColor(
            flight.isSheetOpen ? appTheme.trans : appTheme.white)
            .marginOnly(
            left: flight.isSheetOpen ? 10 : 0,
            right: flight.isSheetOpen ? 10 : 0,
            top: flight.isSheetOpen ? 24 : 0)
      ]),
    );
  },
);
  }
}
