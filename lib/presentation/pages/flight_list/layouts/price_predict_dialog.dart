
import 'package:bloc_booking/presentation/bloc/home/home_cubit.dart';

import '../../../../common_path.dart';
import '../../../widgets/common_alert_dialog.dart';


class PricePredictDialog extends StatelessWidget {
  final HomeCubit? home;
  const PricePredictDialog({
    super.key,this.home
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return CommonAlertDialog(
          icon: svgAssets.pricePredict,
          height: 320,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(fonts.pricePredict,
                    style:
                    AppCss.figtreeSB16.textColor(appTheme.black)),
                Row(children: [
                  SvgPicture.asset(svgAssets.info),
                  const HSpace(4),
                  Text(fonts.pricePredictDesc,
                      style: AppCss.figtreeSB12
                          .textColor(appTheme.primary))
                ]).marginOnly(bottom: 16),
                Row(
                  children: [
                    SvgPicture.asset(svgAssets.lineUp),
                    const HSpace(4),
                    RichText(
                      text: TextSpan(
                          text: "${fonts.ourAdvice} ",
                          style: AppCss.figtreeRegular14
                              .textColor(appTheme.secondary),
                          children: [
                            TextSpan(
                                text: fonts.wait,
                                style: AppCss.figtreeSB14
                                    .textColor(appTheme.darkOrange))
                          ]),
                    )
                  ],
                ).paddingAll(12).decorated(
                    color: const Color(0xFFFEF9C3).withValues(alpha:.30),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: appTheme.darkOrange)),
                const VSpace(8),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(svgAssets.info,colorFilter: ColorFilter.mode(appTheme.greyText, BlendMode.srcIn),),
                      const HSpace(4),
                      Expanded(
                        child: Text(fonts.pricePredictInfo,
                            style: AppCss.figtreeRegular12
                                .textColor(appTheme.greyText)),
                      )
                    ]).marginOnly(bottom: 16),

                ButtonCommon(title: fonts.done)
              ])
              .padding(
              top: 25,
              bottom: 12,
              left: 12,
              right: 12)
              .decorated(
              color: appTheme.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: appTheme.secondary.withValues(alpha:.10),
                    offset: const Offset(0, 4),
                    blurRadius: 40)
              ]).marginOnly(bottom: 20));
    });
  }
}
