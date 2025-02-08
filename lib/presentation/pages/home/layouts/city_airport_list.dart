

import '../../../../common_path.dart';

class CityAirportList extends StatelessWidget {
  final List? list;
  final Function(dynamic)? onTap;
  const CityAirportList({super.key, this.list, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list!.length,
      itemBuilder: (context, index) {
        dynamic data = list![index];

        return Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(svgAssets.takeoff),
                const HSpace(4),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(data['airportName'],
                        style: AppCss.figtreeSB14
                            .textColor(appTheme.secondary)),
                    Text(data['cityName'],
                        style: AppCss.figtreeRegular12
                            .textColor(appTheme.greyText))
                  ],
                )
              ],
            ),
            Divider(color: appTheme.bdrClr,height: 0).paddingSymmetric(vertical: 14)
          ],
        ).inkWell(onTap: ()=> onTap!(data));
      },
    );
  }
}
