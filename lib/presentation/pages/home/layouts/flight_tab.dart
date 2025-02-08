import 'package:bloc_booking/presentation/bloc/home/home_cubit.dart';
import 'package:bloc_booking/presentation/pages/home/layouts/trip_selection_drop_down.dart';

import '../../../../common_path.dart';

import 'cities_selection_layout.dart';
import 'date_selection.dart';

class FlightTab extends StatelessWidget {
  const FlightTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit dash = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (_, state) {
        return Column(
          children: [
            const VSpace(16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TripSelectionDropDown(
                selectedValue: dash.selectedValue,
                onTap: (d) {
                  dash.selectedValue = d;
                  dash.emit(HomeUpdate()); //  dash.notifyListeners();
                },
              ),
              Row(
                children: [
                  SvgPicture.asset(svgAssets.seat)
                      .paddingAll(6)
                      .decorated(
                          border: Border.all(color: appTheme.textBoxBorderGrey),
                          borderRadius: BorderRadius.circular(8))
                      .inkWell(onTap: () => dash.seatTap(context)),
                  const HSpace(4),
                  SvgPicture.asset(svgAssets.user)
                      .paddingAll(6)
                      .decorated(
                          border: Border.all(color: appTheme.textBoxBorderGrey),
                          borderRadius: BorderRadius.circular(8))
                      .inkWell(onTap: () => dash.userTap(context))
                ],
              )
            ]),
            const VSpace(16),
            Stack(alignment: Alignment.center, children: [
              IntrinsicHeight(
                child: Row(children: [
                  Expanded(
                      child: CitiesSelectionLayout(
                          title: fonts.from,
                          cityName: dash.depart != null
                              ? dash.depart['cityName']
                              : "Where",
                          airportName: dash.depart != null
                              ? dash.depart['airportName']
                              : null,
                          onTap: () => dash.airportSelectionTap(context))),
                  const SizedBox(width: 4),
                  Expanded(
                      child: CitiesSelectionLayout(
                          title: fonts.to,
                          cityName: dash.arrival != null
                              ? dash.arrival['cityName']
                              : "Where",
                          airportName: dash.arrival != null
                              ? dash.arrival['airportName']
                              : null,
                          onTap: () =>
                              dash.airportSelectionTap(context, isFrom: false)))
                ]),
              ),
              Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: appTheme.secondary),
                  child: dash.selectedValue == "Round trip"
                      ? Image.asset(imageAssets.leftRight,
                          height: 24, width: 24)
                      : SvgPicture.asset(svgAssets.arrowRight,
                          colorFilter: ColorFilter.mode(
                              appTheme.white, BlendMode.srcIn)))
            ]),
            const SizedBox(height: 4),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: DateSelection(
                    title: fonts.depart,
                    dateTime: dash.fromDate,
                    onTap: () => dash.departAndReturnDateTap(context, dash),
                  )),
                  Expanded(
                      child: DateSelection(
                          title: fonts.returnText,
                          dateTime: dash.toDate,
                          onTap: () =>
                              dash.departAndReturnDateTap(context, dash)))
                ]).paddingOnly(bottom: 16),
            ButtonCommon(
              title: fonts.search,
              onTap: () => dash.searchForFlight(context),
            ),
            const VSpace(16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageAssets.couponCard),
                      fit: BoxFit.fill)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text:
                                      "${fonts.appName.toUpperCase()[0] + fonts.appName.toLowerCase().substring(1)} ",
                                  style: AppCss.figtreeSB16
                                      .textColor(appTheme.secondary),
                                  children: [
                                TextSpan(
                                    text: fonts.benefits,
                                    style: AppCss.figtreeRegular16
                                        .textColor(appTheme.greyText))
                              ])),
                          SvgPicture.asset(svgAssets.info,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                      appTheme.secondary, BlendMode.srcIn))
                              .paddingOnly(right: 40)
                        ],
                      ),
                      const VSpace(8),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: appArray.couponBenefits.length,
                          itemBuilder: (context, index) => Row(
                                children: [
                                  SvgPicture.asset(svgAssets.check,
                                      height: 24,
                                      width: 24,
                                      colorFilter: ColorFilter.mode(
                                          appTheme.green, BlendMode.srcIn)),
                                  Text(appArray.couponBenefits[index],
                                      style: AppCss.figtreeRegular12
                                          .textColor(appTheme.black))
                                ],
                              ))
                    ],
                  )),
                  RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        "Free of charge".toUpperCase(),
                        style: AppCss.figtreeSB16.textColor(appTheme.greyText),
                      ))
                ],
              ),
            )
          ],
        );
      },
    ).paddingSymmetric(horizontal: 24);
  }
}
