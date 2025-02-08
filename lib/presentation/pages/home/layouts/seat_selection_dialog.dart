import 'package:bloc_booking/presentation/bloc/home/home_cubit.dart';


import '../../../../common_path.dart';
import '../../../widgets/common_alert_dialog.dart';

class SeatSelectionDialog extends StatelessWidget {
final HomeCubit? home;
  const SeatSelectionDialog({super.key, this.home, });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return CommonAlertDialog(
          icon: svgAssets.search,
          height: 400,
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(fonts.selectCabin,
                    style: AppCss.figtreeSB16
                        .textColor(appTheme.black)),
                Row(children: [
                  SvgPicture.asset(svgAssets.info),
                  const HSpace(4),
                  Text(fonts.bookingInstruction,
                      style: AppCss.figtreeSB12
                          .textColor(appTheme.primary))
                ]).marginOnly(bottom: 16),
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 2.5),
                    itemCount: appArray.options.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            home!.selectedIndex = index;

                          },
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      8),
                                  border: Border.all(
                                      color: home!.selectedIndex == index
                                          ? appTheme.primary
                                          : appTheme.bdrClr,
                                      width: 2),
                                  color: home!.selectedIndex == index
                                      ? appTheme.bgLight
                                      : appTheme.bgLight),
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(appArray.options[index],
                                          style: AppCss.figtreeSB12
                                              .textColor(home!.selectedIndex ==
                                              index
                                              ? appTheme.primary
                                              : appTheme
                                              .textBoxBorderGrey)),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(
                                            3),
                                        height: 16,
                                        width: 16,
                                        decoration: BoxDecoration(
                                            color:
                                            home!.selectedIndex == index
                                                ? appTheme.primary
                                                : null,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: home!.selectedIndex ==
                                                    index
                                                    ? appTheme.primary
                                                    : appTheme
                                                    .textBoxBorderGrey)),
                                        child: home!.selectedIndex == index
                                            ? SvgPicture.asset(
                                            'assets/svg/right.svg')
                                            : Container())
                                  ])));
                    }),
                Row(children: [
                  Text("Apply mixed classes",
                      style: AppCss.figtreeSB12
                          .textColor(appTheme.primary))
                      .marginOnly(right: 4),
                  Container(
                      padding: const EdgeInsets.all(3),
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          color: appTheme.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: appTheme.primary)),
                      child: SvgPicture.asset('assets/svg/right.svg'))
                ]).marginSymmetric(vertical: 16),

                ButtonCommon(title: fonts.done)
              ]).padding(top: 25, bottom: 12,left: 12,right: 12)
              .decorated(
              color: appTheme.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: appTheme.secondary.withValues(alpha:.10),
                    offset: const Offset(0, 4),
                    blurRadius: 40)
              ]).marginOnly(bottom:20)
      );
    });
  }
}
