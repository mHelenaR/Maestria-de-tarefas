import 'package:blobonotas/components/task.dart';
import 'package:blobonotas/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDAO {
  static const String tableSQL = 'CREATE TABLE $_tableName('
      '$_name TEXT,'
      '$_difficult INTEGER,'
      '$_image TEXT'
      ');';

  static const String _tableName = 'taskTable';
  static const String _difficult = 'dificuldade';
  static const String _name = 'nome';
  static const String _image = 'imagem';

  save(Task tarefa) async {
    final Database bancoDados = await getDataBase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      return await bancoDados.insert(_tableName, taskMap);
    } else {
      return await bancoDados.update(
        _tableName,
        taskMap,
        where: '$_name =  ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    final Map<String, dynamic> mapaTarefas = Map();
    mapaTarefas[_name] = tarefa.nome;
    mapaTarefas[_difficult] = tarefa.dificuldade;
    mapaTarefas[_image] = tarefa.foto;

    return mapaTarefas;
  }

  Future<List<Task>> findAll() async {
    final Database bancoDados = await getDataBase();

    final List<Map<String, dynamic>> result =
        await bancoDados.query(_tableName);
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaTarefas) {
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaTarefas) {
      final Task tarefa = Task(
        nome: linha[_name],
        foto: linha[_image],
        dificuldade: linha[_difficult],
      );
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  Future<List<Task>> find(String nomeTarefa) async {
    final Database bancoDados = await getDataBase();

    final List<Map<String, dynamic>> result = await bancoDados
        .query(_tableName, where: '$_name = ?', whereArgs: [nomeTarefa]);

    return toList(result);
  }

  delete(String nomeTarefa) async {
    final Database bancoDados = await getDataBase();
    return bancoDados.delete(
      _tableName,
      where: '$_name = ? ',
      whereArgs: [nomeTarefa],
    );
  }
}
