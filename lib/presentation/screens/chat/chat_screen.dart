import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(1),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media.sitioandino.com.ar/p/4578cbddd80d3fa57fd632a8c82fa24a/adjuntos/335/imagenes/000/643/0000643063/790x0/smart/netflix.jpg'),
          ),
        ),
        title: const Text("behh"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Establece el fondo con un gradiente lineal negro semi-transparente
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(221, 107, 5, 99),
            Color.fromARGB(255, 117, 29, 151)
          ],
        ),
      ),
      // Asegura que el contenido no se superponga con el área segura del dispositivo
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              // Muestra una lista de mensajes simulados
              child: ListView.builder(
                itemCount: 3, // Ejemplo: 3 mensajes
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Mensaje $index'),
                    subtitle: Text('Usuario'),
                  );
                },
              ),
            ),
            // Agrega un campo de texto para escribir mensajes y un botón para enviarlos
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Escribe un mensaje...',
                        filled: true,
                        fillColor: Color.fromARGB(255, 83, 77, 77),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      // Lógica para enviar el mensaje
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
