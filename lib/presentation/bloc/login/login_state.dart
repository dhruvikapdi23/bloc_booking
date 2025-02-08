part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final String value;

  const LoginSuccess(this.value);

  @override
  List<Object> get props => [value];
}

class LoginToOtp extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailed extends LoginState {
  final String message;

  const LoginFailed(this.message);

  @override
  List<Object> get props => [message];
}

class LoginUpdate extends LoginState {
  final DateTime dateTime;

  const LoginUpdate(this.dateTime);

  @override
  List<Object> get props => [dateTime];
}
