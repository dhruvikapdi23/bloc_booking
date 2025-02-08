import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:bloc_booking/common_path.dart';

class TextFieldCommon extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcon;
  final Color? fillColor;
  final bool obscureText, isMaxLine;
  final double? vertical, radius, hPadding;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final int? maxLength, minLines, maxLines;
  final ValueChanged<String>? onFieldSubmitted;
  final String? counterText;
  final TextStyle? hintStyle;
  final bool? isNumber;
  final GestureTapCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldCommon(
      {super.key,
      required this.hintText,
      this.validator,
      this.controller,
      this.labelText,
      this.suffixIcon,
      this.prefixIcon,
      this.border,
      this.obscureText = false,
      this.fillColor,
      this.vertical,
      this.keyboardType,
      this.inputFormatters,
      this.focusNode,
      this.onChanged,
      this.onFieldSubmitted,
      this.radius,
      this.isNumber = false,
      this.maxLength,
      this.minLines,
      this.maxLines,
      this.counterText,
      this.hintStyle,
      this.hPadding,
      this.isMaxLine = false,
      this.onTap});

  @override
  State<TextFieldCommon> createState() => _TextFieldCommonState();
}

class _TextFieldCommonState extends State<TextFieldCommon> {
  bool isFocus = false;

  @override
  void initState() {
    // TODO: implement initState
    widget.controller!.addListener(() {
      log("VAl");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      setState;
      return Theme(
          data: ThemeData(canvasColor: appTheme.white),
          child: Container(
              padding: EdgeInsets.only(
                  left: 8,
                  top: 6,
                  bottom: widget.controller!.text.isEmpty ? 6 : 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: appTheme.textBoxBorderGrey)),
              child: Row(children: [
                if (widget.prefixIcon != null) widget.prefixIcon!,
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      if (widget.labelText != null ||
                          widget.controller!.text.isNotEmpty)
                        Text(widget.labelText ?? widget.hintText,
                            style: AppCss.figtreeRegular12
                                .textColor(appTheme.greyText)
                                .textHeight(
                                    widget.labelText != null ? 1 : 0.9)),
                      TextFormField(
                          maxLines: widget.maxLines ?? 1,
                          style: AppCss.figtreeRegular13
                              .textColor(appTheme.secondary),
                          focusNode: widget.focusNode,
                          inputFormatters: widget.inputFormatters,
                          autovalidateMode: AutovalidateMode.always,
                          onFieldSubmitted: widget.onFieldSubmitted,
                          obscureText: widget.obscureText,
                          onTap: widget.onTap,
                          keyboardType: widget.keyboardType,
                          validator: widget.validator,
                          controller: widget.controller,
                          onChanged: widget.onChanged,
                          minLines: widget.minLines,
                          cursorColor: appTheme.secondary,
                          maxLength: widget.maxLength,
                          decoration: InputDecoration(
                              counterText: widget.counterText,
                              fillColor: widget.fillColor ?? appTheme.white,
                              filled: true,
                              isDense: true,
                              constraints: const BoxConstraints(
                                  maxHeight: 24, maxWidth: 200),
                              contentPadding: EdgeInsets.zero,
                              disabledBorder: widget.border ??
                                  const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                              focusedBorder: widget.border ??
                                  const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                              enabledBorder: widget.border ??
                                  const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                              border: widget.border ??
                                  const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                              suffixIcon: widget.suffixIcon,
                              hintStyle: widget.hintStyle ??
                                  AppCss.figtreeM14
                                      .copyWith(color: appTheme.greyText),
                              labelStyle: widget.hintStyle ??
                                  AppCss.figtreeM14
                                      .copyWith(color: appTheme.greyText),
                              hintText: widget.hintText,
                              errorMaxLines: 2))
                    ]))
              ])));
    });
  }
}
