


import 'package:bloc_booking/common_path.dart';



class ButtonCommon extends StatelessWidget {
  final String title;
  final double? padding, margin, radius, height, fontSize, width;
  final GestureTapCallback? onTap;
  final TextStyle? style;
  final Color? color, fontColor, borderColor;
  final Widget? icon;
  final FontWeight? fontWeight;

  const ButtonCommon(
      {super.key,
      required this.title,
      this.padding,
      this.margin = 0,
      this.radius = 8,
      this.height = 40,
      this.fontSize = 30,
      this.onTap,
      this.style,
      this.color,
      this.fontColor,
      this.icon,
      this.borderColor,
      this.width,
      this.fontWeight = FontWeight.w700});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        margin: EdgeInsets.symmetric(horizontal: margin!),
        decoration: BoxDecoration(
            color: color ?? appTheme.primary,
            borderRadius: BorderRadius.circular(radius ??0),
            border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(title,
              textAlign: TextAlign.center,
              style: style ??
                  AppCss.figtreeRegular14
                      .textColor(appTheme.white)),
          if (icon != null)
            Row(children: [icon!, const HSpace(10)])
                .paddingOnly(left: 8),
        ])).inkWell(onTap: onTap);
  }
}
