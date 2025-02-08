import 'package:bloc_booking/presentation/bloc/my_flight/my_flight_cubit.dart';

import '../../../common_path.dart';

class BookingSeatPreference extends StatefulWidget {
  const BookingSeatPreference({super.key});

  @override
  State<BookingSeatPreference> createState() => _BookingSeatPreferenceState();
}

class _BookingSeatPreferenceState extends State<BookingSeatPreference> {
  @override
  Widget build(BuildContext context) {
    MyFlightCubit flight = context.read<MyFlightCubit>();
    return BlocConsumer<MyFlightCubit, MyFlightState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: appTheme.bgLight,
          appBar: AppBar(
              centerTitle: true,
              leading: SvgPicture.asset(svgAssets.cancel)
                  .paddingAll(15)
                  .inkWell(onTap: () => context.pop(context)),
              title: Text(fonts.seatPreference,
                  style:
                      AppCss.figtreeSB16.copyWith(color: appTheme.secondary))),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView(padding: const EdgeInsets.all(4), children: [
                Text(fonts.howItWorks,
                    style:
                        AppCss.figtreeSB14.copyWith(color: appTheme.secondary)),
                const VSpace(10),
                ListView.builder(
                    itemCount: appArray.howItWorks.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      dynamic data = appArray.howItWorks[index];
                      return Row(children: [
                        SvgPicture.asset(data['icon']),
                        const HSpace(10),
                        Expanded(
                            child: Text(data['title'],
                                style: AppCss.figtreeRegular12
                                    .copyWith(color: appTheme.black)))
                      ]).paddingOnly(bottom: 10);
                    }),
                const VSpace(14),
                Text(fonts.selectYourPreference,
                    style:
                        AppCss.figtreeSB14.copyWith(color: appTheme.secondary)),
                const VSpace(10),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...appArray.planeFrontMiddleTailOption
                          .asMap()
                          .entries
                          .map((e) {
                        return Stack(alignment: Alignment.center, children: [
                          Column(children: [
                            Image.asset(
                                    flight.selectedPlanLane == e.value['title']
                                        ? e.value['selectedImage']
                                        : e.value['image'],
                                    height: 95,
                                    width: 104)
                                .paddingOnly(bottom: e.key == 2 ? 15 : 0),
                            Text(e.value['title'],
                                style:
                                    flight.selectedPlanLane == e.value['title']
                                        ? AppCss.figtreeSB12
                                            .copyWith(color: appTheme.black)
                                        : AppCss.figtreeRegular12
                                            .copyWith(color: appTheme.black))
                          ]),
                          if (flight.selectedPlanLane == e.value['title'])
                            SvgPicture.asset(svgAssets.circleCheck)
                                .paddingOnly(bottom: 35)
                        ]).inkWell(
                            onTap: () =>
                                flight.selectPlaneLane(e.value['title']));
                      }),
                      /*Column(
                    children: [
                      Image.asset(
                          flight.selectedPlanLane ==
                                  appArray.planeFrontMiddleTailOption[0]
                                      ['title']
                              ? appArray.planeFrontMiddleTailOption[0]
                                  ['selectedImage']
                              : appArray.planeFrontMiddleTailOption[0]['image'],
                          height: 95,
                          width: 104),
                      Text(appArray.planeFrontMiddleTailOption[0]['title'],
                          style: AppCss.figtreeRegular12
                              .copyWith(color: appTheme.black))
                    ],
                  ),
                  Column(children: [
                    Image.asset(
                        flight.selectedPlanLane ==
                                appArray.planeFrontMiddleTailOption[1]['title']
                            ? appArray.planeFrontMiddleTailOption[1]
                                ['selectedImage']
                            : appArray.planeFrontMiddleTailOption[1]['image'],
                        height: 95,
                        width: 104),
                    Text(appArray.planeFrontMiddleTailOption[1]['title'],
                        style: AppCss.figtreeRegular12
                            .copyWith(color: appTheme.black))
                  ]),
                  Column(children: [
                    Image.asset(
                            flight.selectedPlanLane ==
                                    appArray.planeFrontMiddleTailOption[2]
                                        ['title']
                                ? appArray.planeFrontMiddleTailOption[2]
                                    ['selectedImage']
                                : appArray.planeFrontMiddleTailOption[2]
                                    ['image'],
                            height: 95,
                            width: 104)
                        .paddingOnly(bottom: 15),
                    Text(appArray.planeFrontMiddleTailOption[2]['title'],
                        style: AppCss.figtreeRegular12
                            .copyWith(color: appTheme.black))
                  ])*/
                    ]),
                const VSpace(38),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...appArray.seatOption.asMap().entries.map((e) {
                      return Stack(alignment: Alignment.topCenter, children: [
                        Column(children: [
                          Image.asset(
                              flight.seatOption == e.value['title']
                                  ? e.value['selectedImage']
                                  : e.value['image'],
                              height: 95,
                              width: 104),
                          const VSpace(7),
                          Text(e.value['title'],
                              style: flight.seatOption == e.value['title']
                                  ? AppCss.figtreeSB12
                                      .copyWith(color: appTheme.black)
                                  : AppCss.figtreeRegular12
                                      .copyWith(color: appTheme.black))
                        ]),
                        if (flight.seatOption == e.value['title'])
                          SvgPicture.asset(svgAssets.circleCheck,
                                  height: 8, width: 8)
                              .paddingOnly(
                                  top: 13,
                                  left: flight.seatOption == "Aisle" ? 25 : 0,
                                  right: flight.seatOption == "Window" ? 10 : 0)
                      ]).inkWell(
                          onTap: () =>
                              flight.selectSeatOption(e.value['title']));
                    }),
                    /*Column(
                    children: [
                      Image.asset(
                          flight.selectedPlanLane ==
                                  appArray.planeFrontMiddleTailOption[0]
                                      ['title']
                              ? appArray.planeFrontMiddleTailOption[0]
                                  ['selectedImage']
                              : appArray.planeFrontMiddleTailOption[0]['image'],
                          height: 95,
                          width: 104),
                      Text(appArray.planeFrontMiddleTailOption[0]['title'],
                          style: AppCss.figtreeRegular12
                              .copyWith(color: appTheme.black))
                    ],
                  ),
                  Column(children: [
                    Image.asset(
                        flight.selectedPlanLane ==
                                appArray.planeFrontMiddleTailOption[1]['title']
                            ? appArray.planeFrontMiddleTailOption[1]
                                ['selectedImage']
                            : appArray.planeFrontMiddleTailOption[1]['image'],
                        height: 95,
                        width: 104),
                    Text(appArray.planeFrontMiddleTailOption[1]['title'],
                        style: AppCss.figtreeRegular12
                            .copyWith(color: appTheme.black))
                  ]),
                  Column(children: [
                    Image.asset(
                            flight.selectedPlanLane ==
                                    appArray.planeFrontMiddleTailOption[2]
                                        ['title']
                                ? appArray.planeFrontMiddleTailOption[2]
                                    ['selectedImage']
                                : appArray.planeFrontMiddleTailOption[2]
                                    ['image'],
                            height: 95,
                            width: 104)
                        .paddingOnly(bottom: 15),
                    Text(appArray.planeFrontMiddleTailOption[2]['title'],
                        style: AppCss.figtreeRegular12
                            .copyWith(color: appTheme.black))
                  ])*/
                  ],
                )
              ]),
              ButtonCommon(title: fonts.save, margin: 4, radius: 12)
                  .marginOnly(bottom: 4)
            ],
          ),
        );
      },
    );
  }
}
