import 'package:flutter/material.dart';

import 'package:lib/src/features/home/homescreen/home.dart';
import 'package:lib/src/features/rate/rate.dart';
import 'package:lib/src/features/chat/chat.dart';
import 'package:lib/src/constants/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryTextTheme: const TextTheme(
          displayMedium: TextStyle(fontSize: 24, color: Colors.white),
        )
      ),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static final _screens = [
    const HomeScreen(),
    RateScreen(),
    const ChatScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() { _selectedIndex = index;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: homeScreenTabName),
            BottomNavigationBarItem(icon: Icon(Icons.rate_review), label: rateScreenTabName),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: chatScreenTabName),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}