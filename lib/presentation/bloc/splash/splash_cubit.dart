import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc_booking/common_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/data_sources/local_data_source.dart';
import '../../../domain/use_cases/login_user_case.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final LoginUseCase loginUseCase;
  final LocalDataSource localDataSource;


  SplashCubit({
    required this.loginUseCase,
    required this.localDataSource,
  }) : super(STInitial());

  // Setup animation controllers and define animations

  bool isFirstText = false, isSecondText = false, isLogo = false;

  // Animation controllers
  AnimationController? controller;
  AnimationController? controller1;
  AnimationController? controller3;

  // Animations
  Animation<Offset>? offsetAnimation;
  Animation<Offset>? offsetAnimation1;
  Animation<Offset>? offsetAnimation3;
  Animation<double>? opacityAnimation;
  Animation<double>? opacityAnimation1;
  Animation<double>? opacityAnimation3;

  void setupAnimations(TickerProvider vsync,context) {
    startAnimationSequence(context);
    controller = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: vsync,
    );

    // Set up offset animation
    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: controller!, curve: Curves.easeInOut));

    // Set up opacity animation
    opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller!, curve: Curves.easeInOut));

    emit(AnimationUpdated(opacity: opacityAnimation!, offset: offsetAnimation!.value));

    // Start the animation
    controller!.forward();

    controller1 =
        AnimationController(duration: const Duration(milliseconds: 2000), vsync: vsync);

    offsetAnimation1 = Tween<Offset>(
        begin: const Offset(1, 0), // Start from the right
        end: const Offset(0, 0) // End at the original position
    )
        .animate(
        CurvedAnimation(parent: controller1!, curve: Curves.easeInOut));

    opacityAnimation1 = Tween<double>(
        begin: 0.0, // Start invisible
        end: 1.0 // Fully visible
    )
        .animate(
        CurvedAnimation(parent: controller1!, curve: Curves.easeInOut));

    controller1!.forward();

    emit(AnimationUpdated1(opacity: opacityAnimation1!, offset: offsetAnimation1!.value));

    controller3 = AnimationController(
        duration: const Duration(seconds: 1), vsync: vsync);

    offsetAnimation3 = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Start outside the screen to the right
      end: const Offset(0.0, 0.0), // End in the center (normal position)
    ).animate(
      CurvedAnimation(parent: controller3!, curve: Curves.easeInOut),
    );
    opacityAnimation3 = Tween<double>(
        begin: 0.0, // Start fully transparent
        end: 1.0 // End fully opaque
    )
        .animate(CurvedAnimation(parent: controller3!, curve: Curves.easeIn));

    emit(LogoAnimation(opacity: opacityAnimation3!, offset: offsetAnimation3!.value));
  }

  // Start the animation sequence and emit states in order
  Future<void> startAnimationSequence(BuildContext context) async {
    controller?.forward();
    controller1?.forward();
    controller3?.forward();

    // Trigger first text animation after 500ms delay
    await Future.delayed(const Duration(milliseconds: 500));
    isFirstText = true;
    emit(IsFirstText());

    // Trigger second text animation after 1500ms delay
    await Future.delayed(const Duration(milliseconds: 900));
    isSecondText = true;
    emit(IsSecondText());

    // Trigger logo animation after 1 second
    await Future.delayed(const Duration(seconds: 1));
    isLogo = true;
    emit(IsLogo());

    // Navigate to the intro screen after another 1 second delay
    await Future.delayed(const Duration(seconds: 1));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isIntro = preferences.getBool(session.isIntro)??false;
    if(isIntro){
      context.goNamed(RouteName.signIn);
    }else {
      context.goNamed(RouteName.intro);
    }
  }

}