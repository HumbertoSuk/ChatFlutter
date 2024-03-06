import 'package:flutter/material.dart';

class ReceivedMessage extends StatefulWidget {
  const ReceivedMessage({
    Key? key,
  }) : super(key: key);

  @override
  _ReceivedMessageState createState() => _ReceivedMessageState();
}

class _ReceivedMessageState extends State<ReceivedMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

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
                      "Si, es un mundo enfermo y triste...",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Aquí agregamos la clase _ImageBubble con el GIF proporcionado
                _ImageBubble(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
          "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExYTFwcGp4bDFlN3k0cGc0cjE1Ym1mbGw1Y3lydG5na2V5Y3RiM2g3aiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/gHuFuI2X2jhS0/giphy.gif",
          width: size.size.width - 0.7,
          height: 200,
          fit: BoxFit.cover),
    );
  }
}
