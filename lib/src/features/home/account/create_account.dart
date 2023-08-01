import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lib/src/constants/constants.dart';

class createAccount extends StatelessWidget {
  const createAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(v['Ca'].toString()),
      ),
      body: inputText(),
    );
  }
}

class inputText extends StatelessWidget {
  inputText({super.key});

  late String name;
  late String mail;
  late String pass;
  late String check;
  late String Name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: v['An'],
              ),
              onChanged: (account_name) async{
                name = account_name;
                final storage = FlutterSecureStorage();
                await storage.write(key: Name, value: name);
                await storage.read(key: Name);
              },
            )
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: v['Ma'],
              ),
              onChanged: (mail_address) async{
                mail = mail_address;
                final storage = FlutterSecureStorage();
                await storage.write(key: 'Mail', value: mail);
              },
            )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: v['Pa'],
            ),
            onChanged: (password) async{
              pass = password;
              final storage = FlutterSecureStorage();
              await storage.write(key: 'Pass', value: pass);
            },
          ),
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: v['Pc'],
              ),
              onChanged: (password_check) async{
                check = password_check;
                final storage = FlutterSecureStorage();
                await storage.write(key: 'Check', value: check);
              },
            )
        ),
        ElevatedButton(
            onPressed: (){

            },
            child: Text(v['Fi'].toString())
        ),
      ],
    );
  }
}
