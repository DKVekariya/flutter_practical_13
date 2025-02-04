import 'package:flutter/material.dart';
import 'package:flutter_practical_13/ui/ui_component/message_input_widget.dart';
import '../../data/models/message.dart';
import '../../data/models/user.dart';
import 'message_bubble.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController controller;
  final List<Message> messages;
  final User user;
  final Function() onSend;
  const ChatScreen({super.key,
    required this.controller,
    required this.messages,
    required this.user,
    required this.onSend
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[50],
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isSender = message.sentBy.id == user.id;
                return MessageBubble(
                  message: message,
                  isSender: isSender,
                );
              },
            ),
          ),
         MessageInputWidget(controller: controller,
             onSend: onSend)
        ],
      ),
    );
  }
}
