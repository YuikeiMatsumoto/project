import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:crypto/crypto.dart';
import 'package:lib/src/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
    join(await getDatabasesPath(), 'user_account_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE Accounts(id INTEGER PRIMARY KEY, name TEXT, mail_address TEXT, password TEXT)',
      );
    },
    version: 1,
  );

  Future<void> insertAccount(Account account) async {
    final db = await database;

    await db.insert(
      'accounts',
      account.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Account>> accounts() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('accounts');

    return List.generate(maps.length, (i) {
      return Account(
        id: maps[i]['id'],
        name: maps[i]['name'],
        mail_address: maps[i]['mail_address'],
        password: maps[i]['password'],
      );
    });
  }

  Future<void> updateAccount(Account account) async {
    final db = await database;

    await db.update(
      'accounts',
      account.toMap(),
      where: 'id = ?',
      whereArgs: [account.id],
    );
  }

  Future<void> deleteAccount(int id) async {
    final db = await database;

    await db.delete(
      'accounts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  var fido = Account(
    id: 0,
    name: accountNameText,
    mail_address: mailAddressText,
    password: passwordText,
  );

  var bytes1 = utf8.encode(fido.name);
  var digest1 = sha256.convert(bytes1);
  var bytes2 = utf8.encode(fido.mail_address);
  var digest2 = sha256.convert(bytes2);
  var bytes3 = utf8.encode(fido.password);
  var digest3 = sha256.convert(bytes3);

  await insertAccount(fido);

  print(await accounts());

  fido = Account(
    id: fido.id,
    name: digest1.toString(),
    mail_address: digest2.toString(),
    password: digest3.toString(),
  );
  await updateAccount(fido);

  print(await accounts());

  await deleteAccount(fido.id);

  print(await accounts());
}

class Account {
  final int id;
  final String name;
  final String mail_address;
  final String password;

  const Account({
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
    return 'Account{id: $id, name: $name, mail_address: $mail_address, password: $password}';
  }
}