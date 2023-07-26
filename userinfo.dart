import 'package:flutter/material.dart';

class userinfo extends StatelessWidget {
  const userinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ユーザーアカウント'),
      ),
    );
  }
}
