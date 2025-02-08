import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../common_path.dart';

class FlightCard extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap, flightEdit, notifyTap;

  const FlightCard(
      {super.key, this.data, this.onTap, this.flightEdit, this.notifyTap});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.38,
          children: [
            CustomSlidableAction(
                // An action can be bigger than the others.

                onPressed: (c) {},
                backgroundColor: appTheme.trans,
                foregroundColor: appTheme.trans,
                padding: EdgeInsets.zero,
                flex: 1,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HSpace(10),
                      CommonColumnIconText(
                          icon: svgAssets.pricePredict,
                          text: fonts.predict,
                          bgColor: appTheme.white,
                          iconColor: appTheme.primary,
                          onTap: flightEdit),
                      CommonColumnIconText(
                        icon: svgAssets.bell,
                        text: fonts.alert,
                        bgColor: appTheme.primary,
                        iconColor: appTheme.white,
                        onTap: notifyTap,
                      ).paddingSymmetric(horizontal: 10),
                      CommonColumnIconText(
                          icon: svgAssets.share,
                          text: fonts.share,
                          bgColor: appTheme.secondary,
                          iconColor: appTheme.white)
                    ]))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(data['airlines'], height: 18).paddingOnly(top: 7),
              const HSpace(8),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['departTime'],
                            style: AppCss.figtreeSB16
                                .textColor(appTheme.secondary)),
                        Text(data['depart'],
                            style: AppCss.figtreeRegular8
                                .textColor(appTheme.secondary))
                      ]),
                  Divider(color: appTheme.textBoxBorderGrey, height: 0)
                      .width(17)
                      .marginSymmetric(horizontal: 5, vertical: 12),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['arrivalTime'],
                            style: AppCss.figtreeSB16
                                .textColor(appTheme.secondary)),
                        Text(data['arrival'],
                            style: AppCss.figtreeRegular8
                                .textColor(appTheme.secondary))
                      ])
                ]),
                const VSpace(5),
                IntrinsicHeight(
                    child: Row(children: [
                  Text(data['hours'],
                      style:
                          AppCss.figtreeRegular8.textColor(appTheme.greyText)),
                  VerticalDivider(color: appTheme.greyText),
                  Text(
                      data['totalStops'] == 0
                          ? "Non-stop"
                          : data['totalStops'] == 1
                              ? "${data['totalStops']} stop"
                              : "${data['totalStops']} stops",
                      style:
                          AppCss.figtreeRegular8.textColor(appTheme.greyText))
                ]))
              ])
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("+USD\$${data['price']}",
                  style: AppCss.figtreeSB16.textColor(appTheme.primary)),
              Text(fonts.perTraveler,
                  style: AppCss.figtreeRegular8.textColor(appTheme.greyText))
            ],
          )
        ],
      )
          .paddingAll(12)
          .decorated(
              color: appTheme.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: appTheme.bdrClr))
          .marginSymmetric(horizontal: 8, vertical: 4)
          .inkWell(onTap: onTap),
    );
  }
}
