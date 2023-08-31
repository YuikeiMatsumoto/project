import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:lib/src/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'app_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE apps(id INTEGER PRIMARY KEY, name TEXT, pass INTEGER)',
      );
    },
    version: 1,
  );

  Future<void> insertApp(App app) async {
    final db = await database;
    await db.insert(
      'apps',
      app.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<App>> apps() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('apps');

    return List.generate(maps.length, (i) {
      return App(
        id: maps[i]['id'],
        name: maps[i]['name'],
        mail_address: maps[i]['mail_address'],
        password: maps[i]['password'],
      );
    });
  }

  Future<void> updateApp(App app) async {
    final db = await database;

    await db.update(
      'apps',
      app.toMap(),
      where: 'id = ?',
      whereArgs: [app.id],
    );
  }

  Future<void> deleteApp(int id) async {
    final db = await database;

    await db.delete(
      'apps',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  var fido = App(
    id: 0,
    name: accountNameText,
    mail_address: mailAddressText,
    password: passwordText,
  );

  await insertApp(fido);

  print(await apps());

  fido = App(
    id: fido.id,
    name: fido.name,
    mail_address: fido.mail_address,
    password: fido.password,
  );
  await updateApp(fido);

  print(await apps());

  await deleteApp(fido.id);

  print(await apps());
}

class App {
  final int id;
  final String name;
  final String mail_address;
  final String password;

  const App({
    required this.id,
    required this.name,
    required this.mail_address,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mail_address': mail_address,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'App{id: $id, name: $name, mail_address: $mail_address, password: $password}';
  }
}
