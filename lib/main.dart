import 'package:flutter/material.dart';
import 'package:practica2/config/app_theme.dart';
import 'package:practica2/presentation/providers/chat_provider.dart';
import 'package:practica2/presentation/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ChatProvider()),
        ],
        child: MaterialApp(
            title: 'Siiii',
            debugShowCheckedModeBanner: false,
            theme: AppTheme(selectedColor: 4).theme(),
            home: const ChatScreen()));
  }
}
