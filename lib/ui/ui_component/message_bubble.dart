import 'package:flutter/material.dart';
import '../../data/models/message.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isSender;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    final alignment = isSender ? Alignment.centerRight : Alignment.centerLeft;

    final timeFormatted = DateFormat('HH:mm').format(message.timestamp);

    IconData statusIcon = Icons.check_circle_outline;
    switch (message.status) {
      case MessageStatus.sent:
        statusIcon = Icons.check_circle_outline;
        break;
      case MessageStatus.delivered:
        statusIcon = Icons.check_circle;
        break;
      case MessageStatus.read:
        statusIcon = Icons.check_circle;
        break;
    }

    Widget messageContent;
    switch (message.messageType) {
      case MessageType.text:
        messageContent = Text(
          message.content,
          style: TextStyle(
            color: isSender ? Colors.black : Colors.black,
            fontSize: 16.0,
          ),
        );
        break;
      case MessageType.image:
        messageContent = Image.network(
          message.content,
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover,
        );
        break;
      case MessageType.video:
        messageContent = Text('Video: ${message.content}');
        break;
      case MessageType.file:
        messageContent = Text('File: ${message.content}');
        break;
    }

    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue[200] : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: !isSender ? Radius.zero : const Radius.circular(16),
            bottomRight: isSender ? Radius.zero : const Radius.circular(16),
          ),
        ),
        constraints: BoxConstraints(
          maxWidth: 300,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // Text(
            //   message.sentBy.name,
            //   style: TextStyle(
            //     color: isSender ? Colors.white : Colors.black,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 10.0,
            //   ),
            // ),
            // const SizedBox(height: 4.0),
            messageContent,
            const SizedBox(height: 4.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment:
              isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Text(
                  timeFormatted,
                  style: TextStyle(
                    color:Colors.black54,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(width: 8.0),
                Icon(statusIcon,
                    color: message.status == MessageStatus.delivered ? Colors.blue : Colors.grey,
                    size: 12.0,
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
