// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../../../core/extensions/spacing.dart';

class NoDataWidget extends StatelessWidget {
  final Widget? icon;
  final String? titleText;
  final Widget? titleWidget;
  final String? bodyText;
  final Widget? bodyWidget;
  final bool showIcon;
  final bool showInCenter;

  const NoDataWidget({
    super.key,
    this.icon,
    this.titleText,
    this.titleWidget,
    this.bodyText,
    this.bodyWidget,
    this.showIcon = true,
    this.showInCenter = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: showInCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
         // if (showIcon) icon ?? Image.asset(ImageAssets.empty),
          const VSpace(20),
          titleWidget ??
              Text(
                titleText ?? 'No results found',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
          const VSpace(4),
          bodyWidget ??
              Text(
                bodyText ?? 'pull down ↓ to refresh',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey,
                    ),
                textAlign: TextAlign.center,
              ),
        ],
      ),
    );
  }
}
