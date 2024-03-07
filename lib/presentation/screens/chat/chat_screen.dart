import 'package:flutter/material.dart';
import 'package:practica2/presentation/widgets/my_message_bubble.dart';
import 'package:practica2/presentation/widgets/received_message.dart';
import 'package:practica2/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(1),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://media.sitioandino.com.ar/p/4578cbddd80d3fa57fd632a8c82fa24a/adjuntos/335/imagenes/000/643/0000643063/790x0/smart/netflix.jpg',
            ),
          ),
        ),
        title: const Text("chat gosling"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Establece el fondo con un gradiente lineal negro semi-transparente
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(221, 107, 5, 99),
            Color.fromARGB(255, 117, 29, 151),
          ],
        ),
      ),
      // Asegura que el contenido no se superponga con el área segura del dispositivo
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 40,
                itemBuilder: ((context, index) {
                  return index % 2 == 0 ? MyMessageBubble() : ReceivedMessage();
                }),
              ),
            ),
            const SizedBox(height: 30),
            const MessagefieldBox(),
          ],
        ),
      ),
    );
  }
}
