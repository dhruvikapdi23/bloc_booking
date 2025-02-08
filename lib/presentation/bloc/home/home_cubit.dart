import 'dart:developer';

import 'package:bloc_booking/presentation/bloc/dashboard/dashboard_cubit.dart';


import '../../../common_path.dart';
import '../../pages/home/layouts/date_range_picker.dart';
import '../../pages/home/layouts/search_airport.dart';
import '../../pages/home/layouts/seat_selection_dialog.dart';
import '../../pages/home/layouts/user_selection_dialog.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  PageController? pageController;
  int activePageIndex = 0;
  String selectedValue = appArray.tripOption[0]['title'].toString();
  TextEditingController searchCtrl = TextEditingController();
  TextEditingController fromCtrl = TextEditingController();
  TextEditingController toCtrl = TextEditingController();
  FocusNode searchFocus = FocusNode();
  FocusNode fromFocus = FocusNode();
  FocusNode toFocus = FocusNode();
  DateTime? fromDate, toDate;
  DateTimeRange? dateTimeRange;
  String? childrenOption;
  dynamic arrival, depart;

  List<DateTime>? selectedDateTime;

  void initState() {
    pageController = PageController();
  }

  void onPlaceBidButtonPress() {
    pageController!.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
    emit(HomeUpdate());
  }

  void onBuyNowButtonPress() {
    pageController!.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
    emit(HomeUpdate());
  }

  int selectedIndex = 1;

  pageViewOnChange(context, i) {
    FocusScope.of(context).requestFocus(FocusNode());
    activePageIndex = i;
    emit(HomeActiveIndex(activePageIndex));
  }

  seatTap(context) {
    showGeneralDialog(
        barrierColor: Colors.transparent,
        transitionBuilder: (context1, a1, a2, widget) {
          return ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: FadeTransition(
                  opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                  child: StatefulBuilder(builder: (context, setState) {
                    return const SeatSelectionDialog();
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

  childrenOptionSelection(p0) {
    childrenOption = p0;
    emit(HomeChildrenOption(childrenOption));
  }

  plusTap(index) {
    int val = appArray.userSelectionOption[index]['total'];
    val++;
    appArray.userSelectionOption[index]['total'] = val;
    emit(HomeUpdate());
  }

  minusTap(index) {
    int val = appArray.userSelectionOption[index]['total'];
    if (val >= 1) {
      val--;
    }
    appArray.userSelectionOption[index]['total'] = val;
    emit(HomeUpdate());
  }

  userTap(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.transparent,
        transitionBuilder: (context1, a1, a2, widget) {
          return ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: FadeTransition(
                  opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                  child: StatefulBuilder(builder: (context, setState) {
                    return const UserSelectionDialog();
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

//airport or city select
  airportSelectionTap(BuildContext context, {isFrom = true}) async {
    DashboardCubit dash = context.read<DashboardCubit>();
    dash.isSheetOpen = true;
    Future.delayed(const Duration(milliseconds: 100)).then(
      (value) {
        dash.emit(DashboardSheetOpen());
      },
    );

    showModalBottomSheet<dynamic>(
        useRootNavigator: true,
        barrierColor: Colors.black.withValues(alpha:0.5),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return SearchAirport(
              focusNode: searchFocus,
              controller: searchCtrl,
              title: isFrom ? fonts.from : fonts.to,
              onTap: (p0) {
                if (isFrom) {
                  depart = p0;
                } else {
                  arrival = p0;
                }
                emit(HomeUpdate());
                context.pop(context);
              });
        }).then((c) {
      dash.isSheetOpen = false;
      dash.emit(DashboardSheetClose());

    });
  }

  //depart and return date
  Future pickDateRange(context) async {
    log("INI : $dateTimeRange");
    log("INI : ${DateTime.now().add(const Duration(days: 7))}");
    DateTimeRange? newDate = await showDateRangePicker(
        barrierColor: appTheme.secondary,
        initialDateRange: dateTimeRange,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                    primary: appTheme.secondary,
                    onPrimary: Colors.black, // header text color
                    onSurface: appTheme.secondary),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(foregroundColor: appTheme.white),
                ),
                focusColor: appTheme.white,
                disabledColor: appTheme.secondary,
                datePickerTheme: DatePickerThemeData(
                    weekdayStyle:
                        AppCss.figtreeRegular12.textColor(appTheme.secondary))),
            child: child!,
          );
        },
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 20, DateTime.now().month,
            DateTime.now().day));
    if (newDate != null) {
      fromDate = newDate.start;
      toDate = newDate.end;
      emit(HomeUpdate());
    }
  }

  departAndReturnDateTap(BuildContext context,HomeCubit homeCubit, {isFrom = true}) async {
    DashboardCubit dash = context.read<DashboardCubit>();
    dash.isSheetOpen = true;
    Future.delayed(const Duration(milliseconds: 100)).then(
          (value) {
        dash.emit(DashboardSheetOpen());
      },
    );

    showModalBottomSheet(
        useRootNavigator: true,
        barrierColor: Colors.black.withValues(alpha:0.5),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) =>  DateRangePicker(home:homeCubit)).then((c) {
      dash.isSheetOpen = false;
      dash.emit(DashboardSheetClose());

    });
  }

  searchForFlight(BuildContext context) {
    if ((fromDate != null || toDate != null) &&
        depart != null &&
        arrival != null) {
      int sum = appArray.userSelectionOption.fold(
          0,
          (previousValue, element) =>
              previousValue + int.parse(element['total'].toString()));
      if (childrenOption == "On Seat") {
        sum++;
      }

      context.pushNamed(RouteName.flightList, extra: {
        "fromDate": fromDate,
        "toDate": toDate,
        "depart": depart,
        "arrival": arrival,
        "tripOption": selectedValue,
        "totalTravelers": sum
      });
    }
  }
}
