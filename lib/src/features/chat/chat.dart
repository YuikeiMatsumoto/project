import 'package:flutter/material.dart';
import 'package:lib/src/constants/constants.dart';
import 'package:lib/src/features/home/homescreen/userinfo.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Container(
                    height: 25,
                    width: 300,
                    alignment: Alignment.center,

                    child: Text(userAccountText),
                    decoration: BoxDecoration(
                    color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text(accountNameText),
                    leading: Icon(Icons.account_circle),
                    trailing: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => userinfo()),);
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                    tileColor: Colors.purple,
                    ),

                  Container(
                    child: ListTile(
                      title: Text("Item 2"),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}