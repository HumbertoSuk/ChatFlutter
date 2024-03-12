import 'package:flutter/material.dart';

class ReceivedMessage extends StatefulWidget {
  final String message; // Agregamos un parámetro para el mensaje recibido
  final String? gifUrl; // Agregamos un parámetro opcional para la URL del GIF

  const ReceivedMessage({
    Key? key,
    required this.message, // Asignamos el mensaje recibido al parámetro
    this.gifUrl, // Asignamos la URL del GIF al parámetro opcional
  }) : super(key: key);

  @override
  _ReceivedMessageState createState() => _ReceivedMessageState(gifUrl: gifUrl);
}

class _ReceivedMessageState extends State<ReceivedMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final String? gifUrl;

  _ReceivedMessageState({this.gifUrl});

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final message = widget.message;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(0, (1 - _animation.value) * 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFB28FBD),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _ImageBubble(gifUrl: gifUrl),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String? gifUrl;

  const _ImageBubble({Key? key, this.gifUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (gifUrl != null) {
      final size = MediaQuery.of(context).size;
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          gifUrl!,
          width: size.width * 0.65,
          height: size.height * 0.2,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) =>
              (loadingProgress == null)
                  ? child
                  : Container(
                      width: size.width * 0.65,
                      height: size.height * 0.2,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Text("Cargando imagen..."),
                    ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
