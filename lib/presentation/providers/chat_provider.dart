import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  
  List<Message> message = [
    Message(text: 'Hola Anyel', fromWho: FromWho.me),
    Message(text: 'Hola Anyel', fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String text) async {
    message.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
  }
}
