
import '../../../common_path.dart';
import '../../../models/my_booking_model.dart';

part 'my_flight_booking_state.dart';

class MyFlightBookingCubit extends Cubit<MyFlightBookingState> {
  MyFlightBookingCubit() : super(MyFlightBookingInitial());
  MyBookingModel? bookingModel;

  initState(context)async{
    await Future.delayed(const Duration(milliseconds: 50));
    dynamic arg = GoRouterState.of(context).extra;
    bookingModel = arg;
    emit(MyFlightBookingUpdate());
  }
}
