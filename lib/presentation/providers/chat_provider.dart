import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola Anyel', fromWho: FromWho.me),
    Message(text: 'Como estas? ', fromWho: FromWho.hers),
    Message(text: 'Bien y tu?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    // todo: enviar el mensaje
    final newMessage = Message(text: text, fromWho: FromWho.me);
    // agregar el mensaje a la lista
    messageList.add(newMessage);

    
    //message.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
