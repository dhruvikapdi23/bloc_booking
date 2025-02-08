import 'package:bloc_booking/presentation/bloc/home/home_cubit.dart';

import '../../../../common_path.dart';

class TabMenu extends StatelessWidget {
  const TabMenu({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit dash = context.read<HomeCubit>();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 40.0,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: const BoxDecoration(
              color: Color(0XFFE0E0E0),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8)),
                          onTap: () => dash.onPlaceBidButtonPress(),
                          child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              alignment: Alignment.center,
                              decoration: (dash.activePageIndex == 0)
                                  ? BoxDecoration(
                                color: appTheme.primary,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8)),
                              )
                                  : null,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      svgAssets.plane,
                                      colorFilter: ColorFilter.mode(
                                          (dash.activePageIndex == 0)
                                              ? appTheme.white
                                              : appTheme.textBoxBorderGrey,
                                          BlendMode.srcIn),
                                    ),
                                    Text("Flight",
                                        style: (dash.activePageIndex == 0)
                                            ? AppCss.figtreeBold12
                                            .textColor(appTheme.white)
                                            : AppCss.figtreeRegular12.textColor(
                                            appTheme.textBoxBorderGrey))
                                  ])))),
                  Expanded(
                      child: InkWell(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8)),
                          onTap: () => dash.onBuyNowButtonPress(),
                          child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              alignment: Alignment.center,
                              decoration: (dash.activePageIndex == 1)
                                  ? BoxDecoration(
                                color: appTheme.primary,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8)),
                              )
                                  : null,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(svgAssets.hotel,
                                        colorFilter: ColorFilter.mode(
                                            (dash.activePageIndex == 1)
                                                ? appTheme.white
                                                : appTheme.textBoxBorderGrey,
                                            BlendMode.srcIn)),
                                    Text("Hotel",
                                        style: (dash.activePageIndex == 1)
                                            ? AppCss.figtreeSB12
                                            .textColor(appTheme.white)
                                            : AppCss.figtreeRegular12.textColor(
                                            appTheme.textBoxBorderGrey))
                                  ]))))
                ]));
      },
    );
  }
}
