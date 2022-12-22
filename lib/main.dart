// ignore_for_file: must_be_immutable
import 'package:blobonotas/data/task_inherited.dart';
import 'package:blobonotas/view/initial_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: TaskInherited(
        child: const InitialScreen(),
      ),
    );
  }
}
