part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}

class OtpUpdate extends OtpState {
  @override
  List<Object?> get props => [];
}