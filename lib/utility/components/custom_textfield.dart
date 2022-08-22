import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/font_utils.dart';
import 'package:qwikleave/utility/values/size_utils.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    this.controller,
    this.errorMessage,
    this.keyboardType,
    this.obscureText = false,
    this.textCapitalization,
    this.onTap,
    this.readOnly,
    this.maxLines,
    this.textInputAction,
    this.hint,
    this.autoFocus,
    this.enabled,
    this.maxLength,
    this.suffix,
    this.validator,
    this.onChanged,
    this.prefix,
    this.inputFormatters,
    this.scrollpadding,
  }) : super(key: key);
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function? validator;
  final bool obscureText;
  final String? errorMessage;
  final TextCapitalization? textCapitalization;
  final bool? readOnly;
  final Function? onTap;
  final int? maxLines;
  final bool? autoFocus;
  final String? hint;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final Function(String)? onChanged;
  final double? scrollpadding;
  final List<TextInputFormatter>? inputFormatters;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;
  FocusNode myFocusNode = new FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myFocusNode.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeUtils.getHeight(12), bottom: SizeUtils.getHeight(12)),
      child: TextFormField(
        focusNode: myFocusNode,
        readOnly: widget.readOnly ?? false,
        enabled: widget.enabled ?? true,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.words,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        validator: (value) {
          if (widget.validator != null && !widget.validator!(value)) {
            return widget.errorMessage ??
                "Please enter a valid " + widget.label.toLowerCase();
          }
          return null;
        },
        style: FontUtils.getFont14Style(
            color: AppColors.fontColor, fontWeight: FontWeight.w500),
        obscureText: widget.obscureText,
        controller: widget.controller,
        maxLines: widget.maxLines ?? 1,
        maxLength: widget.maxLength,
        obscuringCharacter: '*',
        keyboardType: widget.keyboardType,
        cursorColor: AppColors.primaryColor,
        scrollPadding: widget.scrollpadding != null
            ? EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom +
                    widget.scrollpadding!)
            : EdgeInsets.all(0),
        decoration: InputDecoration(
            filled: true,
            isDense: true,
            counter: SizedBox(),
            fillColor: AppColors.white,
            suffixIcon: widget.suffix,
            suffixIconConstraints:
                BoxConstraints(maxWidth: SizeUtils.getWidth(50)),
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(15),
                horizontal: SizeUtils.getWidth(10)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textfieldColor),
            ),
            errorStyle: FontUtils.getFont10Style(color: Colors.red),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textfieldColor)),
            hintText: widget.hint,
            labelText: widget.label,
            labelStyle: FontUtils.getFont12Style(
                color: myFocusNode.hasFocus
                    ? AppColors.primaryColor
                    : AppColors.labelGrey),
            //floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: FontUtils.getFont14Style(
                fontWeight: FontWeight.w500, color: AppColors.hintColor)),
      ),
    );
  }
}
