import 'package:flutter/material.dart';
import 'package:practica2/presentation/domain/entities/message.dart';
import 'package:practica2/presentation/providers/chat_provider.dart';
import 'package:practica2/presentation/widgets/my_message_bubble.dart';
import 'package:practica2/presentation/widgets/received_message.dart';
import 'package:practica2/presentation/widgets/shared/message_field_box.dart';
import 'package:practica2/presentation/domain/entities/message.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://media.sitioandino.com.ar/p/4578cbddd80d3fa57fd632a8c82fa24a/adjuntos/335/imagenes/000/643/0000643063/790x0/smart/netflix.jpg',
            ),
          ),
        ),
        title: const Text("Ryan Gosling (>//w//<)<3"),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 63, 4, 73),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatProvider chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatProvider.messageList.length,
                itemBuilder: ((context, index) {
                  print(chatProvider.messageList[index].text);
                  return (chatProvider.messageList[index].fromWho ==
                          FromWho.hers)
                      ? const ReceivedMessage()
                      : MyMessageBubble(
                          message: chatProvider.messageList[index].text);
                }),
              ),
            ),
            const SizedBox(height: 30),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
