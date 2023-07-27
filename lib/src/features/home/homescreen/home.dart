import 'package:flutter/material.dart';
import 'login.dart';
import 'userinfo.dart';
import 'logout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ホーム'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(child: const Text('ログイン'), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => login()),);
                },
              ),
              ElevatedButton(child: const Text('ユーザーアカウント'), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const userinfo()),);
                },
              ),
              ElevatedButton(child: const Text('ログアウト'), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const logout()),);
                },
              ),
            ],
          )
      ),
    );
  }
}
