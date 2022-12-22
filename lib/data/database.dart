import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(tableSQL);
    },
    version: 1,
  );
}

const String tableSQL = 'CREATE TABLE $_tableName('
    '$_name TEXT,'
    '$_difficult INTEGER,'
    '$_image TEXT'
    ');';

const String _tableName = 'taskTable';

const String _difficult = 'dificuldade';

const String _name = 'nome';

const String _image = 'imagem';
