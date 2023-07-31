import 'package:flutter/material.dart';

import 'package:lib/src/features/home/homescreen/home.dart';
import 'package:lib/src/features/rate/graph.dart';
import 'package:lib/src/features/rate/rate.dart';
import 'package:lib/src/features/chat/chat.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
    const GraphScreen(),
    RateScreen(),
    const ChatScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() { _selectedIndex = index;});
  }

  @override
  Widget build(BuildContext context) {
    List tabName = ['ホーム', 'グラフ', 'レート', 'チャット'];
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: const Icon(Icons.home), label: tabName[0]),
            BottomNavigationBarItem(icon: const Icon(Icons.auto_graph), label: tabName[1]),
            BottomNavigationBarItem(icon: const Icon(Icons.rate_review), label: tabName[2]),
            BottomNavigationBarItem(icon: const Icon(Icons.chat), label: tabName[3]),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}
