import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qwikleave/utility/common/common_navigate.dart';
import 'package:qwikleave/utility/components/custom_textfield.dart';
import 'package:qwikleave/utility/components/footer_button.dart';
import 'package:qwikleave/utility/values/app_colors.dart';
import 'package:qwikleave/utility/values/font_utils.dart';
import 'package:qwikleave/utility/values/form_validators.dart';
import 'package:qwikleave/utility/values/scroll_behaviour.dart';
import 'package:qwikleave/utility/values/size_utils.dart';
import 'package:qwikleave/utility/values/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String> icons = [
    "ic_facebook",
    "ic_google",
    "ic_apple",
  ];

  int selectedIndex = 0;
  List<int> selectionList = <int>[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          //  padding: EdgeInsets.only(top: SizeUtils.getHeight(70)),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.splashgrad1Color,
                  AppColors.splashgrad2Color,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              image: DecorationImage(
                  image: AssetImage(Utils.getAssetPng("bg_all")),
                  fit: BoxFit.cover)),
          child: ScrollConfiguration(
              behavior: NoGlowScrollBehaviour(),
              child: SingleChildScrollView(
                  child: Column(children: [verticalSpace(70), sheetPack()]))),
        ),
      ),
    );
  }

  Widget sheetPack() {
    return Container(
      constraints: BoxConstraints(minHeight: SizeUtils.getHeight(665)),
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
            Center(
              child: Container(
                height: SizeUtils.getHeight(5),
                width: SizeUtils.getWidth(30),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(12))),
              ),
            ),
            verticalSpace(22),
            Text(
              "Welcome Back!",
              style: FontUtils.getFont24Style(
                  color: AppColors.fontColor, fontWeight: FontWeight.w500),
            ),
            verticalSpace(20),
            Text(
              "Let's login for explore continues",
              style: FontUtils.getFont14Style(
                  color: AppColors.loginSubcolor, fontWeight: FontWeight.w400),
            ),
            verticalSpace(20),
            logo(),
            CustomTextField(
              label: "Email",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.sentences,
              validator: (value) {
                return FormValidators.emailValidate(value);
              },
              scrollpadding: SizeUtils.getHeight(240),
            ),
            CustomTextField(
              label: "Password",
              controller: _passwordController,
              obscureText: true,
              validator: (value) {
                return FormValidators.emptyValidate(value);
              },
              scrollpadding: SizeUtils.getHeight(140),
            ),
            Row(
              children: [
                rememberMe(),
                const Spacer(),
                Text(
                  "Forgot password?",
                  style: FontUtils.getFont12Style(
                    color: AppColors.fontdesGrey,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            verticalSpace(16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(57)),
              child: FooterButton(
                label: "LOGIN",
                onTap: () {
                  if (!_formKey.currentState!.validate()) {
                    CommonNavigate(parentContext: context).navigateHomeScreen();
                  }
                },
              ),
            ),
            verticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: SizeUtils.getHeight(1),
                  width: SizeUtils.getWidth(42),
                  color: AppColors.hintColor.withOpacity(0.6),
                ),
                horizontalSpace(8),
                Text(
                  "You can connect with",
                  style: FontUtils.getFont12Style(
                      color: AppColors.hintColor, fontWeight: FontWeight.w400),
                ),
                horizontalSpace(42),
                Container(
                  height: SizeUtils.getHeight(1),
                  width: SizeUtils.getWidth(42),
                  color: AppColors.hintColor.withOpacity(0.6),
                ),
              ],
            ),
            verticalSpace(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(80)),
              child: Row(
                children: List.generate(3, (index) => optionsTile(index)),
              ),
            ),
            verticalSpace(30),
            Center(
              child: RichText(
                  text: TextSpan(
                      text: 'New User? ',
                      style: FontUtils.getFont11Style(
                        color: AppColors.hintColor,
                      ),
                      children: [
                    TextSpan(
                        text: 'Signup',
                        recognizer: TapGestureRecognizer()..onTap = () async {},
                        style: FontUtils.getFont11Style(
                            color: AppColors.primaryColor)),
                  ])),
            ),
          ],
        ),
      ),
    );
  }

  Widget rememberMe() {
    return Row(
      children: [
        checkBox(0),
        horizontalSpace(6),
        Text(
          "Remember Me",
          style: FontUtils.getFont12Style(
            fontWeight: FontWeight.w400,
            color: AppColors.fontdesGrey,
          ),
        ),
      ],
    );
  }

  Widget optionsTile(int index) {
    return Expanded(
      child: Container(
        height: SizeUtils.getHeight(44),
        width: SizeUtils.getHeight(44),
        margin: EdgeInsets.only(right: SizeUtils.getWidth(10)),
        child: TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.center,
            primary: AppColors.primaryColor,
            shape: CircleBorder(),
            backgroundColor: AppColors.backgroundGrey,
          ),
          onPressed: () {},
          child: SvgPicture.asset(
            Utils.getAssetSvg(icons[index]),
            height: SizeUtils.getHeight(20),
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return SizedBox(
      height: SizeUtils.getHeight(88),
      width: SizeUtils.getHeight(88),
      child: SvgPicture.asset(
        Utils.getAssetSvg("ic_logo_home"),
        fit: BoxFit.contain,
      ),
    );
  }

  // setdata
  setData(index) {
    if (selectionList.contains(index)) {
      selectionList.remove(index);
    } else {
      selectionList.add(index);
    }
  }

  Widget checkBox(index) {
    return InkWell(
      child: Container(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          width: SizeUtils.getHeight(17),
          height: SizeUtils.getHeight(17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeUtils.getRadius(4)),
            border: Border.all(
              color: selectionList.contains(index)
                  ? AppColors.primaryColor
                  : AppColors.primaryColor,
            ),
            color: selectionList.contains(index)
                ? AppColors.primaryColor
                : AppColors.white,
          ),
          child: Icon(
            Icons.check,
            size: SizeUtils.getHeight(10),
            color: selectionList.contains(index)
                ? AppColors.white
                : AppColors.white,
          ) /*SvgPicture.asset(
          Utils.getAssetSvg("ic_check"),
          height: SizeUtils.getHeight(10),
          color:
              selectionList.contains(index) ? AppColors.white : AppColors.white,
        ),*/
          ),
      onTap: () {
        setState(() {
          if (selectionList.contains(index)) {
            selectionList.remove(index);
          } else {
            selectionList.add(index);
          }
        });
      },
    );
  }
}
