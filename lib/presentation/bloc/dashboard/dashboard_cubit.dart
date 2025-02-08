
import '../../../common_path.dart';
import '../../pages/home/home.dart';
import '../../pages/home/layouts/seat_selection_dialog.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());
  PageController? pageController;
  int activePageIndex = 0;
  bool isSheetOpen = false;

  String selectedValue = appArray.tripOption[0]['title'].toString();

  void setPageIndex(int index) {
    activePageIndex = index;
    emit(DashboardActivePageIndex(activePageIndex));
  }

  List<Widget> widget = [const Home(), /*MyFlight(), Setting()*/];



  void initState() {
    pageController = PageController();
  }

  void onPlaceBidButtonPress() {
    pageController!.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
    emit(DashboardUpdate());
  }

  void onBuyNowButtonPress() {
    pageController!.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
    emit(DashboardUpdate());
  }

  int selectedIndex = 1;

  pageViewOnChange(context, i) {
    FocusScope.of(context).requestFocus(FocusNode());
    activePageIndex = i;
    emit(DashboardUpdate());
  }

  seatTap(context) {
    showDialog(
        barrierColor: appTheme.bgLight.withValues(alpha:0.95),
        context: context,
        builder: (context) {
          return const SeatSelectionDialog();
          return Container();
        });
  }
}
