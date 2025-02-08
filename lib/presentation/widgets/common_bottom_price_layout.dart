

import '../../common_path.dart';

class CommonBottomPriceLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? text,buttonText;
  final bool isTap;
  const CommonBottomPriceLayout({super.key, this.onTap, this.text, this.isTap=true, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return          Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "${fonts.tripTotal} ",
                              style: AppCss.figtreeSB16
                                  .textColor(appTheme.secondary),
                              children: [
                                TextSpan(
                                    text: "(${fonts.includeTax})",
                                    style: AppCss.figtreeRegular12
                                        .textColor(appTheme.greyText))
                              ]),
                        ),
                        Text("USD\$235.00",
                            style: AppCss.figtreeSB20
                                .textColor(appTheme.primary))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ButtonCommon(
                            title: buttonText!,
                            style: AppCss.figtreeRegular14
                                .textColor(isTap?appTheme.white:appTheme.textBoxBorderGrey),
                            width: 79,
                            color:isTap? appTheme.primary:appTheme.bgLight,
                            onTap:onTap,
                            radius: 12),
                      ])
                ]),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(fonts.viewPriceSummary,
                      style: AppCss.figtreeRegular12
                          .textColor(appTheme.greyText)
                          .textDecoration(TextDecoration.underline)),
                  if(text != null)
                  Text(text!,
                      style: AppCss.figtreeRegular12
                          .textColor(appTheme.greyText)
                          .textDecoration(
                          TextDecoration.underline))
                     /* .inkWell(
                      onTap: () => context
                          .pushNamed(routeName.travelerInfo))*/
                ])
          ],
        ).paddingAll(24).decorated(
            color: appTheme.white,
            border: Border(top: BorderSide(color: appTheme.bdrClr))));
  }
}
