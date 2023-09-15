import 'package:flutter/material.dart';
import 'package:lib/src/features/move_app/app_tab.dart';
import 'create_account.dart';
import 'package:lib/src/constants/constants.dart';
import 'package:lib/src/database/database.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:crypt/crypt.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: loginText,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isObscure = true;
  final inputMailController = TextEditingController();
  final inputPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,  //leadingWidthを設定する
        leading: TextButton(
          child: const Text(backHomeTabButton),
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => const MyApp()),);
          },
        ),
        centerTitle: true,
        title: const Text(loginText),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: inputMailController,
                  decoration: const InputDecoration(
                    labelText: inputMailAddress,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  obscureText: _isObscure,
                  controller: inputPassController,
                  decoration: InputDecoration(
                      labelText: inputPassword,
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }
                      )
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: (){
                      final inputMailText = inputPassController.text;
                      final inputPassText = inputMailController.text;
                      var randomInputMailSalt = Crypt.sha256(inputMailText);
                      var inputMailSaltValue = randomInputMailSalt.toString().runes.map((v) => String.fromCharCode(v ^ 2)).join();
                      var randomInputPassSalt = Crypt.sha256(inputPassText);
                      var inputPassSaltValue = randomInputPassSalt.toString().runes.map((v) => String.fromCharCode(v ^ 2)).join();

                      var bytesInputMail = utf8.encode(inputMailText);
                      var digestInputMail = sha256.convert(bytesInputMail);
                      var bytesHashedInputMail = utf8.encode(inputMailSaltValue + digestInputMail.toString() + pepperValue);
                      var digestHashedInputMail = sha256.convert(bytesHashedInputMail);
                      var bytesInputPass = utf8.encode(inputPassText);
                      var digestInputPass = sha256.convert(bytesInputPass);
                      var bytesHashedInputPass = utf8.encode(inputPassSaltValue + digestInputPass.toString() + pepperValue);
                      var digestHashedInputPass = sha256.convert(bytesHashedInputPass);

                      switch (hashedMail == digestHashedInputMail && hashedPass == digestHashedInputPass) {
                        case true:
                          print(successedLogin);
                        default:
                          print(failedLogin);
                          break;
                      }
                    },
                    child: const Text(loginText)
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: const Text(createAccountText), onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const createAccount()),);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
