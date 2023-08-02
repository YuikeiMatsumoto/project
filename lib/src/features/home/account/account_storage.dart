import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

  final storage = const FlutterSecureStorage();

  final String _keyName = 'account_name';
  final String _keyMail = 'mail_address';
  final String _keyPass = 'password';
  final String _keyCheck = 'password_check';

  Future setName(String name) async {
    await storage.write(key: _keyName, value: name);
  }

  Future<String?> getName() async {
    return await storage.read(key: _keyName);
  }

  Future setMail(String mail) async {
    await storage.write(key: _keyMail, value: mail);
  }

  Future<String?> getMail() async {
    return await storage.read(key: _keyMail);
  }

  Future setPass(String pass) async {
    await storage.write(key: _keyPass, value: pass);
  }

  Future<String?> getPass() async {
    return await storage.read(key: _keyPass);
  }

  Future setCheck(String check) async {
    await storage.write(key: _keyCheck, value: check);
  }

  Future<String?> getCheck() async {
    return await storage.read(key: _keyCheck);
  }

}
