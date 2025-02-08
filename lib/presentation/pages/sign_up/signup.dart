import 'package:flutter/gestures.dart';
import 'package:bloc_booking/presentation/bloc/signup/signup_cubit.dart';
import 'package:bloc_booking/presentation/pages/sign_up/social_login_button.dart';
import 'package:bloc_booking/presentation/widgets/custom_text_form_field.dart';
import '../../../common_path.dart';
import 'custom_phone_text_box.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator.get<SignupCubit>()..init(),
      child: const SignupView(),
    );
  }
}

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    SignupCubit signup = context.read<SignupCubit>();
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (_, state) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                leading: SvgPicture.asset(
              svgAssets.cancel,
              fit: BoxFit.scaleDown,
            )),
            body: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Stack(children: [
                  ListView(
                    children: [
                      const VSpace(30),
                      Text(fonts.createAnAccount,
                          style: AppCss.figtreeSB26
                              .copyWith(color: appTheme.secondary)
                              .letterSpace(.5)),
                      Text(
                          "Vorem ipsum dolor sit amet, consectetur adipiscing elit.Vorem ipsum dolor sit amet, consectetur adipiscing elit.",
                          style: AppCss.figtreeRegular12
                              .copyWith(color: appTheme.greyText)
                              .textHeight(1.2)
                              .letterSpace(.0)),
                      const VSpace(32),
                      CustomPhoneTextBox(
                          onTap: () => signup.phoneTap(context),
                          controller: signup.controller,
                          countryCode: signup.countryCode,
                          onChanged: (v) => signup.onTextBoxValueChange(v)
                      ),
                      const VSpace(8),
                      if (signup.controller.text.isNotEmpty)
                        Row(children: [
                          SvgPicture.asset(
                              signup.hasMaxLengthError
                                  ? svgAssets.check
                                  : svgAssets.cancel,
                              colorFilter: ColorFilter.mode(
                                  signup.hasMaxLengthError
                                      ? appTheme.green
                                      : appTheme.red,
                                  BlendMode.srcIn)),
                          Text(
                              signup.hasMaxLengthError
                                  ? "Phone number correct"
                                  : "Phone number must be ${signup.countryCode!.nationalSignificantNumber ?? 10} digit",
                              style: AppCss.figtreeRegular12.copyWith(
                                  color: signup.hasMaxLengthError
                                      ? appTheme.green
                                      : appTheme.red))
                        ]),
                      const VSpace(12),
                      CustomTextFormField(hintText: fonts.email),
                      const VSpace(24),
                      CustomButton(
                        text: fonts.continueWord,
                        radius: 12,
                        onTap: ()=> context.pushNamed(RouteName.dashboard)
                      ),
                      const VSpace(25),
                      Row(children: [
                        Expanded(
                            child: Divider(
                          color: appTheme.lightGrey,
                        )),
                        Text("Other ways to create account",
                                style: AppCss.figtreeRegular12
                                    .copyWith(color: appTheme.greyText))
                            .paddingSymmetric(horizontal: 3),
                        Expanded(child: Divider(color: appTheme.lightGrey))
                      ]),
                      const VSpace(25),
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
                            text: "${fonts.alreadyHaveAnAccount} ",
                            style: AppCss.figtreeRegular12
                                .copyWith(color: appTheme.black),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap = () => context.pushNamed(RouteName.signIn),
                                  text: fonts.signIn,
                                  style: AppCss.figtreeRegular12
                                      .copyWith(color: appTheme.primary))
                            ]),
                      ).padding(bottom: 28),
                    )
                ])));
      },
    );
  }
}
