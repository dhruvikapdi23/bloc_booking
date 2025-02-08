
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_booking/core/theme/app_css.dart';
import 'package:bloc_booking/presentation/bloc/splash/splash_cubit.dart';

import '../../../core/assets/index.dart';
import '../../../injection_container.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator.get<SplashCubit>()..setupAnimations(this, context),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    SplashCubit splashCubit = context.read<SplashCubit>();

    return BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is IsLogo) {
            splashCubit.controller3!.forward();
          }
        },
        builder: (context, state) => Scaffold(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            body: Stack(alignment: Alignment.center, children: [
              Stack(children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 600),
                  right: MediaQuery.of(context).size.width *
                      (splashCubit.isLogo
                          ? 0.34
                          : splashCubit.isSecondText
                              ? 0.40
                              : 0.33),
                  curve: Curves.easeInOut,
                  bottom: MediaQuery.of(context).size.height /
                      (splashCubit.isFirstText ? 1.97 : 2.1),
                  child: Text('Ease travel with',
                      style: AppCss.figtreeRegular14.copyWith(
                          color: Theme.of(context).colorScheme.onSurface)),
                ),
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    left: MediaQuery.of(context).size.width *
                        (splashCubit.isLogo
                            ? 0.4
                            : splashCubit.isSecondText
                                ? 0.33
                                : splashCubit.isFirstText
                                    ? 0.4
                                    : 0.4),
                    bottom: MediaQuery.of(context).size.height /
                        (splashCubit.isFirstText ? 2.2 : 2.3),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (splashCubit.isFirstText)
                            FadeTransition(
                                opacity: splashCubit.opacityAnimation!,
                                child: Text('Pax',
                                    style: AppCss.frauncesSemiBold32.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface))),
                          if (splashCubit.isSecondText)
                            FadeTransition(
                                opacity: splashCubit.opacityAnimation1!,
                                child: Text('pass',
                                    style: AppCss.frauncesSemiBold32.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface)))
                        ]))
              ]),
              if (splashCubit.opacityAnimation3 != null)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  top: MediaQuery.of(context).size.height * 0.48,
                  left: MediaQuery.of(context).size.width /
                      (splashCubit.isLogo ? 3.50 : 2.4),
                  child: FadeTransition(
                    opacity: splashCubit.opacityAnimation3!,
                    child: Image.asset(imageAssets.smallLogo, height: 38),
                  ),
                )
            ])));
  }
}
