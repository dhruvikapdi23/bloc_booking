import 'dart:developer';

import 'package:table_calendar/table_calendar.dart';

import '../../../common_path.dart';
import '../../pages/flight_list/layouts/flight_filter.dart';
import '../../pages/flight_list/layouts/price_predict_dialog.dart';

part 'flight_list_state.dart';

class FlightListCubit extends Cubit<FlightListState> {
  FlightListCubit() : super(FlightListInitial());

  initState(context){}

  DateTime? fromDate, toDate;
  int totalTravelers = 0, currentBannerIndex = 0;
  int? selectedIndex, filterByIndex, airLinesIndex;
  dynamic depart, arrival, tripOption;
  CalendarFormat calendarFormat = CalendarFormat.week;
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
  DateTime? selectedDays;
  DateTime? selectedDay;
  PageController pageController = PageController();
  DateTime focusDay = DateTime.now();
  bool isSheetOpen = false, isAlert = true;
  double maxPrice = 500, minPrice = 0, lowerVal = 30, upperVal = 420;
  double timeMax = 24, timeMin = 0, timeLowerVal = 0, timeUpperVal = 16;
  List userListData =[],selectedSeat=[];


  onPageCtrl(dayFocused) {
    focusedDay.value = dayFocused;

    emit(FlightListUpdate());
  }

  onCalendarCreate(controller) {
    log("controller : $controller");
    pageController = controller;
  }

  void onDaySelected(DateTime selectDay, DateTime fDay, context) async {
    log("SSSS :$selectDay // $fDay");
    emit(FlightListUpdate());
    /*focusedDay.value = selectDay;*/
    if (!isSameDay(selectedDay, selectDay)) {
      // Call `setState()` when updating the selected day
      selectedDay = selectDay;
      focusedDay.value = fDay;
    }
  }

  init(BuildContext context)async {
    await Future.delayed(const Duration(milliseconds: 50));
    dynamic data = GoRouterState.of(context).extra;
    log("data ;$data");
    if (data != null) {
      fromDate = data['fromDate'];
      toDate = data['toDate'];
      totalTravelers = data['totalTravelers'];
      tripOption = data['tripOption'];
      depart = data['depart'];
      arrival = data['arrival'];
      //emit(FlightListUpdate()
}
    userListData =[];
    for(int i =0; i<totalTravelers;i++){
      var user ={
        "totalBags":0,
        "totalLuggage":0,
        "userData":{},
        "flightFare":{}
      };

      userListData.add(user);
    }
    emit(FlightListUpdate());
    log("USERDATA :$userListData");
  }

  onSliderChange(index) {
    currentBannerIndex = index;
    emit(FlightListUpdate());
  }

  filterTap(BuildContext context) async {
    isSheetOpen = true;

    showModalBottomSheet(
        useRootNavigator: true,
        barrierColor: Colors.black.withValues(alpha:0.5),
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        builder: (BuildContext bc) => const FlightFilter()).then((c) {
      isSheetOpen = false;
      emit(FlightListUpdate());
    });
  }

  pricePredictTap(context) {
    showGeneralDialog(
        barrierColor: Colors.transparent,
        transitionBuilder: (context1, a1, a2, widget) {
          return ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: FadeTransition(
                  opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                  child: StatefulBuilder(builder: (context, setState) {
                    return const PricePredictDialog();
                  })));
        },
        transitionDuration: const Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });
  }

  flightTap(BuildContext context, data, GestureTapCallback onTap) async {
   /* isSheetOpen = true;
    showModalBottomSheet(
        useRootNavigator: true,
        barrierColor: Colors.black.withValues(alpha:0.5),
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        builder: (BuildContext bc) => NotificationDetailSheet(
            data: data,
            onTap: onTap,
            selectFlightTap: ()=> context.pushNamed(RouteName.priceFareSelection)
        )).then((c) {
      isSheetOpen = false;
      emit(FlightListUpdate());
    });*/
  }
}
