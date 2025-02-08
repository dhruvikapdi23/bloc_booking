part of 'flight_list_cubit.dart';

@immutable
sealed class FlightListState {}

final class FlightListInitial extends FlightListState {}

class FlightListUpdate extends FlightListState {
  @override
  List<Object?> get props => [];
}