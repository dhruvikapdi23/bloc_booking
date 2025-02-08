

import 'package:pinput/pinput.dart';
import '../../../common_path.dart';

class OtpLayout extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final ValueChanged<String>? onCompleted;

  final PinTheme? errorPinTheme, defaultPinTheme, focusedPinTheme,submittedPin;

  const OtpLayout(
      {super.key,
      this.validator,
      this.controller,
      this.onSubmitted,
      this.defaultPinTheme,
      this.errorPinTheme,
      this.focusedPinTheme,this.submittedPin, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: Pinput(
          errorTextStyle: AppCss.figtreeM14.copyWith(color:Colors.red),
            keyboardType: TextInputType.phone,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            length: 5,
            validator: validator,
            controller: controller,

            defaultPinTheme: defaultPinTheme,
            submittedPinTheme: submittedPin,
            onCompleted:onCompleted,
            focusedPinTheme: focusedPinTheme,
            errorPinTheme: errorPinTheme));
  }
}
