import 'package:flutter/material.dart';
import 'package:lib/src/constants/constants.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(chatScreenTabName),
      ),
      body: const Center(
          child: Text(chatScreenTabName, style: TextStyle(fontSize: 32.0))),
    );
  }
}