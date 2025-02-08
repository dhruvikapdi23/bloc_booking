
import '../../../../common_path.dart';

class HorizontalTravelerCount extends StatelessWidget {
  final int? selectedIndex,totalTravelers;
  final Function(int)? onTap;
  const HorizontalTravelerCount({super.key, this.totalTravelers, required this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: MediaQuery.of(context).size.width,
      color: appTheme.white,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
            left: 12,right: 12, top: 4,bottom: 12),
        itemCount: totalTravelers!,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgAssets.user,
                height: 24,
                colorFilter: ColorFilter.mode(
                    index == selectedIndex
                        ? appTheme.white
                        : appTheme.greyText,
                    BlendMode.srcIn),
              ),
              Text(
                fonts.travelerCount(index + 1),
                style: AppCss.figtreeSB12.textColor(
                    index == selectedIndex
                        ? appTheme.white
                        : appTheme.greyText),
              )
            ],
          )
              .padding(
              horizontal: 8, vertical:4)
              .decorated(
              color: index == selectedIndex
                  ? appTheme.primary
                  : appTheme.trans,
              borderRadius: BorderRadius.circular(8))
              .marginOnly(right: 8)
              .inkWell(onTap:()=> onTap!(index));
        },
      ),
    );
  }
}
