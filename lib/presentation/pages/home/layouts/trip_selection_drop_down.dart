import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../../common_path.dart';

class TripSelectionDropDown extends StatelessWidget {
  final String? selectedValue;
  final Function(String)? onTap;
  const TripSelectionDropDown({super.key, this.selectedValue, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: DropdownButtonHideUnderline(
            child: DropdownButton2(

                customButton:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(selectedValue!,
                      style: AppCss.figtreeRegular12.textColor(appTheme.black)),
                  SvgPicture.asset(svgAssets.dropDown,
                      colorFilter:
                          ColorFilter.mode(appTheme.black, BlendMode.srcIn))
                ]).height(32).width(110).decorated(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: appTheme.textBoxBorderGrey)),
                isExpanded: true,
                items: appArray.tripOption
                    .asMap()
                    .entries
                    .map((item) => DropdownMenuItem(
                  onTap: ()=> onTap!(item.value['title']!),
                        value: item.value['title'],
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item.value['title']!,
                                style: AppCss.figtreeRegular12
                                    .textColor(appTheme.black),
                                overflow: TextOverflow.ellipsis,
                              ).marginSymmetric(horizontal: 16),
                              if (item.key != appArray.tripOption.length - 1)
                                Divider(
                                        height: 1,
                                        color: appTheme.lightGrey,
                                        thickness: 1)
                                    .paddingSymmetric(vertical: 10)
                            ])))
                    .toList(),
                value: appArray.tripOption[0]['title'],
                onChanged: (value) {},
                buttonStyleData: ButtonStyleData(
                    height: 32,
                    width: 110,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                        color: appTheme.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: appTheme.textBoxBorderGrey)),
                    elevation: 1),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 150,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white),
                    offset: const Offset(0, -5),
                    elevation: 2,
                    scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility:
                            MaterialStateProperty.all<bool>(true))),
                menuItemStyleData: const MenuItemStyleData(
                    height: 40, padding: EdgeInsets.only(left: 8, right: 8)))));
  }
}
