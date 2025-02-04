import 'package:flutter/material.dart';
import 'package:flutter_practical_13/ui/ui_component/chat_screen.dart';
import 'package:provider/provider.dart';
import '../data/models/message.dart';
import '../data/repositories/chat_provider.dart';

class ReceiverScreen extends StatefulWidget {
  const ReceiverScreen({super.key});

  @override
  State<ReceiverScreen> createState() => _ReceiverScreenState();
}

class _ReceiverScreenState extends State<ReceiverScreen> {
  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<MessageProvider>(context);
    final chat = messageProvider.chatModel;

    TextEditingController controller = TextEditingController();
    return Scaffold(
        body: ChatScreen(
            controller: controller,
            messages: chat.getChatMessages(),
            user: chat.receiver,
            onSend: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  chat.sendMessage(controller.text, MessageType.text,
                      chat.receiver, chat.sender);
                  controller.clear();
                });
              }
            }));
  }
}
