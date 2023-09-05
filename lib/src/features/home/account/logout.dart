import 'package:flutter/material.dart';
import 'package:lib/src/constants/constants.dart';

class logout extends StatelessWidget {
  const logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(logoutText),
      ),
    );
  }
}
