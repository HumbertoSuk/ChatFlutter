import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final enfoque = FocusNode();

    final UnderlineInputBorder outLineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));

    final decoration = InputDecoration(
        hintText: 'ingresa texto',
        enabledBorder: outLineInputBorder,
        focusedBorder: outLineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            final textValue = textController.value.text;
            print('impresion de envio: $textValue');
            textController.clear();
          },
        ));

    // return TextFormField(decoration: decoration);
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
        decoration: setDecoration(
            inputBorder: OutLineInputBorder(),
            onPressed: () => onPressed2(textController: textController)));
  }

  UnderlineInputBorder OutLineInputBorder() => UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20));

  InputDecoration setDecoration(
          {required inputBorder, required void Function() onPressed}) =>
      InputDecoration(
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.send_and_archive_outlined),
            onPressed: onPressed,
          ));

  onPress({required TextEditingController textController}) {
    final textValue = textController.value.text;
    print('impresion dle boton de envio: $textValue');
    textController.clear();
  }

  onPressed2({required TextEditingController textController}) {
    final textValue = textController.value.text;
    print('impresión de la nueva función: $textValue');
    textController.clear();
  }
}
