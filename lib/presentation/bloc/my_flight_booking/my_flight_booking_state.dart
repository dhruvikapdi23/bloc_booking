part of 'my_flight_booking_cubit.dart';

@immutable
sealed class MyFlightBookingState {}

final class MyFlightBookingInitial extends MyFlightBookingState {}


class MyFlightBookingUpdate extends MyFlightBookingState {
  @override
  List<Object?> get props => [];
}