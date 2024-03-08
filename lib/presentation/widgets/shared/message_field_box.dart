import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textcontroler = TextEditingController();
    final focus = FocusNode();

    final UnderlineInputBorder outLineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));

    final decoration = InputDecoration(
        enabledBorder: outLineInputBorder,
        focusedBorder: outLineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            final text = textcontroler.value.text;
            print("boton de envio $text");
            textcontroler.clear();
          },
        ));
    //decoration: decoration
    return TextFormField(
        decoration: decoration,
        controller: textcontroler,
        focusNode: focus,
        onFieldSubmitted: (value) {
          print("sudmit:  $value");
          textcontroler.clear();
          focus.requestFocus();
        });
  }

  UnderlineInputBorder outLineInputBorder() => UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20));

  InputDecoration setDecoration({required InputBorder}) => InputBorder(
      enabledBorder: outLineInputBorder,
      focusedBorder: outLineInputBorder,
      filled: true,
      suffixIcon: IconButton(icon: const Icon(Icons.send), onPressed: () {}));
}
