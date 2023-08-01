import 'package:flutter/material.dart';
import 'package:lib/src/features/move_app/app_tab.dart';
import 'create_account.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        title: 'ログイン',
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
          child: Text(
            'ホームに戻る',
            style: TextStyle(
              color: Colors.white,  //文字の色を白にする
              fontWeight: FontWeight.bold,  //文字を太字する
              fontSize: 12.0,  //文字のサイズを調整する
            ),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
          },
        ),
        centerTitle: true,
        title: Text('ログイン'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ユーザー名を入力してください',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      labelText: 'パスワードを入力してください',
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
                    child: const Text('ログイン')
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('アカウント作成'), onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => createAccount()),);
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
