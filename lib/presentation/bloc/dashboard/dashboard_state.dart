part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {

}

class DashboardSheetOpen extends DashboardState {
  @override
  List<Object?> get props => [];
}

class DashboardSheetClose extends DashboardState {
  @override
  List<Object?> get props => [];
}

class DashboardActivePageIndex extends DashboardState {
  final int index;

  DashboardActivePageIndex(this.index);

  @override
  List<Object> get props => [index];
}

class DashboardUpdate extends DashboardState {
  @override
  List<Object?> get props => [];
}