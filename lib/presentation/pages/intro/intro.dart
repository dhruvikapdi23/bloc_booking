import 'package:bloc_booking/presentation/bloc/intro/intro_cubit.dart';
import '../../../common_path.dart';
import 'dot_indicator.dart';
import 'intro_slider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator.get<IntroCubit>(),
      child: const IntroView(),
    );
  }
}

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    IntroCubit introCubit = context.read<IntroCubit>();

    return BlocConsumer<IntroCubit, IntroState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar:
                AppBar(backgroundColor: appTheme.bgLight, toolbarHeight: 20),
            body: ListView(children: [
              IntroSlider(
                  pageController: introCubit.pageController,
                  onPageChanged: (value) => introCubit.onPageChange(value)),
              DotIndicator(selectedIndex: introCubit.selectedIndex),
              const VSpace(48),
              CustomButton(
                      text: fonts.continueWord,
                      onTap: () => introCubit.onContinueButton(context),
                      textStyle: AppCss.figtreeRegular14
                          .copyWith(color: appTheme.white))
                  .marginSymmetric(horizontal: 24),
              const VSpace(15),
              Text(fonts.skip,
                      style: AppCss.figtreeRegular12.copyWith(
                          color: appTheme.secondary,
                          decoration: TextDecoration.underline))
                  .alignment(Alignment.center)
                  .inkWell(onTap: () => introCubit.onSkipTap(context)),
              const VSpace(15)
            ]));
      },
    );
  }
}
