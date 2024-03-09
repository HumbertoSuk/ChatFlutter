import 'package:flutter/material.dart';
import 'package:practica2/presentation/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Es un mundo enfermo y triste???', fromWho: FromWho.me),
    Message(text: 'Si, es un mundo enfermo y triste', fromWho: FromWho.hers),
    Message(text: 'Si, es un mundo enfermo y triste', fromWho: FromWho.hers)
  ];
}
