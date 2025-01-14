import 'package:kago_client/base/get/get_common_view.dart';
import 'package:kago_client/res/button_style.dart';
import 'package:kago_client/res/colors.dart';
import 'package:kago_client/res/r.dart';
import 'package:kago_client/res/strings.dart';
import 'package:kago_client/res/style.dart';
import 'package:kago_client/ui/page/login_page/widget/edit_widget.dart';
import 'package:kago_client/ui/page/register_page/register_controller.dart';
import 'package:kago_client/ui/page/register_page/widget/logo_name_widget.dart';
import 'package:kago_client/ui/page/register_page/widget/register_privacy_widget.dart';
import 'package:kago_client/util/keyboard_util.dart';
import 'package:kago_client/widget/_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @class : RegisterPage
/// @date : 2021/08/17
/// @name : liaoyp
/// @description :注册 View层
class RegisterPage extends GetCommonView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient:  LinearGradient(
              colors: [
                Color(0xFF6FB0F4),
                Color(0xFFA7D0FC),
              ],
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated
          )
        ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ToolBar(
                    backColor: Colors.white,
                    backOnTap: () => Get.back(),
                    backgroundColor: Colors.transparent,
                  ),

                  ///logo及app名称
                  const LogoNameWidget(),

                  ///账户名输入框
                  EditWidget(
                    iconWidget: const Icon(
                      Icons.perm_identity,
                      color: Colors.white,
                    ),
                    hintText: StringStyles.loginAccountNameHint.tr,
                    onChanged: (text) => controller
                      ..account = text
                      ..update(),
                  ),

                  ///密码输入框
                  EditWidget(
                    iconWidget:
                        const Icon(Icons.lock_open, color: Colors.white),
                    hintText: StringStyles.loginAccountPwdHint.tr,
                    passwordType: true,
                    onChanged: (text) => controller
                      ..password = text
                      ..update(),
                  ),

                  ///再次输入密码输入框
                  EditWidget(
                    iconWidget:
                        const Icon(Icons.lock_open, color: Colors.white),
                    hintText: StringStyles.loginAccountRePwdHint.tr,
                    passwordType: true,
                    onChanged: (text) => controller
                      ..rePassword = text
                      ..update(),
                  ),

                  ///用户服务条款
                  const RegisterPrivacyWidget(),

                  ///注册按钮
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
                    child: TextButton(
                        style: controller.changeShowButton()
                            ? ButtonStyles.getButtonStyle()
                            : ButtonStyles.getTransparentStyle(),
                        onPressed: () {
                          KeyboardUtils.hideKeyboard(context);
                          controller.register();
                        },
                        child: Text(
                          StringStyles.registerButton.tr,
                          style: controller.changeShowButton()
                              ? Styles.style_white_18
                              : Styles.style_white24_18,
                        )),
                    decoration: BoxDecoration(
                      color: controller.changeShowButton()
                          ? ColorStyle.color_24CF5F
                          : ColorStyle.color_24CF5F_20,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ],
              ),
            )));
  }
}
