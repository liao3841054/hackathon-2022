import 'package:kago_client/base/get/get_common_view.dart';
import 'package:kago_client/res/colors.dart';
import 'package:kago_client/res/strings.dart';
import 'package:kago_client/res/style.dart';
import 'package:kago_client/ui/page/register_page/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

/// @class : RegisterPrivacyWidget
/// @date : 2021/08/18
/// @name : liaoyp
/// @description :注册 用户服务条款
class RegisterPrivacyWidget extends GetCommonView<RegisterController> {

  const RegisterPrivacyWidget({ Key? key }) : super(key: key);

  @override
  get updateId => "isCheckPrivacy";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Checkbox(
              value: controller.isCheckPrivacy,
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.all(ColorStyle.color_24CF5F),
              onChanged: (select) {
                controller.updateCheck();
              }),
           Text(
            StringStyles.registerServiceTerms.tr,
            style: Styles.style_white_14,
          )
        ],
      ),
    );
  }
}
