import 'package:chat_app/config/helpers/get_yes_no_answer.dart';
import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final  getYesNoAnswer = GetYesNoAnswer();

  
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

    if (text.endsWith('?')) {
       herReply();
    }
    
    //message.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
    moveScrollToBottom();
  }
  Future <void> herReply() async {
    final herMessage = await GetYesNoAnswer().getAnswer();
    messageList.add(herMessage);
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
