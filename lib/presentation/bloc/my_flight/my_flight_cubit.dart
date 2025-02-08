

import '../../../common_path.dart';
import '../../../models/my_booking_model.dart';

part 'my_flight_state.dart';

class MyFlightCubit extends Cubit<MyFlightState> {
  MyFlightCubit() : super(MyFlightInitial());
  String? selectedIndex,selectedPlanLane,seatOption;
  List<MyBookingModel> bookingList = [],filterList=[];

  TextEditingController search = TextEditingController();

  initState()async{
    await Future.delayed(const Duration(milliseconds: 50));
    bookingList = appArray.myFlightBooking
        .map((e) => MyBookingModel.fromJson(e))
        .toList();
    emit(MyFlightUpdate());
  }


  selectPlaneLane(title) {
    selectedPlanLane = title;
    emit(MyFlightUpdate());
  }

  selectSeatOption(title) {
    seatOption = title;
    emit(MyFlightUpdate());
  }

  handleTabChange(title) {
    selectedIndex = title;
    filterList = bookingList.where((element) =>
    element.status!.toLowerCase() ==
        selectedIndex!.toLowerCase())
        .toList();
    emit(MyFlightUpdate());
  }

  onInit() async {
    await Future.delayed(const Duration(milliseconds: 50));
    bookingList = appArray.myFlightBooking
        .map((e) => MyBookingModel.fromJson(e))
        .toList();
    emit(MyFlightUpdate());
  }

  seatPref(BuildContext context){
    if(bookingList.isNotEmpty) {
      context.pushNamed(RouteName.bookingSeatPreference);
    }
  }

  bookingTap(MyBookingModel booking, BuildContext context) {
    context.pushNamed(RouteName.bookingDetail,extra: booking);
  }
}
