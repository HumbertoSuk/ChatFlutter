import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final UnderlineInputBorder outLineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));
    return TextFormField(
        decoration: InputDecoration(
            enabledBorder: outLineInputBorder,
            focusedBorder: outLineInputBorder,
            filled: true,
            suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            )));
  }
}
