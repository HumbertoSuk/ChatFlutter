import 'package:flutter/material.dart';

class MyMessageBubble extends StatefulWidget {
  const MyMessageBubble({Key? key}) : super(key: key);

  @override
  _MyMessageBubbleState createState() => _MyMessageBubbleState();
}

class _MyMessageBubbleState extends State<MyMessageBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Inicialización del controlador de animación
    _controller = AnimationController(
      vsync: this, // Necesario para la sincronización vertical
      duration: Duration(milliseconds: 500), // Duración de la animación
    );

    // Creación de la animación
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Iniciar la animación
    _controller.forward();
  }

  @override
  void dispose() {
    // Liberar recursos al finalizar
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AnimatedBuilder(
      animation: _animation, // Asignar la animación al AnimatedBuilder
      builder: (context, child) {
        return Opacity(
          opacity: _animation
              .value, // Establecer la opacidad según el valor de la animación
          child: Transform.translate(
            offset: Offset(
                0,
                (1 - _animation.value) *
                    50), // Desplazamiento vertical según el valor de la animación
            child: child,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF6F0DE2),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Es un mundo enfermo y triste?",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
