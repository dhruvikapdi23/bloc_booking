

import '../../common_path.dart';

class CommonAppBar extends StatelessWidget  implements PreferredSizeWidget{
  final String? title;
  const CommonAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: SvgPicture.asset(svgAssets.arrowLeft,
            colorFilter:
            ColorFilter.mode(appTheme.secondary, BlendMode.srcIn))
            .marginSymmetric(horizontal: 12)
            .inkWell(onTap: () => context.pop(context)),
        title: Text(title!,
            style:
            AppCss.figtreeSB16.textColor(appTheme.secondary)),
        bottom: PreferredSize(
            preferredSize: const Size(50, 70),
            child: Row(children: [
              Image.asset(imageAssets.appLogo, height: 24),
              const HSpace(3),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Flight 1 of 2",
                        style: AppCss.figtreeRegular12
                            .textColor(appTheme.greyText)),
                    Text("Los Angeles (LAX) to Seattle (SEA)",
                        style: AppCss.figtreeSB14
                            .textColor(appTheme.secondary)),
                  ])
            ]).padding(horizontal: 12, bottom: 14)));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(120);
}
