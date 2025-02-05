import 'package:flutter/material.dart';
import 'package:flutter_practical_13/ui/ui_component/chat_screen.dart';
import 'package:provider/provider.dart';

import '../data/models/message.dart';
import 'chat_provider.dart';

class SenderScreen extends StatefulWidget {
  const SenderScreen({super.key});

  @override
  State<SenderScreen> createState() => _SenderScreenState();
}

class _SenderScreenState extends State<SenderScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Consumer<MessageProvider>(builder: (context, state, child) {
        return ChatScreen(
            controller: controller,
            messages: state.chatModel.getChatMessages(),
            user: state.chatModel.sender,
            onSend: () {
              if (controller.text.isNotEmpty) {
                state.chatModel.sendMessage(controller.text, MessageType.text,
                    state.chatModel.sender, state.chatModel.receiver);
                controller.clear();
                state.notify();
              }
            });
      }),
    );
  }
}
