part of 'splash_cubit.dart';


abstract class SplashState extends Equatable {
  const SplashState();
}

class STInitial extends SplashState {
  @override
  List<Object?> get props => [];
}

class STLogin extends SplashState {
  @override
  List<Object?> get props => [];
}

class STHome extends SplashState {
  @override
  List<Object?> get props => [];
}

class STIntro extends SplashState {
  @override
  List<Object?> get props => [];
}


class IsFirstText extends SplashState {
  @override
  List<Object> get props => [];
}

class IsSecondText extends SplashState {
  @override
  List<Object> get props => [];
}

class IsLogo extends SplashState {
  @override
  List<Object> get props => [];
}


class AnimationUpdated extends SplashState {
  final Animation<double> opacity;
  final Offset offset;

  const AnimationUpdated({required this.opacity, required this.offset});

  @override
  // TODO: implement props
  List<Object?> get props => [opacity,offset];
}


class AnimationUpdated1 extends SplashState {
  final Animation<double> opacity;
  final Offset offset;

  const AnimationUpdated1({required this.opacity, required this.offset});

  @override
  // TODO: implement props
  List<Object?> get props => [opacity,offset];
}

class LogoAnimation extends SplashState {
  final Animation<double> opacity;
  final Offset offset;

  const LogoAnimation({required this.opacity, required this.offset});

  @override
  // TODO: implement props
  List<Object?> get props => [opacity,offset];
}