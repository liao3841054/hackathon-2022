import 'package:kago_client/res/r.dart';
import 'package:kago_client/res/strings.dart';
import 'package:kago_client/res/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:flutter/widgets.dart';

/// @class : LogoNameWidget
/// @date : 2021/08/16
/// @name : liaoyp
/// @description :登录Logo
class LogoNameWidget extends StatelessWidget {
  const LogoNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            R.assetsImagesApplicationTransparent,
            // color: Colors.white,
            // width: 80,
          ),
          Text(
            StringStyles.appName.tr,
            style: Styles.style_white_36,
          )
        ],
      ),
    );
  }
}
