import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinput/pinput.dart';

import '../../../common_path.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  bool hasMaxLengthError = false, isMobileLogin = true;
  String? phoneNumber, email,dialCode,verificationCode;
  final scaffoldKey = GlobalKey();
  OTPTextEditController controller = OTPTextEditController(codeLength: 5);
  late OTPInteractor _otpInteractor;
  String? otpCode;
  int seconds =60;
  double secondV =00.60;
  Timer? timer;

  // Method to format the seconds into minutes and seconds
  String getFormattedTime() {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  Future<void> _initInteractor() async {
    _otpInteractor = OTPInteractor();

    // You can receive your app signature by using this method.
    final appSignature = await _otpInteractor.getAppSignature();

    if (kDebugMode) {
      print('Your app signature: $appSignature');
    }
  }

  defaultTheme(context) {

    final defaultPinTheme = PinTheme(
        textStyle: AppCss.figtreeRegular20.copyWith(color:appTheme.secondary),
        width: 66,
        height: 68,
        decoration: BoxDecoration(
            color: appTheme.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: otpCode != null ? controller.text.length == otpCode!.length
                    ? controller.text == otpCode
                    ? appTheme.green
                    : appTheme.red
                    : appTheme.textBoxBorderGrey: appTheme.textBoxBorderGrey)));
    return defaultPinTheme;
  }

  init(context) async {
    await Future.delayed(const Duration(milliseconds: 50));
    dynamic arg = GoRouterState.of(context).extra ?? true;
    isMobileLogin = arg['isMobileLogin'];
    phoneNumber = arg['phone'];
    dialCode = arg['dialCode'];
    email = arg['email'];
    verificationCode = arg['verificationCode'];

    _initInteractor();
    startTime();
    controller = OTPTextEditController(
      codeLength: 5,
      //ignore: avoid_print
      onCodeReceive: (code) {
        log("onCodeReceive: $code");
        emit(OtpUpdate());
      },
      otpInteractor: _otpInteractor,
    )..startListenUserConsent(
          (code) {
        final exp = RegExp(r'(\d{5})');
        log("sss :$code");
        return exp.stringMatch(code ?? '') ?? '';

      },
      strategies: [],
    );
    emit(OtpUpdate());
  }


  startTime()async{
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (seconds == 0) {
          timer.cancel();
          emit(OtpUpdate());
        } else {
          seconds--;
          emit(OtpUpdate());
        }
      },
    );
    emit(OtpUpdate());
  }

  verifyOtp(context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    log("djhf ");
    if (otpCode == controller.text) {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
          verificationId: verificationCode!, smsCode: controller.text);

      firebaseAuth
          .signInWithCredential(authCredential)
          .then(
            (value)async {
          bool isGranted = await Permission.notification.isGranted;
          if (isGranted) {
            context.pushNamed(RouteName.dashboard);
          } else {
            context.pushNamed(RouteName.notificationPermission);
          }
        },
      )
          .catchError((error) {});

    }
  }
}
