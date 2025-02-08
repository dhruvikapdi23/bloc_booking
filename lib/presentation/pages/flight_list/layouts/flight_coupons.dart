import 'package:carousel_slider/carousel_slider.dart';
import 'package:coupon_uikit/coupon_uikit.dart';

import '../../../../common_path.dart';

class FlightCoupons extends StatelessWidget {
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final int index;

  const FlightCoupons({super.key, this.onPageChanged, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
                height: 77,
                viewportFraction: 1,
                enlargeCenterPage: false,
                reverse: false,
                onPageChanged: onPageChanged),
            items: appArray.flightBookCoupon.map((i) {
              return Transform.flip(
                  flipX: true,
                  child: CouponCard(
                      height: 77,
                      backgroundColor: const Color(0xFFE9F0FF),
                      curveAxis: Axis.vertical,
                      curvePosition: 50,
                      firstChild: Transform.flip(
                          flipX: true,
                          child: Row(children: [
                            RotatedBox(
                                quarterTurns: -1,
                                child: DottedLine(
                                  dashColor: appTheme.lightGrey,
                                ).paddingSymmetric(horizontal: 15)),
                            Expanded(
                                child: RotatedBox(
                                    quarterTurns: -1,
                                    child: ButtonCommon(
                                      title: fonts.appName,
                                    ).marginOnly(
                                        left: 5, right: 5, top: 13, bottom: 5)))
                          ])),
                      secondChild: Transform.flip(
                          flipX: true,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(imageAssets.couponBg),
                                    const HSpace(8),
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                          Text("Free luggage insurance",
                                              style: AppCss.figtreeSB16
                                                  .textColor(appTheme.primary)),
                                          Text(
                                              "Morem ipsum dolor sit amet, consectetur adipiscing elit.",
                                              style: AppCss.figtreeRegular8
                                                  .textColor(appTheme.primary))
                                        ]))
                                  ])))));
            }).toList()),
        const VSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...appArray.flightBookCoupon.asMap().entries.map(
                  (e) => AnimatedContainer(
                    height: 4,
                    width: index == e.key ? 16 : 4,
                    duration: const Duration(milliseconds: 0),
                    margin: const EdgeInsets.only(right: 4),
                    decoration: index == e.key
                        ? BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(index == e.key ? 50 : 0),
                            color: index == e.key
                                ? appTheme.primary
                                : appTheme.primary.withValues(alpha:.40))
                        : BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == e.key
                                ? appTheme.primary
                                : appTheme.primary.withValues(alpha:.40)),
                  ),
                )
          ],
        ),
      ],
    ).marginAll(12);
  }
}
