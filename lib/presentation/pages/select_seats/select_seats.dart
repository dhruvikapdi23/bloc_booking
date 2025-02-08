import 'package:bloc_booking/presentation/bloc/bags_selection/bags_selection_cubit.dart';
import 'package:bloc_booking/presentation/bloc/flight_list/flight_list_cubit.dart';
import '../../../common_path.dart';
import '../bag_selection/layouts/horizontal_traveler_count.dart';
import 'layouts/seat_list.dart';
import 'layouts/seats_status_option.dart';

class SelectSeats extends StatefulWidget {
  const SelectSeats({super.key});

  @override
  State<SelectSeats> createState() => _SelectSeatsState();
}

class _SelectSeatsState extends State<SelectSeats> {
  @override
  void initState() {
    // TODO: implement initState
    int index = 0;
    for (int i = 0; i < appArray.flightSeatList.length; i++) {
      List seats = appArray.flightSeatList[i]['seats'];

      for (var j in seats) {
        index++;
        j['seatNo'] = index;
      }
      //   appArray.flightSeatList[i]['seats'] = seats;
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlightListCubit flight = context.read<FlightListCubit>();
    BagsSelectionCubit bags = context.read<BagsSelectionCubit>();
    return BlocConsumer<FlightListCubit, FlightListState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: appTheme.bgLight,
            appBar: CommonAppBar(title: fonts.selectSeat),
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                ListView(shrinkWrap: true, children: [
                  HorizontalTravelerCount(
                      selectedIndex: bags.selectedUserIndex,
                      onTap: (p0) => bags.selectUser(p0),
                      totalTravelers: flight.totalTravelers),
                  const VSpace(24),
                  const SeatsStatusOption(),
                  const VSpace(24),
                  Stack(alignment: Alignment.center, children: [
                    Center(
                        child: Image.asset(imageAssets.flightBg,
                            width: 289, fit: BoxFit.fill)),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List<Widget>.generate(
                              appArray.flightSeatList.length, (int index) {
                            dynamic v = appArray.flightSeatList[index];
                            return SeatList(
                              index: index,
                              data: v,
                              selectedSeat: flight.selectedSeat,
                              selectSeatAB: (p0, p1) {
                                if (!flight.selectedSeat.contains(
                                    appArray.flightSeatList[index]['seats'][p0]
                                        ['seatAB'][p1])) {
                                  flight.selectedSeat.add(
                                      appArray.flightSeatList[index]['seats']
                                          [p0]['seatAB'][p1]);
                                } else {
                                  flight.selectedSeat.remove(
                                      appArray.flightSeatList[index]['seats']
                                          [p0]['seatAB'][p1]);
                                }
                                flight.emit(FlightListUpdate());
                              },
                              selectSeatCD: (p0, p1) {
                                if (!flight.selectedSeat.contains(
                                    appArray.flightSeatList[index]['seats'][p0]
                                        ['seatCD'][p1])) {
                                  flight.selectedSeat.add(
                                      appArray.flightSeatList[index]['seats']
                                          [p0]['seatCD'][p1]);
                                } else {
                                  flight.selectedSeat.remove(
                                      appArray.flightSeatList[index]['seats']
                                          [p0]['seatCD'][p1]);
                                }
                                flight.emit(FlightListUpdate());
                              },
                            );
                          })).width(289),
                    )
                  ]).width(289),
                  const VSpace(24),
                ]),
                CommonBottomPriceLayout(
                    buttonText: fonts.next,
                    onTap: () => flight.totalTravelers ==
                            flight.selectedSeat.length
                        ? context.pushNamed(RouteName.flightDetailConfirmation)
                        : null,
                    isTap: flight.totalTravelers == flight.selectedSeat.length
                        ? true
                        : false,
                    text: fonts.skipSelectSeat)
              ],
            ).height(double.infinity));
      },
    );
  }
}


class AppBloc {
  FlightListCubit flightListCubit;
  BagsSelectionCubit bagSelectionCubit;

  AppBloc()
      : flightListCubit = FlightListCubit(),
        bagSelectionCubit = BagsSelectionCubit();

  FlightListCubit get counterBloc => flightListCubit;
  BagsSelectionCubit get evenCounterBloc => bagSelectionCubit;
}