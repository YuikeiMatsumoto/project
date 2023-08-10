import 'package:flutter/material.dart';
import 'package:lib/src/features/move_app/app_tab.dart';
import 'create_account.dart';
import 'package:lib/src/constants/constants.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,  //leadingWidthを設定する
        leading: TextButton(
          child: const Text(
            backHomeTabButton,
            style: TextStyle(
              color: Colors.white,  //文字の色を白にする
              fontWeight: FontWeight.bold,  //文字を太字する
              fontSize: 12.0,  //文字のサイズを調整する
            ),
          ),
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
                  decoration: const InputDecoration(
                    labelText: inputUserName,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      labelText: inputPassword,
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          })),
                ),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: (){},
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