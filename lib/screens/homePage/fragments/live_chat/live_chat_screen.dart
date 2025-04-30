import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';

import '../../../../datalayer/dataProviders/dio_interceptor.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';
import 'live_chat_screen_controller.dart';

class LiveChatScreen extends StatelessWidget {
  static const routeName = '/chat_screen';
  final LiveChatScreenController _controller = Get.put(
    LiveChatScreenController(DioService(dioInterceptor: DioInterceptor())),
  );

  const LiveChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Chat(
          theme: DefaultChatTheme(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            inputBackgroundColor: Theme.of(context).cardColor,
            inputTextColor: Theme.of(context).hintColor,
          ),
          messages: _controller.messages.value,

          onSendPressed: _controller.handleSendPressed,
          user: _controller.user,
          onAttachmentPressed: _controller.handleImageSelection,
        ),
      ),
    );
  }
}
