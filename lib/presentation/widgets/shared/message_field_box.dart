import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
      decoration: _buildInputDecoration(
        inputBorder: _outlineInputBorder(),
        onPressed: () =>
            _onPressed(textController: textController, onValue: onValue),
      ),
    );
  }

  UnderlineInputBorder _outlineInputBorder() => const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      );

  InputDecoration _buildInputDecoration({
    required InputBorder inputBorder,
    required VoidCallback onPressed,
  }) =>
      InputDecoration(
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        hintText: 'Pregunta ?',
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_and_archive_outlined),
          onPressed: onPressed,
        ),
      );

  void _onPressed(
      {required TextEditingController textController,
      required ValueChanged<String> onValue}) {
    final textValue = textController.text;
    onValue(textValue);
    textController.clear();
  }
}
