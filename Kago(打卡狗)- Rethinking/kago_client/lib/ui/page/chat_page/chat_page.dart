import 'dart:ui';

import 'package:kago_client/base/get/get_save_state_view.dart';
import 'package:kago_client/model/chat_message_model.dart';
import 'package:kago_client/res/decoration_style.dart';
import 'package:kago_client/ui/page/chat_page/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kago_client/ui/page/my_page/widget/head_circle_widget.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:kago_client/util/toast_util.dart';

/// @class : ChatPage
/// @date : 2022/08/26
/// @name : liaoyp
/// @description :聊天 View层

class ChatPage extends GetSaveView<ChatController> {
  // ChatPage({Key? key}) : super(key: key);
  const ChatPage({Key? key}) : super(key: key);

  // AudioPlayer audioPlayer = new AudioPlayer();

  // Duration duration = new Duration();
  // Duration position = new Duration();
  // bool isPlaying = false;
  // bool isLoading = false;
  // bool isPause = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("考研打卡群"),
      ),
      // backgroundColor: Colors.red,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/classroom_bg_1.png",
            fit: BoxFit.fitHeight,
            height: Get.height,
          ),
          ListView.builder(
              controller: controller.listViewController,
              padding: EdgeInsets.only(
                  left: 12, top: 12, right: 12, bottom: (Get.bottomBarHeight + 60).toDouble()),
              itemCount: controller.chatMessageList.length,
              itemBuilder: (BuildContext context, int index) {
                ChatMessage item = controller.chatMessageList[index];

                if (item.type == MessageType.Time) {
                  return Center(
                    child: DateChip(
                      date: item.date,
                    ),
                  );
                } else if (item.type == MessageType.Sign) {
                  return SigninItem(isSender: item.isSender, text: item.text);
                }
                return ChatItem(
                  item: item,
                  isSender: item.isSender,
                );
              }),
          SafeArea(
            child: controller.isSign
                ? MessageBar(
                    onSend: (text) {
                      if (text.isNotEmpty) {
                        controller.addSendMessage(text);
                      }
                    },
                    actions: const [
                      InkWell(
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 24,
                        ),
                        // onTap: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: InkWell(
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.green,
                            size: 24,
                          ),
                          // onTap: () {},
                        ),
                      ),
                    ],
                  )
                : NotSignBar(
                    onTap: () {
                      controller.addSendMessage("汪！");
                      ToastUtils.showBottom("没完成打卡前，你只是一条狗");
                    },
                    onLongPress: () {
                      controller.addSendSignMessage("图片打卡");
                      controller.updateSign();
                    },
                  ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SigninItem extends StatelessWidget {
  final bool isSender;
  final String text;
  const SigninItem({Key? key, required this.isSender, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadCircleWidget(
          width: 36,
          height: 36,
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: DecorationStyle.customizeBorder(
                  radius: 15, color: const Color.fromRGBO(0, 153, 255, 1))
              .copyWith(color: const Color.fromRGBO(0, 153, 255, 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.check_box,
                    color: Colors.white,
                    size: 18,
                  ),
                  Text(
                    "沈公子 完成打卡！",
                    style:
                        TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Image.network(
                "http://p1.itc.cn/images03/20200514/ada4bcda1fba46b3a8f44d53205a8d75.jpeg",
                width: 196,
                height: 135,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  final bool isSender;
  final ChatMessage item;
  const ChatItem({Key? key, required this.isSender, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSender) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: BubbleSpecialThree(
              text: item.text,
              color: Color(0xFFE8E8EE),
              tail: true,
              isSender: isSender,
            ),
          ),
          HeadCircleWidget(
            width: 36,
            height: 36,
            assetName: item.avatar,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          HeadCircleWidget(
            width: 36,
            height: 36,
            assetName: item.avatar,
          ),
          Expanded(
            child: BubbleSpecialThree(
              text: item.text,
              color: Color(0xFFE8E8EE),
              tail: true,
              isSender: false,
            ),
          ),
        ],
      );
    }
  }
}

class NotSignBar extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  const NotSignBar({Key? key, this.onTap, this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTap: onTap,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            color: Colors.white,
            height: 44,
            width: double.infinity,
            child: Center(
              child: Container(
                  height: 35,
                  width: Get.width * 0.818,
                  decoration:
                      DecorationStyle.colorShadowRadius30().copyWith(color: Colors.blueAccent),
                  child: const Center(
                      child: Text(
                    "长按打卡",
                    style: TextStyle(color: Colors.white),
                  ))),
            )),
      ),
    );
  }
}
