import 'dart:developer';

import 'package:bloc_booking/presentation/bloc/flight_list/flight_list_cubit.dart';

import '../../../../common_path.dart';
import 'flutter_slider_handler.dart';

class FlightFilter extends StatelessWidget {
  const FlightFilter({super.key});

  @override
  Widget build(BuildContext context) {
    FlightListCubit flight = context.read<FlightListCubit>();

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return BlocConsumer<FlightListCubit, FlightListState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: DraggableScrollableSheet(
              initialChildSize: .93,
              maxChildSize: .98,
              minChildSize: 0.3,
              expand: false,
              builder:
                  (BuildContext context1, ScrollController scrollController) {
                return Stack(alignment: Alignment.bottomCenter, children: [
                  ListView(padding: const EdgeInsets.all(24), children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          svgAssets.cancel,
                          height: 24,
                        ).inkWell(onTap: () => context.pop(context)),
                        Text(fonts.sortFilter,
                            style: AppCss.figtreeSB16
                                .textColor(appTheme.secondary)),
                        Text(fonts.clear,
                            style: AppCss.figtreeRegular12
                                .textColor(appTheme.primary)
                                .textDecoration(TextDecoration.underline))
                      ],
                    ),
                    const VSpace(32),
                    Text(
                      fonts.sortBy,
                      style: AppCss.figtreeSB24.textColor(appTheme.secondary),
                    ),
                    const VSpace(24),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio: 4.2),
                        itemCount: appArray.sortByFilter.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                flight.selectedIndex = index;
                                flight.emit(FlightListUpdate());
                              },
                              child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(8),
                                      border: Border.all(
                                          color: flight.selectedIndex == index
                                              ? appTheme.primary
                                              : appTheme.bdrClr,
                                          width: 2),
                                      color: flight.selectedIndex == index
                                          ? appTheme.bgLight
                                          : appTheme.bgLight),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                              appArray.sortByFilter[index],
                                              style: AppCss.figtreeSB12
                                                  .textColor(flight
                                                              .selectedIndex ==
                                                          index
                                                      ? appTheme.primary
                                                      : appTheme
                                                          .textBoxBorderGrey)),
                                        ),
                                        Container(
                                            padding:
                                                const EdgeInsets.all(3),
                                            height: 16,
                                            width: 16,
                                            decoration: BoxDecoration(
                                                color: flight.selectedIndex ==
                                                        index
                                                    ? appTheme.primary
                                                    : null,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: flight
                                                                .selectedIndex ==
                                                            index
                                                        ? appTheme.primary
                                                        : appTheme
                                                            .textBoxBorderGrey)),
                                            child: flight.selectedIndex == index
                                                ? SvgPicture.asset(
                                                    'assets/svg/right.svg')
                                                : Container())
                                      ])));
                        }),
                    const VSpace(32),
                    Text(
                      fonts.filterBy,
                      style: AppCss.figtreeSB24.textColor(appTheme.secondary),
                    ),
                    const VSpace(24),
                    Text(
                      fonts.stops,
                      style: AppCss.figtreeSB16.textColor(appTheme.secondary),
                    ),
                    const VSpace(14),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio: 4.2),
                        itemCount: appArray.filterBy.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                flight.filterByIndex = index;
                                flight.emit(FlightListUpdate());
                              },
                              child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(8),
                                      border: Border.all(
                                          color: flight.filterByIndex == index
                                              ? appTheme.primary
                                              : appTheme.bdrClr,
                                          width: 2),
                                      color: flight.filterByIndex == index
                                          ? appTheme.bgLight
                                          : appTheme.bgLight),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(appArray.filterBy[index],
                                              style: AppCss.figtreeSB12
                                                  .textColor(flight
                                                              .filterByIndex ==
                                                          index
                                                      ? appTheme.primary
                                                      : appTheme
                                                          .textBoxBorderGrey)),
                                        ),
                                        Container(
                                            padding:
                                                const EdgeInsets.all(3),
                                            height: 16,
                                            width: 16,
                                            decoration: BoxDecoration(
                                                color: flight.filterByIndex ==
                                                        index
                                                    ? appTheme.primary
                                                    : null,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: flight
                                                                .filterByIndex ==
                                                            index
                                                        ? appTheme.primary
                                                        : appTheme
                                                            .textBoxBorderGrey)),
                                            child: flight.filterByIndex == index
                                                ? SvgPicture.asset(
                                                    'assets/svg/right.svg')
                                                : Container())
                                      ])));
                        }),
                    Divider(height: 0, color: appTheme.bdrClr)
                        .paddingSymmetric(vertical: 24),
                    Text(fonts.price,
                        style:
                            AppCss.figtreeSB16.textColor(appTheme.secondary)),
                    Text("USD\$${flight.lowerVal} - USD\$${flight.upperVal} ",
                        style: AppCss.figtreeRegular12
                            .textColor(appTheme.secondary)),
                    FlutterSlider(
                      values: [flight.lowerVal, flight.upperVal],
                      rangeSlider: true,
                      tooltip: FlutterSliderTooltip(
                          direction: FlutterSliderTooltipDirection.top,
                          alwaysShowTooltip: false,
                          textStyle:
                              AppCss.figtreeRegular8.textColor(appTheme.trans),
                          boxStyle: FlutterSliderTooltipBox(
                              decoration:
                                  BoxDecoration(color: appTheme.trans))),
                      rightHandler:
                          CustomFlutterSliderHandler().flutterSliderHandler,
                      handler:
                          CustomFlutterSliderHandler().flutterSliderHandler,
                      max: flight.maxPrice,
                      min: flight.minPrice,
                      handlerHeight: 25,
                      trackBar: FlutterSliderTrackBar(
                          activeTrackBarHeight: 4,
                          activeTrackBar:
                              BoxDecoration(color: appTheme.primary),
                          inactiveTrackBarHeight: 4,
                          inactiveDisabledTrackBarColor: appTheme.bdrClr,
                          activeDisabledTrackBarColor: appTheme.trans),
                      step: const FlutterSliderStep(step: 20),
                      jump: true,
                      onDragging: (handlerIndex, lowerValue, upperValue) {
                        flight.lowerVal = lowerValue;
                        flight.upperVal = upperValue;
                        flight.emit(FlightListUpdate());
                        log("LO :$lowerValue || $upperValue");
                      },
                    ),
                    Divider(height: 0, color: appTheme.bdrClr)
                        .paddingOnly(bottom: 24),
                    Text(fonts.times,
                        style:
                            AppCss.figtreeSB16.textColor(appTheme.secondary)),
                    Text(
                        "${flight.timeLowerVal.round()} - ${flight.timeUpperVal.round()} ",
                        style: AppCss.figtreeRegular12
                            .textColor(appTheme.secondary)),
                    FlutterSlider(
                      values: [flight.timeLowerVal, flight.timeUpperVal],
                      rangeSlider: true,
                      tooltip: FlutterSliderTooltip(
                          direction: FlutterSliderTooltipDirection.top,
                          alwaysShowTooltip: false,
                          textStyle:
                              AppCss.figtreeRegular8.textColor(appTheme.trans),
                          boxStyle: FlutterSliderTooltipBox(
                              decoration:
                                  BoxDecoration(color: appTheme.trans))),
                      rightHandler:
                          CustomFlutterSliderHandler().flutterSliderHandler,
                      handler:
                          CustomFlutterSliderHandler().flutterSliderHandler,
                      max: flight.timeMax,
                      min: flight.timeMin,
                      handlerHeight: 25,
                      trackBar: FlutterSliderTrackBar(
                          activeTrackBarHeight: 4,
                          activeTrackBar:
                              BoxDecoration(color: appTheme.primary),
                          inactiveTrackBarHeight: 4,
                          inactiveDisabledTrackBarColor: appTheme.bdrClr,
                          activeDisabledTrackBarColor: appTheme.trans),
                      step: const FlutterSliderStep(step: 20),
                      jump: true,
                      onDragging: (handlerIndex, lowerValue, upperValue) {
                        flight.timeLowerVal = lowerValue;
                        flight.timeUpperVal = upperValue;
                        flight.emit(FlightListUpdate());
                        log("LO :$lowerValue || $upperValue");
                      },
                    ),
                    Divider(height: 0, color: appTheme.bdrClr)
                        .paddingOnly(bottom: 24),
                    Text(fonts.airlines,
                        style:
                            AppCss.figtreeSB16.textColor(appTheme.secondary)),
                    const VSpace(16),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio: 4.2),
                        itemCount: appArray.airLines.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                flight.airLinesIndex = index;
                                flight.emit(FlightListUpdate());
                              },
                              child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(8),
                                      border: Border.all(
                                          color: flight.airLinesIndex == index
                                              ? appTheme.primary
                                              : appTheme.bdrClr,
                                          width: 2),
                                      color: flight.airLinesIndex == index
                                          ? appTheme.bgLight
                                          : appTheme.bgLight),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(appArray.airLines[index],
                                              style: AppCss.figtreeSB12
                                                  .textColor(flight
                                                              .airLinesIndex ==
                                                          index
                                                      ? appTheme.primary
                                                      : appTheme
                                                          .textBoxBorderGrey)),
                                        ),
                                        Container(
                                            padding:
                                                const EdgeInsets.all(3),
                                            height: 16,
                                            width: 16,
                                            decoration: BoxDecoration(
                                                color: flight.airLinesIndex ==
                                                        index
                                                    ? appTheme.primary
                                                    : null,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: flight
                                                                .airLinesIndex ==
                                                            index
                                                        ? appTheme.primary
                                                        : appTheme
                                                            .textBoxBorderGrey)),
                                            child: flight.airLinesIndex == index
                                                ? SvgPicture.asset(
                                                    'assets/svg/right.svg')
                                                : Container())
                                      ])));
                        }),
                  ])
                ]);
              }));
  },
);
    });
  }
}
