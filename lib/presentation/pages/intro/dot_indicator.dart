import 'package:flutter/material.dart';

import '../../../core/helper/global.dart';
import '../../../core/theme/index.dart';

class DotIndicator extends StatelessWidget {
  final int? selectedIndex;
  const DotIndicator({super.key, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: appArray.introData
            .asMap()
            .entries
            .map((e) => Row(children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
              height:
              selectedIndex == e.key ? 8 : 6,
              width: selectedIndex == e.key ? 8 : 6,
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedIndex == e.key
                      ? appTheme.primary
                      : appTheme.lightGrey))
        ]))
            .toList());
  }
}
