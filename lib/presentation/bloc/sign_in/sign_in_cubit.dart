import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:bloc_booking/common_path.dart';
import 'package:bloc_booking/domain/use_cases/login_user_case.dart';

import '../../../models/social_login_class.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  CountryCode? picked;
  TextEditingController controller = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  FocusNode focusNode = FocusNode();
  FlCountryCodePicker? countryPicker;
  CountryCode? countryCode;
  String? formattedNumber, localSaveNumber, verificationCode;
  bool isTextShow = false,
      hasMaxLengthError = false,
      isMobileLogin = true,
      isLoading = false;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  init(context) async {
    await Future.delayed(const Duration(milliseconds: 50));
    dynamic arg = GoRouterState.of(context).extra ?? true;
    isMobileLogin = arg;

    countryPicker = const FlCountryCodePicker();
    countryCode = const CountryCode(
      name: "India",
      code: "IN",
      dialCode: "+91",
    );
    picked = countryCode;
    emit(SignInUpdate());
  }

  phoneTap(context) async {
    // Show the country code picker when tapped.

    picked = await countryPicker!.showPicker(
      context: context,
    );
    // Null check
    if (picked != null) {
      controller.text = "";
      final sortedCountries = CountryManager().countries
        ..sort(
          (final a, final b) => (a.countryName ?? '').compareTo(
            b.countryName ?? '',
          ),
        );

      int index = sortedCountries.indexWhere(
        (element) {
          return element.countryCode == picked!.code;
        },
      );

      formattedNumber = formatNumberSync(
          "${picked!.dialCode}${controller.text}",
          country: sortedCountries[index]);
      controller.text = formattedNumber!;
      countryCode = picked;
      emit(SignInUpdate());
    }

    emit(SignInUpdate());
  }

  onTextBoxValueChange(v) {
    if (countryCode!.nationalSignificantNumber != null) {
      if (controller.text.replaceAll(" ", "").length >=
          countryCode!.nationalSignificantNumber!) {
        controller.text = controller.text.replaceAll(countryCode!.dialCode, "");
      }
      if (v.length == countryCode!.nationalSignificantNumber!) {
        hasMaxLengthError = true;
        final sortedCountries = CountryManager().countries
          ..sort(
            (final a, final b) => (a.countryName ?? '').compareTo(
              b.countryName ?? '',
            ),
          );
        log("sortedCountries :${CountryManager().countries}");
        int index = sortedCountries.indexWhere(
          (element) {
            log("dds :${element.countryCode} || ${picked!.nationalSignificantNumber}");
            return element.countryCode == picked!.code;
          },
        );
        formattedNumber = formatNumberSync(
            "${picked!.dialCode}${controller.text}",
            country: sortedCountries[index]);
        controller.text = formattedNumber!;
        formattedNumber = null;
        emit(SignInUpdate());
      } else {
        hasMaxLengthError = false;
      }

      log("hasMaxLengthError ;$hasMaxLengthError");
      emit(SignInUpdate());
    } else {
      log("controller.text.length :${controller.text.replaceAll(" ", "").length >= 10}");
      if (controller.text.replaceAll(" ", "").length >= 10) {
        controller.text = controller.text.replaceAll(countryCode!.dialCode, "");
      }
      if (controller.text.length == 10) {
        hasMaxLengthError = true;

        final sortedCountries = CountryManager().countries
          ..sort((final a, final b) =>
              (a.countryName ?? '').compareTo(b.countryName ?? ''));
        log("sortedCountries :${CountryManager().countries}");
        int index = sortedCountries.indexWhere((element) {
          log("dds :${element.countryCode} || ${picked!.nationalSignificantNumber}");
          return element.countryCode == picked!.code;
        });
        formattedNumber = formatNumberSync(
            "${picked!.dialCode}${controller.text}",
            country: sortedCountries[index]);
        controller.text = formattedNumber!;
        formattedNumber = null;
        emit(SignInUpdate());
      } else {
        hasMaxLengthError = false;
        emit(SignInUpdate());
      }

      log("hasMaxLengthError ;$hasMaxLengthError");
      emit(SignInUpdate());
    }
  }

  emailTap() {
    isMobileLogin = false;
    emit(SignInUpdate());
  }

  mobileTap() {
    isMobileLogin = true;
    emit(SignInUpdate());
  }

  phoneLogin(context) async {
    if (globalKey.currentState!.validate()) {
      isLoading = true;

      onVerifyCode(context);
    }
  }

  appleLogin(context) async {
    try {
      isLoading = true;
      emit(SignInLoading());
      /*loginUseCase.signInWithGoogle().then((SocialLoginClass? user) {
        log("user!.isSuccess :${user!.isSuccess}");
        if (user.isSuccess == true) {
          isLoading = false;

        } else {
          isLoading = false;
        }
      });*/

      await SocialLoginUseCase()
          .signInWithApple()
          .then((SocialLoginClass? user) {
        log("user!.isSuccess :${user!.isSuccess}");
        if (user.isSuccess == true) {
          isLoading = false;
        } else {
          isLoading = false;
        }
      });
    } catch (e) {
      isLoading = false;

      log("CATCH SIGNIN GOOGLE LOGIN : $e");
    }
  }

  //on verify code
  void onVerifyCode(BuildContext context) {
    verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {}

    verificationFailed(FirebaseAuthException authException) {
      isLoading = false;
    }

    codeSent(String verificationId, [int? forceResendingToken]) async {
      verificationCode = verificationId;
      isLoading = false;

      context.pushNamed(RouteName.otp, extra: {
        "phone": controller.text,
        "dialCode": countryCode!.dialCode,
        "verificationCode": verificationCode,
        "isMobileLogin": isMobileLogin
      });
      /*route.pushNamed(context, RouteName.verifyOtp,
          arg: {"phone": numberController.text, "dialCode": dialCode,"verificationCode":verificationCode});*/
    }

    codeAutoRetrievalTimeout(String verificationId) {
      verificationCode = verificationId;
      isLoading = false;

      log("codeAutoRetrievalTimeout : $verificationCode");
    }

    //   Change country code

    log("message : ${countryCode!.dialCode}${controller.text}");
    firebaseAuth.verifyPhoneNumber(
        phoneNumber: controller.text.replaceAll(" ", ""),
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  //email login
  emailLogin(context) async {
    /* try {
      isLoading = true;

      final social = Provider.of<SocialLoginController>(context, listen: false);
      await social.signInWithEmail(context,emailCtrl.text).then((SocialLoginClass? user) {
        log("user!.isSuccess :${user!.isSuccess}");
        if (user.isSuccess == true) {
          isLoading = false;
          context.pushNamed(RouteName.otp, extra: {
            "isMobileLogin": isMobileLogin,
            "email": emailCtrl.text
          });
        } else {
          isLoading = false;
        }
      });

    } catch (e) {
      isLoading = false;

      log("CATCH SIGNIN GOOGLE LOGIN : $e");
    }*/
  }

  //google login
  googleLogin(BuildContext context) async {
    try {
      isLoading = true;
      emit(SignInLoading());
      await SocialLoginUseCase()
          .signInWithGoogle()
          .then((SocialLoginClass? user) {
        log("user!.isSuccess :${user!.isSuccess}");
        if (user.isSuccess == true) {
          isLoading = false;
          emit(LoginSuccess(user.message));
          context.pushNamed(RouteName.dashboard);
        } else {
          isLoading = false;
          emit(LoginFailed(user.message));
        }
      });
    } catch (e) {
      isLoading = false;
      emit(LoginFailed(e.toString()));
      log("CATCH SIGNIN GOOGLE LOGIN : $e");
    }
  }
}
