import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc_booking/core/theme/index.dart';

import '../../core/extensions/spacing.dart';
import '../../core/extensions/textstyle_extensions.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final bool? isOptional;
  final TextEditingController? controller;
  final String? initialValue;
  final String? hint;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final int? errorMaxLines;
  final double? radius;
  final BorderRadius? borderRadius;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? prefixIconPadding;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final EdgeInsetsGeometry? suffixIconPadding;
  final TextStyle? style, counterStyle, errorStyle;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final int? maxLength;
  final bool showCounter;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final bool showBoarder;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isDense;
  final bool autofocus;
  final InputBorder? inputBorder;
  final AutovalidateMode? autoValidateMode;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final bool readOnly;

  const CustomTextFormField({
    super.key,
    this.title,
    this.controller,
    this.initialValue,
    this.hint,
    this.hintText,
    this.labelText,
    this.errorText,
    this.errorMaxLines,
    this.radius,
    this.prefixIcon,
    this.prefixIconPadding,
    this.suffix,
    this.prefix,
    this.suffixIcon,
    this.suffixIconPadding,
    this.style,
    this.counterStyle,
    this.errorStyle,
    this.obscureText = false,
    this.validator,
    this.padding,
    this.fillColor,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType,
    this.enabled = true,
    this.maxLength,
    this.showCounter = false,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.showBoarder = true,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.textInputAction,
    this.inputFormatters,
    this.isDense,
    this.autofocus = false,
    this.inputBorder,
    this.autoValidateMode,
    this.textCapitalization = TextCapitalization.sentences,
    this.autofillHints,
    this.isOptional,
    this.borderRadius,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null && title != "")
          Row(
            children: [
              Text(
                title.toString(),
                style: AppCss.h5.copyWith(
                  color: appTheme.lightGrey,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (isOptional != null && isOptional == true)
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    "(Optional)",
                    style: AppCss.h5.copyWith(
                      color: appTheme.lightGrey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
            ],
          ),
        if (title != null && title != "") const VSpace(6),
        TextFormField(
          readOnly: readOnly,
          controller: controller,
          initialValue: initialValue,
          style: (style ?? AppCss.h5),
          obscureText: obscureText,
          validator: validator,
          keyboardType: keyboardType ?? TextInputType.text,
          maxLines: maxLines,
          minLines: minLines,
          enabled: enabled,
          maxLength: maxLength,
          onTap: onTap,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          focusNode: focusNode,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          autofocus: autofocus,
          autovalidateMode: autoValidateMode,
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxHeight: 41),
            enabledBorder: inputBorder ??OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(radius ?? 8)),
                borderSide: BorderSide(color: appTheme.textBoxBorderGrey)),
            disabledBorder: inputBorder??OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(radius ?? 8)),
                borderSide: BorderSide(color: appTheme.textBoxBorderGrey)),
            border: inputBorder??OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(radius ?? 8)),
                borderSide: BorderSide(color: appTheme.textBoxBorderGrey)),
            focusedBorder: inputBorder??OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(radius ?? 8)),
                borderSide: BorderSide(color: appTheme.textBoxBorderGrey)),
            errorBorder: inputBorder??OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(radius ?? 8)),
                borderSide: BorderSide(color: appTheme.textBoxBorderGrey)),
            focusedErrorBorder: inputBorder,
            errorStyle: (errorStyle ?? style ?? AppCss.body).textColor(Theme.of(context).colorScheme.error),
            filled: true,
            fillColor: fillColor ?? Theme.of(context).colorScheme.surface,
            contentPadding: padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            hintText: hintText,
            hintStyle: AppCss.h5.copyWith(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
            labelText: labelText,
            errorText: errorText,
            errorMaxLines: errorMaxLines ?? 2,
            counterText: showCounter ? null : '',
            counterStyle: counterStyle ?? AppCss.body,
            isDense: isDense,
            prefix: prefix,
            prefixIcon: prefixIcon != null
                ? Padding(padding: prefixIconPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 14), child: prefixIcon)
                : null,
            suffixIcon:
                suffixIcon != null ? Padding(padding: suffixIconPadding ?? const EdgeInsets.symmetric(horizontal: 0), child: suffixIcon) : null,
            suffix: suffix,
          ),
          autofillHints: autofillHints,
        ),
      ],
    );
  }
}
