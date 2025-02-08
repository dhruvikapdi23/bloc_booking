import 'package:bloc_booking/presentation/bloc/my_flight/my_flight_cubit.dart';
import '../../../common_path.dart';
import '../../../models/my_booking_model.dart';
import 'layouts/flight_booking_card.dart';
import 'layouts/my_flight_tab_button.dart';

class MyFlightInit extends StatelessWidget {
  const MyFlightInit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator.get<MyFlightCubit>()..initState(),
      child: const MyFlight(),
    );
  }
}

class MyFlight extends StatelessWidget {
  const MyFlight({super.key});

  @override
  Widget build(BuildContext context) {
    MyFlightCubit myFlightPvr = context.read<MyFlightCubit>();

    return BlocConsumer<MyFlightCubit, MyFlightState>(
        listener: (context, state) => {},
        builder: (_, state) {
          return ListView(children: [
            Container(
                margin: const EdgeInsets.only(bottom: 24),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.center,
                color: appTheme.primary.withValues(alpha:.10),
                height: 48,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        myFlightPvr.bookingList.isEmpty
                            ? SvgPicture.asset(svgAssets.questionIcon)
                            : SvgPicture.asset(svgAssets.info,
                                height: 24, width: 24),
                        const SizedBox(width: 3.5),
                        Text(
                            myFlightPvr.bookingList.isEmpty
                                ? fonts.enterYourTravel
                                : fonts.wantToSpeedUpCheckIn,
                            style: AppCss.figtreeRegular14.textColor(
                                myFlightPvr.bookingList.isEmpty
                                    ? appTheme.alertTextClr
                                    : appTheme.primary))
                      ]),
                      Text(
                              myFlightPvr.bookingList.isEmpty
                                  ? fonts.start
                                  : fonts.enterSeatPreference,
                              style: AppCss.figtreeRegular12
                                  .textColor(myFlightPvr.bookingList.isEmpty
                                      ? appTheme.alertTextClr
                                      : appTheme.primary)
                                  .textDecoration(TextDecoration.underline,
                                      color: myFlightPvr.bookingList.isEmpty
                                          ? appTheme.alertTextClr
                                          : appTheme.primary))
                          .inkWell(onTap: () => myFlightPvr.seatPref(context))
                    ])),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(fonts.myFlight,
                  style: AppCss.figtreeSB28.textColor(appTheme.secondary)),
              TextFieldCommon(
                      controller: myFlightPvr.search,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon:
                          SvgPicture.asset(svgAssets.search, height: 24),
                      hintText: fonts.search)
                  .marginSymmetric(vertical: 16),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: appArray.flightStatus
                          .asMap()
                          .entries
                          .map((e) => MyFlightTabButton(
                              text: e.value,
                              selected: myFlightPvr.selectedIndex != null
                                  ? myFlightPvr.selectedIndex!.toLowerCase() ==
                                      e.value.toLowerCase()
                                  : false,
                              onTap: () =>
                                  myFlightPvr.handleTabChange(e.value)))
                          .toList())),
              const VSpace(16),
              if (myFlightPvr.selectedIndex != null)
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: myFlightPvr.filterList.length,
                    itemBuilder: (context, index) {
                      MyBookingModel booking = myFlightPvr.filterList[index];
                      return FlightBookingCard(
                          bookingModel: booking,
                          onTap: () =>
                              myFlightPvr.bookingTap(booking, context));
                    }),
              /* ...myFlightPvr.bookingList
                  .where((element) =>
                      element.status!.toLowerCase() ==
                      myFlightPvr.selectedIndex!.toLowerCase())
                  .toList()
                  .asMap()
                  .entries
                  .map((e) {
                return FlightBookingCard(bookingModel: e.value,onTap: ()=> myFlightPvr.bookingTap(e.value,context));
              }),*/
              if (myFlightPvr.selectedIndex == null)
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: myFlightPvr.bookingList.length,
                    itemBuilder: (context, index) {
                      return FlightBookingCard(
                          bookingModel: myFlightPvr.bookingList[index],
                          onTap: () => myFlightPvr.bookingTap(
                              myFlightPvr.bookingList[index], context));
                    })
            ]).paddingSymmetric(horizontal: 24),
            if (myFlightPvr.bookingList.isEmpty)
              Column(children: [
                SvgPicture.asset(svgAssets.noFlight),
                Text(fonts.noFlightAdded,
                    style: AppCss.figtreeRegular16
                        .textColor(appTheme.textBoxBorderGrey))
              ]).marginOnly(top: 170).center()
          ]);
        });
  }
}
