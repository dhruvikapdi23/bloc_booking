import 'package:bloc_booking/common_path.dart';

class CustomPhoneTextBox extends StatelessWidget {
  final GestureTapCallback? onTap;
  final TextEditingController? controller;
  final CountryCode? countryCode;
  final Function(String)? onChanged;
  const CustomPhoneTextBox({super.key, this.onTap, this.controller, this.countryCode, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            height: 41,
            padding: EdgeInsets.only(
                left: 10,
                top: 6,
                bottom: controller!.text.isEmpty ? 6 : 1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: appTheme.textBoxBorderGrey)),
            child: Row(children: [
              countryCode!
                  .flagImage(width: 25, fit: BoxFit.cover),
              const HSpace(10),
              Expanded(
                  child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        if (controller!.text.isNotEmpty)
                          Text("Phone Number",
                              style: AppCss.figtreeRegular12
                                  .copyWith(color: appTheme.greyText)
                                  .textHeight(0.7)),
                        TextFormField(autovalidateMode: AutovalidateMode.always,
                            controller: controller,
                            keyboardType: TextInputType.phone,
                            style: AppCss.figtreeRegular13
                                .copyWith(color: appTheme.secondary),
                            onChanged:onChanged,
                            decoration: InputDecoration(
                                filled: true,
                                hintText: "Phone Number",
                                hintStyle: AppCss.figtreeRegular14
                                    .copyWith(color: appTheme.secondary),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder:
                                const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                disabledBorder:
                                const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                constraints: const BoxConstraints(
                                    maxHeight: 24, maxWidth: 200),
                                contentPadding: EdgeInsets.zero))
                      ]))
            ])));
  }
}
