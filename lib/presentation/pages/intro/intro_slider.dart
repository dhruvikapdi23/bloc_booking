import 'package:flutter/material.dart';
import 'package:bloc_booking/core/extensions/textstyle_extensions.dart';
import 'package:bloc_booking/core/extensions/widget_extension.dart';

import '../../../core/extensions/spacing.dart';
import '../../../core/helper/global.dart';
import '../../../core/theme/index.dart';

class IntroSlider extends StatelessWidget {
  final ValueChanged<int>? onPageChanged;
  final int? selectedIndex;
  final PageController? pageController;

  const IntroSlider(
      {super.key, this.onPageChanged, this.selectedIndex, this.pageController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 615,
        child: PageView.builder(
          controller: pageController,
            itemCount: appArray.introData.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              dynamic data = appArray.introData[index];
              return AnimatedBuilder(
                  animation: pageController!,
                  builder: (context, child) => child!,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(height: 430, color: appTheme.bgLight),
                            Align(
                              alignment: index == 2
                                  ? Alignment.topLeft
                                  : Alignment.bottomRight,
                              child: Image.asset(data['image'].toString(),
                                      height: 360,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fill)
                                  .paddingOnly(
                                      left:index ==1 ? 50: index == 2 ? 0 : 10,
                                      right: index == 1 ? 50 : 0),
                            )
                          ],
                        ).height(430),
                        Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              const VSpace(16),
                              Text(data['title'].toString(),
                                  style: AppCss.figtreeB24
                                      .copyWith(color:appTheme.black)),
                              const VSpace(18),
                              Text(data['desc'].toString(),
                                  style: AppCss.figtreeRegular12
                                      .copyWith(color:appTheme.greyText)
                                      .textHeight(1.1))
                            ])
                            .width(MediaQuery.of(context).size.width)
                            .paddingSymmetric(horizontal: 24)
                            .backgroundColor(appTheme.white)
                      ]));
            }));
  }
}
