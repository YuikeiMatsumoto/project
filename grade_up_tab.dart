import 'package:flutter/material.dart';

List titles = ['取引所　現物', '取引所　レバ', '販売所', '暗号資産FX', 'ホーム', 'チャート', '販売所レート'];

void main() => runApp(const HomeScreen());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var _title = 'HOME';
  var _currentIndex = 1;

  final _pages = [
     Container(
      child: const Text('Home'),
      alignment: Alignment.center,
      color: Colors.green,
    ),
    Container(
      child: const Text('Chart'),
      alignment: Alignment.center,
      color: Colors.red,
    ),
    Container(
      child: const Text('Rate'),
      alignment: Alignment.center,
      color: Colors.yellow,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: DefaultTabController(
        initialIndex: 0, // 最初に表示するタブ
        length: 4, // タブの数
        child: Scaffold(
          appBar: AppBar(
            title: Text(_title),
            centerTitle: true,
          ),
          body: _pages[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
                BottomNavigationBarItem(icon: Icon(Icons.add_chart), label: 'CHART'),
                BottomNavigationBarItem(icon: Icon(Icons.rate_review), label: 'RATE'),
              ],
            currentIndex: _currentIndex,
              onTap: _onTap,
          ),
        ),
      ),
    );
  }
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0: _title = 'HOME';
        break;
        case 1: _title = 'CHART';
        break;
        case 2: _title = 'RATE';
        break;
      }
        }
    );
  }
}
