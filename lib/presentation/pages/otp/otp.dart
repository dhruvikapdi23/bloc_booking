
import 'package:bloc_booking/presentation/bloc/otp/otp_cubit.dart';
import 'package:pinput/pinput.dart';

import '../../../common_path.dart';
import 'otp_layout.dart';


class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator.get<OtpCubit>()..init(context),
      child: const OtpView(),
    );
  }
}


class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  @override
  Widget build(BuildContext context) {
    OtpCubit otp = context.read<OtpCubit>();
    return BlocBuilder<OtpCubit, OtpState>(
  builder: (context, state) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            leading:
            SvgPicture.asset(svgAssets.arrowLeft, fit: BoxFit.scaleDown)
                .inkWell(onTap: () => context.pop())),
        body: ListView(
          children: [
            const VSpace(30),
            Text(
                fonts.verifyPhoneEmail(otp.isMobileLogin
                    ? fonts.phoneNumber
                    : fonts.email),
                style: AppCss.figtreeSB26
                    .copyWith(color:appTheme.secondary)
                    .letterSpace(.5)),
            Text(
                "Verification .number sent to ${otp.isMobileLogin ? otp.phoneNumber : otp.email}",
                style: AppCss.figtreeRegular12
                    .copyWith(color:appTheme.greyText)
                    .textHeight(1.2)
                    .letterSpace(.0)),
            const VSpace(32),
            OtpLayout(
                controller: otp.controller,
                onCompleted: (value)=> otp.verifyOtp(context),
                onSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(FocusNode()),
                defaultPinTheme: otp.defaultTheme(context),
                submittedPin: otp.defaultTheme(context),
                errorPinTheme: otp.defaultTheme(context).copyWith(
                    decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha:0.1),
                        borderRadius: BorderRadius.circular(8))),
                focusedPinTheme: otp.defaultTheme(context).copyWith(
                    height: 68.00,
                    width: 66.00,
                    decoration: otp
                        .defaultTheme(context)
                        .decoration!
                        .copyWith(
                        color: appTheme.white,
                        border: Border.all(color: appTheme.primary)))),
            if (otp.otpCode != null && (otp.controller.text != otp.otpCode))
              const VSpace(10),
            if (otp.controller.text.isNotEmpty)
              if (otp.controller.length == otp.otpCode!.length &&
                  otp.controller.text != otp.otpCode)
                Row(children: [
                  SvgPicture.asset(svgAssets.cancel,
                      colorFilter:
                      ColorFilter.mode(appTheme.red, BlendMode.srcIn)),
                  Text("Incorrect verification code",
                      style: AppCss.figtreeRegular12.copyWith(color:appTheme.red))
                ]),
            const VSpace(14),
            RichText(
              text: TextSpan(
                  text: "${fonts.resendCode} ",
                  style: AppCss.figtreeRegular12.copyWith(color:appTheme.greyText),
                  children: [
                    TextSpan(
                        text: otp.getFormattedTime(),
                        style:
                        AppCss.figtreeRegular12.copyWith(color:appTheme.black))
                  ]),
            )
          ],
        )
            .paddingSymmetric(horizontal: 24)
            .height(MediaQuery.of(context).size.height));
  },
);
  }
}
