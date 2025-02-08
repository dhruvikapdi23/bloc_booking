
import '../../common_path.dart';

class MinusPlusTotalLayout extends StatelessWidget {
  final GestureTapCallback? minusTap,plusTap;
  final int? total;
  final bool isColor;
  const MinusPlusTotalLayout({super.key, this.minusTap, this.plusTap, this.total,  this.isColor=false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset( isColor?svgAssets.minusColor: svgAssets.minus).inkWell(
            onTap:minusTap),
        Text(
          total.toString(),
          style: AppCss.figtreeSB12
              .textColor(appTheme.black)
        ).marginSymmetric(horizontal: 12),
        SvgPicture.asset(isColor?svgAssets.plusColor: svgAssets.plus)
            .inkWell(onTap: plusTap)
      ],
    ).paddingAll(6).decorated(
        color:isColor?  total! >0?appTheme.primary.withValues(alpha:.10): appTheme.bgLight:appTheme.bgLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isColor? total! >0?appTheme.primary: appTheme.bdrClr: appTheme.bdrClr));
  }
}
