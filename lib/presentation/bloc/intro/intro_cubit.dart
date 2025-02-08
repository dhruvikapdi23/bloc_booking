import 'package:bloc_booking/common_path.dart';


part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroInitial());

  int selectedIndex = 0;
  PageController pageController = PageController();

  //on page change
  onPageChange(index) {
    selectedIndex = index;
    emit(IntroUpdate());
  }

  // on tap continue button
  onContinueButton(context) {
    if (selectedIndex == 2) {
      context.goNamed(RouteName.signIn);
      PreferencesHelper.setBoolValue(session.isIntro, true);
    } else {
      selectedIndex++;
      pageController.jumpToPage(selectedIndex);
    }
    emit(IntroUpdate());
  }

  //on tap skip button
  onSkipTap(BuildContext context) {
    context.goNamed(RouteName.signup);
    PreferencesHelper.setBoolValue(session.isIntro, true);
  }
}
