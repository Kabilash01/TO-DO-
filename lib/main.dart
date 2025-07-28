import 'package:flutter/material.dart';
import 'package:kabi_todo_app/pages/home_page.dart';

void main() {
  runApp(const KabiTodoApp());
}

class KabiTodoApp extends StatelessWidget {
  const KabiTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KABI TODO APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF70587B),
          brightness: Brightness.light,
        ),
      ),
      home: HomePage(),
    );
  }
}
