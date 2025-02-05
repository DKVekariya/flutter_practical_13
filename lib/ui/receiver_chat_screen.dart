import 'package:flutter/material.dart';
import 'package:flutter_practical_13/ui/ui_component/chat_screen.dart';
import 'package:provider/provider.dart';

import '../data/models/message.dart';
import 'chat_provider.dart';

class ReceiverScreen extends StatefulWidget {
  const ReceiverScreen({super.key});

  @override
  State<ReceiverScreen> createState() => _ReceiverScreenState();
}

class _ReceiverScreenState extends State<ReceiverScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Builder(builder: (context) {
      return Scaffold(
          body: Consumer<MessageProvider>(builder: (context, state, child) {
        return ChatScreen(
            controller: controller,
            messages: state.chatModel.getChatMessages(),
            user: state.chatModel.receiver,
            onSend: () {
              if (controller.text.isNotEmpty) {
                state.chatModel.sendMessage(controller.text, MessageType.text,
                    state.chatModel.receiver, state.chatModel.sender);
                controller.clear();
                state.notify();
              }
            });
      }));
    });
  }
}
