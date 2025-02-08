

import '../../common_path.dart';


class CommonAlertDialog extends StatelessWidget {
  final String? icon;
  final Widget? child;
  final double? height;
  final Color? bgColor;

  const CommonAlertDialog(
      {super.key, this.icon, this.child, this.height, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor ?? Colors.transparent,
        body: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: appTheme.bgLight.withValues(alpha:.97),
                blurRadius: 6,
                //spreadRadius: 10
              )
            ]),
            child: Stack(children: [
              Center(
                  child: SizedBox(
                height: height!,
                child: Stack(alignment: Alignment.center, children: [
                  child!,
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(icon!,
                            height: 24, width: 24)
                        .paddingAll(8)
                        .decorated(
                            color: appTheme.white,
                            border: Border.all(color: appTheme.bdrClr),
                            boxShadow: [
                              BoxShadow(
                                  color: appTheme.secondary.withValues(alpha:0.10),
                                  offset: const Offset(0, -2),
                                  blurRadius: 10)
                            ],
                            borderRadius: BorderRadius.circular(12)),
                  )
                ]).marginSymmetric(horizontal: 45),
              ))
            ])).inkWell(onTap: () => context.pop(context)));
  }
}
