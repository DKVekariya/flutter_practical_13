import 'package:flutter_practical_13/data/models/user.dart';

class Message {
  final String chatId;
  final User sentBy;
  final User sentTo;
  final String content;
  final DateTime timestamp;
  final MessageType messageType;
  late final MessageStatus status;

  Message({
    required this.chatId,
    required this.sentBy,
    required this.sentTo,
    required this.content,
    required this.timestamp,
    required this.messageType,
    required this.status,
  });
}

enum MessageStatus {
  sent,
  delivered,
  read,
}

enum MessageType {
  text,
  image,
  video,
  file,
}