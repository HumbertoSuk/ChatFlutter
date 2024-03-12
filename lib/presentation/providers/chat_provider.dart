import 'package:flutter/material.dart';
import 'package:practica2/presentation/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Es un mundo enfermo y triste?', fromWho: FromWho.me),
    Message(
        text: 'Si es un mundo enfermo y triste',
        fromWho: FromWho.hers,
        imageURl:
            "https://i.pinimg.com/originals/79/e2/a8/79e2a8fd74dea013742491982721b888.gif"),
    Message(
        text: 'O?',
        fromWho: FromWho.hers,
        imageURl:
            "https://media1.tenor.com/m/snFlIbbmnBwAAAAd/hotline-miami-nuke.gif"),
    Message(text: 'O', fromWho: FromWho.me),
    Message(
        text: 'z?',
        fromWho: FromWho.hers,
        imageURl:
            'https://media1.tenor.com/m/snFlIbbmnBwAAAAd/hotline-miami-nuke.gif'),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners();
  }
}
