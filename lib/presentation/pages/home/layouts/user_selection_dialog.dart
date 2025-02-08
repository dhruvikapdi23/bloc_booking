

import 'package:bloc_booking/presentation/bloc/home/home_cubit.dart';

import '../../../../common_path.dart';
import '../../../widgets/common_alert_dialog.dart';
import '../../../widgets/minus_plus_total_layout.dart';

class UserSelectionDialog extends StatelessWidget {
  const UserSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit home = context.read<HomeCubit>();
    return StatefulBuilder(builder: (context, setState) {
      setState;
      return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return CommonAlertDialog(
          icon: svgAssets.user,
          height: 400,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(fonts.selectPassengers,
                    style: AppCss.figtreeSB16
                        .textColor(appTheme.black))
                    .marginSymmetric(horizontal: 12),
                Row(children: [
                  SvgPicture.asset(svgAssets.info),const HSpace(4),

                  Text(fonts.bookingInstruction1,
                      style: AppCss.figtreeSB12
                          .textColor(appTheme.primary))
                ]).marginOnly( left: 12, right: 12),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: appArray.userSelectionOption.length,
                  itemBuilder: (context, index) {
                    dynamic val = appArray.userSelectionOption[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(svgAssets.adult),
                                const HSpace(8),
                                Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(val['title'],
                                          style: AppCss.figtreeSB14
                                              .textColor(appTheme.black)),
                                      Text(val['desc'],
                                          style: AppCss.figtreeRegular12
                                              .textColor(appTheme.greyText)),
                                    ])
                              ],
                            ),
                            MinusPlusTotalLayout(
                              minusTap:  () => home.minusTap(index),
                              plusTap:  () => home.plusTap(index),
                              total: val['total'],
                              isColor: val['title'] == "Infant" &&  val['total'] >0,
                            )
                          ],
                        ),
                        if (val['title'] == "Infant" && val['total'] >= 1)
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("All children under age 2(Infants)",
                                    style: AppCss.figtreeSB12
                                        .textColor(appTheme.black)),
                                const VSpace(5),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Row(children: [
                                          Text("On Lap",
                                              style: AppCss.figtreeSB12
                                                  .textColor(home
                                                  .childrenOption ==
                                                  "On Lap"
                                                  ? appTheme.primary
                                                  : appTheme
                                                  .textBoxBorderGrey)),
                                          const HSpace(5),
                                          Container(
                                              padding:
                                              const EdgeInsets.all(3),
                                              height: 16,
                                              width: 16,
                                              decoration: BoxDecoration(
                                                  color: home.childrenOption ==
                                                      "On Lap"
                                                      ? appTheme.primary
                                                      : null,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: home.childrenOption ==
                                                          "On Lap"
                                                          ? appTheme.primary
                                                          : appTheme
                                                          .textBoxBorderGrey)),
                                              child:
                                              home.childrenOption == "On Lap"
                                                  ? SvgPicture.asset(
                                                  'assets/svg/right.svg')
                                                  : Container())
                                        ]).inkWell(
                                            onTap: () =>
                                                home.childrenOptionSelection(
                                                    "On Lap"))),
                                    Expanded(
                                        child: Row(children: [
                                          Text("On Seat",
                                              style: AppCss.figtreeSB12
                                                  .textColor(home
                                                  .childrenOption ==
                                                  "On Seat"
                                                  ? appTheme.primary
                                                  : appTheme
                                                  .textBoxBorderGrey)),
                                          const HSpace(5),
                                          Container(
                                              padding:
                                              const EdgeInsets.all(3),
                                              height: 16,
                                              width: 16,
                                              decoration: BoxDecoration(
                                                  color: home.childrenOption ==
                                                      "On Seat"
                                                      ? appTheme.primary
                                                      : null,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: home.childrenOption ==
                                                          "On Seat"
                                                          ? appTheme.primary
                                                          : appTheme
                                                          .textBoxBorderGrey)),
                                              child:
                                              home.childrenOption == "On Seat"
                                                  ? SvgPicture.asset(
                                                  'assets/svg/right.svg')
                                                  : Container())
                                        ]).inkWell(
                                            onTap: () =>
                                                home.childrenOptionSelection(
                                                    "On Seat")))
                                  ],
                                )
                              ]).padding(horizontal: 31, top: 12)
                      ],
                    )
                        .paddingSymmetric(
                        horizontal: 12,
                        vertical:
                        index == 2 && index == 2 && val["total"] != 0
                            ? 8
                            : 0)
                        .decorated(
                        color: index == 2 && val["total"] != 0
                            ? appTheme.bgLight
                            : Colors.transparent,
                        border: Border.all(
                            color: index == 2 && val["total"] != 0
                                ? appTheme.bdrClr
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(12))
                        .paddingOnly(
                        left: 4,
                        right: 4,
                        bottom: index !=
                            appArray.userSelectionOption.length - 1
                            ? 12
                            : 0);
                  },
                ),
                const VSpace(16),
                ButtonCommon(title: fonts.done, margin: 12)
              ])
              .padding(top: 24, bottom: 12)
              .decorated(
              color: appTheme.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: appTheme.secondary.withValues(alpha:.10),
                    offset: const Offset(0, 4),
                    blurRadius: 40)
              ])
              .height(375)
              .marginOnly(top: 20));
  },
);
    });
  }
}
