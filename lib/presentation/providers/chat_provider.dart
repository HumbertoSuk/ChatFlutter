import 'package:flutter/material.dart';
import 'package:practica2/presentation/domain/entities/message.dart';
import 'package:practica2/config/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    if (text.endsWith('?')) {
      await herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatController.animateTo(chatController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  Future<void> herReply() async {
    final Message herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
  }
}
