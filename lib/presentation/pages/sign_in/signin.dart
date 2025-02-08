import 'package:flutter/gestures.dart';

import '../../../common_path.dart';
import '../../bloc/sign_in/sign_in_cubit.dart';
import '../../widgets/custom_text_form_field.dart';
import '../sign_up/custom_phone_text_box.dart';
import '../sign_up/social_login_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator.get<SignInCubit>()..init(context),
      child: const SignInView(),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    SignInCubit signIn = context.read<SignInCubit>();
    return BlocConsumer<SignInCubit, SignInState>(
        listener: (context1, state) {
          // TODO: implement listener
          if(state is LoginFailed){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  behavior: SnackBarBehavior.floating,
                ),
              );
          }
        },
      builder: (context1, state) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                leading:
                    SvgPicture.asset(svgAssets.cancel, fit: BoxFit.scaleDown)),
            body: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Stack(children: [
                  ListView(
                    children: [
                      const VSpace(30),
                      Text(fonts.signIn,
                          style: AppCss.figtreeSB26
                              .textColor(appTheme.secondary)
                              .letterSpace(.5)),
                      Text(
                          "Vorem ipsum dolor sit amet, consectetur adipiscing elit.Vorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          style: AppCss.figtreeRegular12
                              .textColor(appTheme.greyText)
                              .textHeight(1.2)
                              .letterSpace(.0)),
                      const VSpace(32),
                      if (signIn.isMobileLogin)
                        if(signIn.countryCode != null)
                        CustomPhoneTextBox(

                            onTap: () => signIn.phoneTap(context),
                            controller: signIn.controller,
                            countryCode: signIn.countryCode,
                            onChanged: (v) => signIn.onTextBoxValueChange(v)),
                      if (signIn.isMobileLogin) const VSpace(8),
                      if (signIn.isMobileLogin)
                        if (signIn.controller.text.isNotEmpty)
                          Row(children: [
                            SvgPicture.asset(
                                signIn.hasMaxLengthError
                                    ? svgAssets.check
                                    : svgAssets.cancel,
                                colorFilter: ColorFilter.mode(
                                    signIn.hasMaxLengthError
                                        ? appTheme.green
                                        : appTheme.red,
                                    BlendMode.srcIn)),
                            Text(
                                signIn.hasMaxLengthError
                                    ? "Phone number correct"
                                    : "Phone number must be ${signIn.countryCode!.nationalSignificantNumber ?? 10} digit",
                                style: AppCss.figtreeRegular12.textColor(
                                    signIn.hasMaxLengthError
                                        ? appTheme.green
                                        : appTheme.red))
                          ]),
                      if (signIn.isMobileLogin) const VSpace(12),
                      if (!signIn.isMobileLogin)
                        CustomTextFormField(hintText: fonts.email),
                      if (!signIn.isMobileLogin) const VSpace(24),
                      CustomButton(
                        text: "Continue",
                        radius: 12,
                        onTap: () {
                         /* if (signIn.isMobileLogin) {
                            context.pushNamed(RouteName.otp, extra: {
                              "isMobileLogin": signIn.isMobileLogin,
                              "phoneNumber": signIn.controller.text
                            });
                          } else {
                            context.pushNamed(RouteName.otp, extra: {
                              "isMobileLogin": signIn.isMobileLogin,
                              "email": signIn.emailCtrl.text
                            });
                          }*/
                          context.pushNamed(RouteName.dashboard);
                        },
                      ),
                      const VSpace(25),
                      Row(children: [
                        Expanded(
                            child: Divider(
                          color: appTheme.lightGrey,
                        )),
                        Text("Other ways to create account",
                                style: AppCss.figtreeRegular12
                                    .textColor(appTheme.greyText))
                            .paddingSymmetric(horizontal: 3),
                        Expanded(child: Divider(color: appTheme.lightGrey))
                      ]),
                      const VSpace(25),
                      signIn.isMobileLogin
                          ? SocialLoginButton(
                              onTap: () => signIn.emailTap(),
                              title: fonts.email,
                              svg: svgAssets.email)
                          : SocialLoginButton(
                              onTap: () => signIn.mobileTap(),
                              title: fonts.phoneNumber,
                              svg: svgAssets.phone),
                      const VSpace(12),
                      SocialLoginButton(
                          title: fonts.apple, svg: svgAssets.apple),
                      const VSpace(12),
                      SocialLoginButton(
                          title: fonts.google, svg: svgAssets.google)
                    ],
                  )
                      .paddingSymmetric(horizontal: 24)
                      .height(MediaQuery.of(context).size.height),
                  if (MediaQuery.of(context).viewInsets.bottom == 0)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        text: TextSpan(
                            text: "${fonts.dontHaveAnAccount} ",
                            style: AppCss.figtreeRegular12
                                .textColor(appTheme.black),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => context.pop(),
                                  text: fonts.createAnAccount,
                                  style: AppCss.figtreeRegular12
                                      .copyWith(color: appTheme.primary)
                                      .textDecoration(TextDecoration.underline))
                            ]),
                      ).padding(bottom: 28),
                    )
                ])));
      },
    );
  }
}
