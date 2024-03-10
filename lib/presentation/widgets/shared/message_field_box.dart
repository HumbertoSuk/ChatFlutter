import 'package:flutter/material.dart';
import 'package:practica2/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final enfoque = FocusNode();

    final UnderlineInputBorder outLineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    );

    final decoration = InputDecoration(
      hintText: 'Ingresa texto',
      enabledBorder: outLineInputBorder,
      focusedBorder: outLineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textController.value.text;
          if (textValue.isNotEmpty) {
            final chatProvider =
                Provider.of<ChatProvider>(context, listen: false);
            chatProvider.sendMessage(textValue);
            textController.clear();
          }
        },
      ),
    );

    return TextFormField(
      controller: textController,
      focusNode: enfoque,
      onFieldSubmitted: (value) {
        print('valor de submit: $value');
        textController.clear();
        enfoque.requestFocus();
      },
      onTapOutside: (event) {
        enfoque.unfocus();
      },
      decoration: decoration,
    );
  }
}
