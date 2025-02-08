import '../../../../common_path.dart';
import 'city_airport_list.dart';

class SearchAirport extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? title;
  final Function(dynamic)? onTap;

  const SearchAirport(
      {super.key, this.focusNode, this.controller, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: DraggableScrollableSheet(
              initialChildSize: .93,
              maxChildSize: .98,
              minChildSize: 0.3,
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Stack(children: [
                  ListView(padding: const EdgeInsets.all(24), children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title!,
                              style: AppCss.figtreeSB24
                                  .textColor(appTheme.secondary)),
                          SvgPicture.asset(svgAssets.cancel, height: 24)
                        ]),
                    const VSpace(24),
                    TextFieldCommon(
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon:
                            SvgPicture.asset(svgAssets.search, height: 24)
                                .paddingOnly(right: 8),
                        focusNode: focusNode,
                        controller: controller,
                        hintText: fonts.enterCityOrAirport),
                    const VSpace(24),
                    Text(fonts.searchResult,
                        style: AppCss.figtreeSB16.textColor(appTheme.primary)),
                    const VSpace(20),
                    CityAirportList(
                        list: appArray.searchResult,
                        onTap: (data) => onTap!(data)),
                    const VSpace(24),
                    Text(fonts.previousResult,
                        style: AppCss.figtreeSB16.textColor(appTheme.primary)),
                    const VSpace(20),
                    CityAirportList(
                        list: appArray.searchResult,
                        onTap: (data) => onTap!(data)),
                  ]).marginOnly(bottom: 50),
                ]);
              }));
    });
  }
}
