import 'package:flutter/material.dart';
import 'package:yes_no_chat/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes  No App',
      debugShowCheckedModeBanner: false,
      theme: Apptheme(selectedColor: 4).theme(),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Hola mundo tecNM"),
          ),
          body: Center(
            child: FilledButton.tonal(
                onPressed: () {}, child: const Text("picale aqui")),
          )),
    );
  }
}
