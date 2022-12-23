import 'package:blobonotas/components/task.dart';
import 'package:blobonotas/data/task_dao.dart';
import 'package:blobonotas/data/task_inherited.dart';
import 'package:blobonotas/view/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
        title: const Text('Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
          future: TaskDAO().findAll(),
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );
              case ConnectionState.active:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final Task tarefa = items[index];
                        return tarefa;
                      },
                    );
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text(
                          'Não há tarefas',
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    ),
                  );
                }
                return const Text('Erro ao carregar tarefas!');
            }
            return const Text('Erro desconhecido!');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
