import 'package:flutter/material.dart';
import 'package:lib/src/constants/constants.dart';

class userinfo extends StatelessWidget {
  const userinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(userAccountText),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(inputAccountNameForm, style: TextStyle(fontSize: 24,),),
              ),
              const SizedBox(height: 20.0,),
              Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(accountNameText, style: const TextStyle(fontSize: 24,),),
              ),
              const SizedBox(height: 50.0,),
              Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text(inputMailAddressForm, style: TextStyle(fontSize: 24,),),
              ),
              const SizedBox(height: 20.0,),
              Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(mailAddressText, style: const TextStyle(fontSize: 24),),
              ),
              const SizedBox(height: 50.0,),
              Container(
                color: Colors.yellow,
                alignment: Alignment.center,
                child: const Text(inputPasswordForm, style: TextStyle(fontSize: 24),),
              ),
              const SizedBox(height: 20.0,),
              Container(
                color: Colors.yellow,
                alignment: Alignment.center,
                child: Text(passwordText, style: const TextStyle(fontSize: 24),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
