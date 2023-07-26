import 'package:flutter/material.dart';

import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';

class RateScreen extends StatelessWidget {
  RateScreen({Key? key}) : super(key: key);

  List tabName = ['ページ1', 'ページ2'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 2, // タブの数
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('レート'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: tabName[0]),
              Tab(text: tabName[1]),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            NestedTabBar(tabName[0]),
            NestedTabBar(tabName[1]),
          ],
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  List secondTabName = ['ページ1', 'ページ2', 'ページ3', 'ページ4'];
  List virtualCurrency = ['BTC', 'ETH', 'BCH', 'LTC', 'XRP', 'XEM', 'XLM', 'BAT', 'OMG', 'XTZ', 'QTUM', 'ENJ', 'DOT', 'ATOM', 'MKR', 'DAI', 'XYM', 'MONA', 'FCR', 'ADA', 'LINK', 'ASTR'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: Colors.green,
          ),
          controller: _tabController,
          tabs: <Widget>[
            Tab(child: Text(secondTabName[0], style: const TextStyle(color: Colors.black))),
            Tab(child: Text(secondTabName[1], style: const TextStyle(color: Colors.black))),
            Tab(child: Text(secondTabName[2], style: const TextStyle(color: Colors.black))),
            Tab(child: Text(secondTabName[3], style: const TextStyle(color: Colors.black))),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListView.separated(itemBuilder: (context, index) {
                return ListTile(title: Text(virtualCurrency[index]));
              }, separatorBuilder: (context, index) {
                return const Divider(thickness: 1, color: Colors.black);
                 }, itemCount: virtualCurrency.length),
              ListView.separated(itemBuilder: (context, index) {
                return ListTile(title: Text('BTC${index.toString()}'));
              }, separatorBuilder: (context, index) {
                return const Divider();
                 }, itemCount: 10),
              ListView.separated(itemBuilder: (context, index) {
                return ListTile(title: Text('BTC${index.toString()}'));
              }, separatorBuilder: (context, index) {
                return const Divider();
                 }, itemCount: 10),
              ListView.separated(itemBuilder: (context, index) {
                return ListTile(title: Text('BTC${index.toString()}'));
              }, separatorBuilder: (context, index) {
                return const Divider();
                 }, itemCount: 10),
            ],
          ),
        ),
      ],
    );
  }
}
