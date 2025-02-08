part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}


class SignInLoading extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInUpdate extends SignInState {
  @override
  List<Object?> get props => [];
}


class LoginFailed extends SignInState {
  final String message;

   LoginFailed(this.message);

  @override
  List<Object> get props => [message];
}


class LoginSuccess extends SignInState {
  final String message;

   LoginSuccess(this.message);

  @override
  List<Object> get props => [message];
}