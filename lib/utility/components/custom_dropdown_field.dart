import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/font_utils.dart';
import 'package:qwikleave/utility/values/size_utils.dart';
import 'package:qwikleave/utility/values/utils.dart';

class CustomDropDownField extends StatefulWidget {
  const CustomDropDownField(
      {Key? key,
      required this.label,
      required this.items,
      this.selectedItem,
      this.validator,
      this.dropdownValue})
      : super(key: key);
  final String label;
  final List<String> items;
  final String? dropdownValue;
  final Function(String)? selectedItem;
  final Function? validator;
  @override
  _CustomDropDownFieldState createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  String? dropdownValue;
  void initState() {
    // TODO: implement initState
    dropdownValue =
        widget.dropdownValue!.isEmpty ? null : widget.dropdownValue!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeUtils.getHeight(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: FontUtils.getFont12Style(
              fontWeight: FontWeight.w500,
              color: AppColors.tfCustomizedColor,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: SizeUtils.getHeight(8),
              ),
              child: DropdownButtonFormField(
                value: dropdownValue,
                validator: (value) {
                  //print(widget.validator);
                  if (widget.validator != null && !widget.validator!(value)) {
                    return "Please enter a valid " + widget.label.toLowerCase();
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                icon: SvgPicture.asset(
                  Utils.getAssetSvg("ic_downarrow"),
                ),
                iconSize: 10,
                elevation: 4,
                style: FontUtils.getFont14Style(
                    color: AppColors.fontColor, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    counter: SizedBox(),
                    fillColor: AppColors.tfCustomizedfillColor,
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
                    border: InputBorder.none,
                    /*const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textfieldColor),
                  ),*/
                    errorStyle: FontUtils.getFont10Style(color: Colors.red),
                    enabledBorder: //InputBorder.none,
                        const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.tfCustomizedfillColor)),
                    // hintText: widget.hint,
                    //labelText: widget.label,
                    /* labelStyle: FontUtils.getFont12Style(
                      color: myFocusNode.hasFocus
                          ? AppColors.primaryColor
                          : AppColors.labelGrey),*/
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: FontUtils.getFont12Style(
                        fontWeight: FontWeight.w400,
                        color: AppColors.hintColor)),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                  dropdownValue = newValue!;
                  widget.selectedItem!(dropdownValue!);
                },
                items:
                    widget.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
        ],
      ),
    );
  }
}
