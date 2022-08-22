import 'package:flutter/material.dart';
import 'package:qwikleave/utility/common/common_navigate.dart';
import 'package:qwikleave/utility/components/costomized_textfield.dart';
import 'package:qwikleave/utility/components/custom_back_btn.dart';
import 'package:qwikleave/utility/components/custom_dropdown_field.dart';
import 'package:qwikleave/utility/components/custom_textfield.dart';
import 'package:qwikleave/utility/components/customized_footer_button.dart';
import 'package:qwikleave/utility/components/footer_button.dart';
import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/font_utils.dart';
import 'package:qwikleave/utility/values/form_validators.dart';
import 'package:qwikleave/utility/values/scroll_behaviour.dart';
import 'package:qwikleave/utility/values/size_utils.dart';
import 'package:qwikleave/utility/values/utils.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddNewLeaveScreen extends StatefulWidget {
  const AddNewLeaveScreen({Key? key}) : super(key: key);

  @override
  State<AddNewLeaveScreen> createState() => _AddNewLeaveScreenState();
}

class _AddNewLeaveScreenState extends State<AddNewLeaveScreen> {
  final _typeController = TextEditingController();
  final _resonController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      height: SizeUtils.getScreenHeight(),
      width: SizeUtils.getScreenWidth(),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.splashgrad1Color,
            AppColors.splashgrad2Color,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(children: [
        ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dateRangePicker(),
                sheetPack(),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: SizeUtils.getHeight(45), left: SizeUtils.getWidth(8)),
          child: CustomBackButton(),
        ),
      ]),
    )));
  }

  Widget dateRangePicker() {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.getWidth(20),
            vertical: SizeUtils.getHeight(24)),
        child: SfDateRangePicker(
          endRangeSelectionColor: AppColors.white,
          rangeSelectionColor: AppColors.white.withOpacity(0.2),
          selectionColor: AppColors.white,
          selectionTextStyle:
              FontUtils.getFont14Style(color: AppColors.splashgrad1Color),
          headerHeight: SizeUtils.getHeight(65),
          showNavigationArrow: true,
          startRangeSelectionColor: AppColors.white,
          headerStyle: DateRangePickerHeaderStyle(
              textStyle: FontUtils.getFont24Style(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          )),
          selectionMode: DateRangePickerSelectionMode.range,
          initialSelectedRange: PickerDateRange(
              DateTime.now().subtract(const Duration(days: 2)),
              DateTime.now().add(const Duration(days: 1))),
        ));
  }

  List<String> types = <String>[
    "Unpaid leave",
    "Medical Leave",
    "Emergency Leave"
  ];

  Widget sheetPack() {
    return Container(
      constraints: BoxConstraints(minHeight: SizeUtils.getHeight(420)),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.getWidth(20),
          vertical: SizeUtils.getHeight(16)),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                SizeUtils.getRadius(30),
              ),
              topRight: Radius.circular(SizeUtils.getRadius(30)))),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20),
            CustomDropDownField(
              label: "Type of Leaves",
              dropdownValue: "",
              selectedItem: (String value) {},
              items: types,
            ),
            CustomizedTextField(
              label: "Reason",
              controller: _resonController,
              hint: "Type your reason here...",
              maxLines: 5,
              validator: (value) {
                return FormValidators.emptyValidate(value);
              },
              scrollpadding: SizeUtils.getHeight(140),
            ),
            verticalSpace(16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(57)),
              child: CustomizedFooterButton(
                label: "Apply for Leave",
                onTap: () {
                  //if (!_formKey.currentState!.validate()) {
                  CommonNavigate(parentContext: context).navigateHomeScreen();
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
