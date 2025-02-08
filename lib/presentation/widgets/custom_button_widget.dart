import 'package:flutter/material.dart';

import '../../core/extensions/spacing.dart';
import '../../core/theme/app_css.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final double height;
  final double radius;
  final double? width;
  final String? text;
  final Color? color;
  final Color? color1;
  final Color? textColor;
  final double? textSize;
  final TextStyle? textStyle;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomButton({
    super.key,
    this.onTap,
    this.height = 40.0,
    this.radius = 8,
    this.width,
    this.text,
    this.color,
    this.color1,
    this.textColor,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.textSize,
    this.textStyle,
    this.fontSize =14.0,
    this.fontWeight =FontWeight.w800,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color ?? Theme.of(context).colorScheme.primary, color1 ?? Theme.of(context).colorScheme.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(radius), // Optional for rounded corners
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                ),
              if (icon != null) const HSpace(6),
              Text(
                text.toString(),
                style: textStyle ??  AppCss.h3.copyWith(
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                  color: textColor ?? Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
