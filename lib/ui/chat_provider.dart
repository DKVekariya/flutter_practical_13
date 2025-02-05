import 'package:flutter/material.dart';
import '../data/repositories/chat_model.dart';
import '../data/models/user.dart';


class MessageProvider extends ChangeNotifier {
  late ChatModel chatModel;

  MessageProvider() {
    final userA = User(id: '1', name: 'Chano');
    final userB = User(id: '2', name: 'Mago');
    chatModel = ChatModel(
      sender: userA,
      receiver: userB,
      chatId: 'chat_1_2',
    );
  }

  void notify() {
    notifyListeners();
  }
}