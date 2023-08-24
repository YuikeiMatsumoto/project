import 'package:flutter/material.dart';
import 'package:lib/src/constants/constants.dart';
import 'package:lib/src/features/rate/RateTabBar.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 1, // タブの数
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(rateScreenTabName),
          bottom: const TabBar(
            tabs: <Widget>[Tab(text: cryptoCurrencyTabName),],
          ),
        ),
        
        body: const TabBarView(
          children: <Widget>[RateTabBar(cryptoCurrencyTabName),],
        ),
      ),
    );
  }
}
