import 'package:flutter/material.dart';
import 'package:lib/src/features/home/account/login.dart';
import 'userinfo.dart';
import 'package:lib/src/features/home/account/logout.dart';
import 'package:lib/src/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(homeScreenTabName),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(child: const Text(loginText), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => login()),);
                },
              ),
              ElevatedButton(child: const Text(userAccountText), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const userinfo()),);
                },
              ),
              ElevatedButton(child: const Text(logoutText), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const logout()),);
                },
              ),
            ],
          )
      ),
    );
  }
}
