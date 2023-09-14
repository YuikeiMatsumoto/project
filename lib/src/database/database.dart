import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:crypto/crypto.dart';
import 'package:crypt/crypt.dart';
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

  var randomSalt = Crypt.sha256(fido.name);
  debugPrint(randomSalt.toString());
  var saltValue = randomSalt.toString().runes.map((v) => String.fromCharCode(v ^ 2)).join();

  var bytesName = utf8.encode(fido.name);
  var digestName = sha256.convert(bytesName);
  var bytesHashedName = utf8.encode(saltValue + digestName.toString() + pepperValue);
  var digestHashedName = sha256.convert(bytesHashedName);
  var bytesMail = utf8.encode(fido.mail_address);
  var digestMail = sha256.convert(bytesMail);
  var bytesHashedMail = utf8.encode(saltValue + digestMail.toString() + pepperValue);
  var digestHashedMail = sha256.convert(bytesHashedMail);
  var bytesPass = utf8.encode(fido.password);
  var digestPass = sha256.convert(bytesPass);
  var bytesHashedPass = utf8.encode(saltValue + digestPass.toString() + pepperValue);
  var digestHashedPass = sha256.convert(bytesHashedPass);

  await insertAccount(fido);

  print(await accounts());

  fido = Account(
    id: fido.id,
    name: digestHashedName.toString(),
    mail_address: digestHashedMail.toString(),
    password: digestHashedPass.toString(),
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