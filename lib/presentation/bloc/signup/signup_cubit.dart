import 'dart:developer';

import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

import '../../../common_path.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  CountryCode? picked;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  FlCountryCodePicker? countryPicker;
  CountryCode? countryCode;
  String? formattedNumber, localSaveNumber;
  bool  hasMaxLengthError = false;

  init() {
    countryPicker = const FlCountryCodePicker();
    countryCode = const CountryCode(
      name: "India",
      code: "IN",
      dialCode: "+91",
    );
    picked = countryCode;
    emit(SignupUpdate());
  }

  phoneTap(context) async {
    // Show the country code picker when tapped.

    picked = await countryPicker!.showPicker(
      context: context,
    );
    emit(SignupUpdate());
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
    }
    emit(SignupUpdate());
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
        emit(SignupUpdate());
      } else {
        hasMaxLengthError = false;
        emit(SignupUpdate());
      }

      log("hasMaxLengthError ;$hasMaxLengthError");
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
        emit(SignupUpdate());
      } else {
        hasMaxLengthError = false;
        emit(SignupUpdate());
      }
      emit(SignupUpdate());

      log("hasMaxLengthError ;$hasMaxLengthError");
    }
  }
}
