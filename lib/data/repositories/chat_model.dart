import 'package:flutter_practical_13/data/models/user.dart';
import '../models/message.dart';

class ChatModel {
  final User sender;
  final User receiver;
  final String chatId;
  final List<Message> _messages = [];

  ChatModel({
    required this.sender,
    required this.receiver,
    required this.chatId,
  });

  void sendMessage(String content, MessageType messageType, User sentBy, User sentTo) {
    final message = Message(
      chatId: chatId,
      sentBy: sentBy,
      sentTo: sentTo,
      content: content,
      timestamp: DateTime.now(),
      messageType: messageType,
      status: MessageStatus.sent,
    );
    _messages.add(message);
  }

  void markMessageDelivered(int messageIndex) {
    if (messageIndex >= 0 && messageIndex < _messages.length) {
      _messages[messageIndex].status = MessageStatus.delivered;
    }
  }

  void markMessageRead(int messageIndex) {
    if (messageIndex >= 0 && messageIndex < _messages.length) {
      _messages[messageIndex].status = MessageStatus.read;
    }
  }

  List<Message> getChatMessages() {
    _messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return _messages;
  }
}