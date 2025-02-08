
import 'package:bloc_booking/presentation/bloc/dashboard/dashboard_cubit.dart';

import '../../../common_path.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator.get<DashboardCubit>()..initState(),
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardCubit dash = context.read<DashboardCubit>();
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context1, state) {
        // TODO: implement listener
      },
      builder: (context, state) {


        return Stack(children: [
          Container(
              color: appTheme.secondary,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
          Container(
              color: appTheme.secondary.withValues(alpha:.60),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
          Scaffold(
                  backgroundColor:
                  state is DashboardSheetOpen ? Colors.transparent : Colors.white,
                  appBar: AppBar(
                      backgroundColor: appTheme.white,
                      toolbarHeight: 72,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      centerTitle: false,
                      titleSpacing: 0,
                      automaticallyImplyLeading: false,
                      title: Column(children: [
                        Text("Welcome back,",
                            style: AppCss.figtreeRegular12
                                .textColor(appTheme.greyText)),
                        Text("Eren Fleming",
                            style: AppCss.figtreeRegular14
                                .textColor(appTheme.secondary))
                      ]).paddingSymmetric(horizontal: 24),
                      actions: [
                        SvgPicture.asset(svgAssets.bell)
                            .paddingAll(8)
                            .decorated(
                                border: Border.all(
                                    color: appTheme.textBoxBorderGrey),
                                borderRadius: BorderRadius.circular(12))
                            .inkWell(onTap: () {
                          context.pushNamed(RouteName.notificationScreen);
                        }),
                        const HSpace(24)
                      ]),
                  body: dash.widget[dash.activePageIndex],
                  bottomNavigationBar: BottomNavigationBar(
                      enableFeedback: false,
                      currentIndex: dash.activePageIndex,
                      onTap: (index) {
                        dash.setPageIndex(index);
                      },
                      type: BottomNavigationBarType.fixed,
                      selectedLabelStyle: AppCss.figtreeRegular12,
                      unselectedLabelStyle: AppCss.figtreeRegular12,
                      selectedItemColor: appTheme.secondary,
                      unselectedItemColor: appTheme.greyText,
                      items: [
                        BottomNavigationBarItem(
                            activeIcon: SvgPicture.asset(svgAssets.home1),
                            icon: SvgPicture.asset(svgAssets.home),
                            label: 'Home'),
                        BottomNavigationBarItem(
                            activeIcon: SvgPicture.asset(svgAssets.ticket1),
                            icon: SvgPicture.asset(svgAssets.ticket),
                            label: 'My Flight'),
                        BottomNavigationBarItem(
                            icon: SvgPicture.asset(svgAssets.setting),
                            label: 'Settings')
                      ]))
              .borderRadius(topLeft: 8, topRight: 8)
              .paddingOnly(
                  left: state is DashboardSheetOpen ? 10 : 0,
                  right: state is DashboardSheetOpen ? 10 : 0,
                  top: state is DashboardSheetOpen ? 50 : 0)
        ]);
      },
    );
  }
}

PopupMenuItem buildPopupMenuItem(context, list,
    {position, bool icon = false, data, index}) {
  return PopupMenuItem(
      value: position,
      onTap: () {},
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      height: 20,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data['title'],
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppCss.figtreeRegular12.textColor(appTheme.black))
                .alignment(Alignment.centerLeft),
            if (index != list.length - 1)
              Divider(height: 1, color: appTheme.lightGrey, thickness: 1)
                  .paddingSymmetric(vertical: 10)
          ]));
}
