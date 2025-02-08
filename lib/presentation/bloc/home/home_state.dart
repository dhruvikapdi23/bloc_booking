part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeUpdate extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeActiveIndex extends HomeState {
  final int? index;

  HomeActiveIndex(this.index);
  @override
  List<Object?> get props => [index];
}

class HomeChildrenOption extends HomeState {
  final String? option;

  HomeChildrenOption(this.option);
  @override
  List<Object?> get props => [option];
}