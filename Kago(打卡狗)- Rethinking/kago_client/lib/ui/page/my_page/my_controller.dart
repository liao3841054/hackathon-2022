import 'package:kago_client/base/get/getx_controller_inject.dart';
import 'package:kago_client/model/request_register.dart';
import 'package:kago_client/util/save/sp_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// @class : MyController
/// @date : 2021/08/20
/// @name : liaoyp
/// @description :我的 控制器层
class MyController extends BaseGetController {
  ///用户信息
  late UserEntity userInfo;

  ///浏览历史长度
  RxInt browseHistory = 0.obs;
  ///分享的长度
  RxInt share = 0.obs;

  @override
  void onInit() {
    super.onInit();
    var info = SpUtil.getUserInfo();
    notifyBrowseHistory();
    if (info != null) {
      userInfo = info;
      update();
    }
  }

  /// 更新用户信息，每次进入时更新
  void notifyUserInfo() {
    // request.getUserInfo(success: (data) {
    //   userInfo = data;
    //   SpUtil.notifyUserInfo(userInfo);
    //   update();
    // });
  }

 
  ///更新历史记录长度
  void notifyBrowseHistory() {
    browseHistory.value = SpUtil.getBrowseHistoryLength();
  }
}
