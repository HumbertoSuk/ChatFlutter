import 'dart:math';
import 'package:flutter/material.dart';
import 'package:practica2/presentation/domain/entities/message.dart';

class Message {
  final String text;
  String? imageUrl;
  final FromWho fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});
}

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Es un mundo enfermo y triste???', fromWho: FromWho.me),
    Message(text: 'Si, es un mundo enfermo y triste', fromWho: FromWho.hers),
  ];

  List<String> responses = [
    '¡Hola!',
    '¿Cómo estás?',
    'Estoy bien, ¿y tú?',
    '¡Qué interesante!',
    '¡Cuéntame más!',
    'Eso suena genial.',
    '¿De verdad?'
  ];

  List<String> gifBank = [
    "https://i.pinimg.com/originals/79/e2/a8/79e2a8fd74dea013742491982721b888.gif",
    "https://media.giphy.com/media/3o7buirYcmV5nSwIRW/giphy.gif",
    "https://media1.tenor.com/m/snFlIbbmnBwAAAAd/hotline-miami-nuke.gif",
    "https://media1.tenor.com/m/BZbZo8Z5COEAAAAd/goopwave-julosorel.gif",
  ];

  void sendMessage(String text) {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    // Respuesta automática
    final random = Random();
    if (responses.isNotEmpty) {
      final randomIndex = random.nextInt(responses.length);
      final randomResponse = responses[randomIndex];
      final autoResponse = Message(text: randomResponse, fromWho: FromWho.hers);

      // Agregar GIF aleatorio
      final randomGifIndex = random.nextInt(gifBank.length);
      autoResponse.imageUrl = gifBank[randomGifIndex];
      messageList.add(
          autoResponse); // Agrega la respuesta automática a la lista de mensajes

      // Elimina la respuesta utilizada
      responses.removeAt(randomIndex);

      if (responses.isEmpty) {
        responses = [
          '¡Hola!',
          '¿Cómo estás?',
          'Estoy bien, ¿y tú?',
          '¡Qué interesante!',
          '¡Cuéntame más!',
          'Eso suena genial.',
          '¿De verdad?',
          'Es un mundo enfermo y triste'
        ];
      }
    }

    notifyListeners();
  }
}
