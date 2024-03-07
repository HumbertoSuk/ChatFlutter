import 'package:flutter/material.dart';

class MessagefieldBox extends StatelessWidget {
  const MessagefieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final UnderlineInputBorder outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));

    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          filled: true,
          suffixIcon: const Icon(Icons.send)),
    );
  }
}
