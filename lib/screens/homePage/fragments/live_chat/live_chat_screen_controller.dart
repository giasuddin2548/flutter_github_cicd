import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../../datalayer/dataProviders/dio_service.dart';

class LiveChatScreenController extends GetxController {
  DioService dataProvider;

  // A list to store chat messages
  var messages = <types.Message>[].obs;

  // Unique identifier for the current user
  final types.User user = types.User(
    id: 'user-id-123',
  ); // set unique user id here

  LiveChatScreenController(this.dataProvider);

  void handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Uuid().v4(),
      text: message.text,
    );

    // Add the new message to the list
    messages.insert(0, textMessage);

    // Send the message to the server or handle as needed
    sendMessageToServer(textMessage);

    // Trigger an automatic reply after a delay
    _triggerAutoReply();
  }

  void sendMessageToServer(types.TextMessage message) {
    // Implement sending the message via DioService
    // dataProvider.sendMessage(message.text).then((response) {
    //   if (response.success) {
    //     // Optionally update message status or handle response
    //   }
    // });
  }

  void _triggerAutoReply() {
    // Delay to simulate a response delay
    Future.delayed(Duration(seconds: 2), () {
      final autoReplyMessage = types.TextMessage(
        author: types.User(id: 'bot-id'), // bot or server identifier
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: Uuid().v4(),
        text: 'Thank you for your message. How can I assist you further?',
      );

      messages.insert(0, autoReplyMessage);
    });
  }

  // Method to receive messages from the server
  void receiveMessageFromServer(String text, String senderId) {
    final receivedMessage = types.TextMessage(
      author: types.User(id: senderId),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: Uuid().v4(),
      text: text,
    );

    messages.insert(0, receivedMessage);
  }

  final ImagePicker _picker = ImagePicker();
  Future<void> handleImageSelection() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      final imageMessage = types.ImageMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: Uuid().v4(),
        name: pickedFile.name,
        size: await imageFile.length(),
        uri: imageFile.path,
      );

      messages.insert(0, imageMessage);
      sendImageToServer(imageMessage);

      // Optionally, trigger an auto-reply for images as well
      _triggerAutoReply();
    }
  }

  void sendImageToServer(types.ImageMessage message) {
    // Implement image upload logic with DioService
    // dataProvider.uploadImage(message.uri).then((url) {
    //   // Update message URI with server URL if necessary
    // });
  }
}
