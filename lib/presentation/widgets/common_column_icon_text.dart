
import '../../common_path.dart';

class CommonColumnIconText extends StatelessWidget {
  final String? icon,text;
  final Color? bgColor,iconColor;
  final GestureTapCallback? onTap;
  const CommonColumnIconText({super.key, this.icon, this.text, this.bgColor, this.iconColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
            icon!,colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn),)
            .paddingAll(8)
            .decorated(
            color: bgColor,
            shape: BoxShape.circle,
            boxShadow: bgColor == appTheme.white? [
              BoxShadow(
                  color: appTheme.secondary
                      .withValues(alpha:.04),
                  offset: const Offset(0, 0),
                  spreadRadius: 6,
                  blurRadius: 6)
            ]:[]).height(32).width(32),
        const VSpace(5),
        Text(text!,style: AppCss.figtreeSB8.textColor(appTheme.greyText),)
      ],
    ).inkWell(onTap: onTap);
  }
}
