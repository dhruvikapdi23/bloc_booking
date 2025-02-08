part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}


class SignupUpdate extends SignupState {
  @override
  List<Object?> get props => [];
}

class HasErrorTextShow extends SignupState {
  @override
  List<Object> get props => [];
}