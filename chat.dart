import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('チャット'),
      ),
      body: const Center(
          child: Text('チャット', style: TextStyle(fontSize: 32.0))),
    );
  }
}
