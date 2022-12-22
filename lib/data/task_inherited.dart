import 'package:blobonotas/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    Task(
      nome: 'Aprender Flutter',
      foto: 'dash.png',
      dificuldade: 3,
    ),
    Task(
      nome: 'Andar de Bike',
      foto: 'bike.webp',
      dificuldade: 2,
    ),
    Task(
      nome: 'Meditar',
      foto: 'meditar.jpeg',
      dificuldade: 5,
    ),
    Task(
      nome: 'Jogar',
      foto: 'jogar.png',
      dificuldade: 4,
    ),
    Task(
      nome: 'Academia',
      foto: 'academia.jpg',
      dificuldade: 3,
    ),
    Task(
      nome: 'Ler',
      foto: 'livro.jpg',
      dificuldade: 1,
    ),
  ];

  void newTask(String name, String photo, int difficult) {
    taskList.add(Task(nome: name, foto: photo, dificuldade: difficult));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
