part of 'intro_cubit.dart';

@immutable
sealed class IntroState {}

final class IntroInitial extends IntroState {}

class IntroUpdate extends IntroState {
  @override
  List<Object?> get props => [];
}
