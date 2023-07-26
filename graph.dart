import 'package:flutter/material.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('グラフ'),
      ),
      body: const Center(
          child: Text('グラフ', style: TextStyle(fontSize: 32.0))),
    );
  }
}
