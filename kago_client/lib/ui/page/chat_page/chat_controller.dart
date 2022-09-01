import 'dart:math';

import 'package:kago_client/base/get/getx_controller_inject.dart';
import 'package:kago_client/model/chat_message_model.dart';
import 'package:kago_client/model/request_register.dart';
import 'package:kago_client/util/save/sp_util.dart';
import 'package:get/get.dart';

/// @class : ChatController
/// @date : 2022/08/26
/// @name : liaoyp
/// @description 聊天控制器
class ChatController extends BaseGetController {
  ///用户信息
  late UserEntity userInfo;

  ///浏览历史长度
  RxInt browseHistory = 0.obs;

  ///分享的长度
  RxInt share = 0.obs;

  List<ChatMessage> chatMessageList = [];

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  String get randAssetsAvatar {
    final r = Random().nextInt(10) + 23;
    return 'assets/images/image $r.png';
  }

  initData() {
    {
      final now = new DateTime.now();

      ChatMessage chatMessage = new ChatMessage(
          avatar: randAssetsAvatar,
          text: "汪！",
          isSender: false,
          type: MessageType.Text,
          date: now);
      chatMessageList.add(chatMessage);
    }
    {
      final now = new DateTime.now();

      ChatMessage chatMessage = new ChatMessage(
          avatar: randAssetsAvatar,
          text: "汪！",
          isSender: false,
          type: MessageType.Text,
          date: now);
      chatMessageList.add(chatMessage);
    }
    {
      final now = new DateTime.now();

      ChatMessage chatMessage = new ChatMessage(
          avatar: randAssetsAvatar,
          text: "汪！",
          isSender: false,
          type: MessageType.Text,
          date: now);
      chatMessageList.add(chatMessage);
    }
    {
      final now = new DateTime.now();

      ChatMessage chatMessage = new ChatMessage(
          avatar: randAssetsAvatar,
          text: "汪！",
          isSender: false,
          type: MessageType.Text,
          date: now);
      chatMessageList.add(chatMessage);
    }
    {
      final now = new DateTime.now();

      ChatMessage chatMessage = new ChatMessage(
          avatar: randAssetsAvatar,
          text: "大家好",
          isSender: false,
          type: MessageType.Time,
          date: now);
      chatMessageList.add(chatMessage);
    }
    {
      final now = new DateTime.now();

      ChatMessage chatMessage = new ChatMessage(
          avatar: randAssetsAvatar,
          text: "大家好",
          isSender: false,
          type: MessageType.Sign,
          date: now);
      chatMessageList.add(chatMessage);
    }
  }

  addSendMessage(String text) {
    final now = new DateTime.now();

    ChatMessage chatMessage =
        new ChatMessage(text: text, type: MessageType.Text, date: now);

    if (chatMessageList.length == 0 || chatMessageList.length % 4 == 0) {
      ChatMessage chatMessage =
          new ChatMessage(text: "", type: MessageType.Time, date: now);
      chatMessageList.add(chatMessage);
    }
    if (chatMessageList.length % 3 == 0) {
      chatMessage.isSender = false;
    }
    chatMessageList.add(chatMessage);

    update();
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