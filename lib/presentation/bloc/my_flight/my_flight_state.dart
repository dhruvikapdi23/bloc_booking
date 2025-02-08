part of 'my_flight_cubit.dart';

@immutable
sealed class MyFlightState {}

final class MyFlightInitial extends MyFlightState {}



class MyFlightUpdate extends MyFlightState {
  @override
  List<Object?> get props => [];
}