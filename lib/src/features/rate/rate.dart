import 'package:flutter/material.dart';
import 'package:lib/src/constants/constants.dart';

class RateScreen extends StatelessWidget {
  RateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 1, // タブの数
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(v['Ra'].toString()),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: v['Cr']),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            NestedTabBar(v['Cr'].toString()),
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

  List secondTabName = [v['ExAc'], v['ExLe'], v['Sa'], v['CrFX']];
  List virtualCurrency = ['BTC', 'ETH', 'BCH', 'LTC', 'XRP'];

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
            Tab(child: Text(secondTabName[0], style: const TextStyle(color: Colors.black, fontSize: 12))),
            Tab(child: Text(secondTabName[1], style: const TextStyle(color: Colors.black, fontSize: 12))),
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
                return ListTile(title: Text(virtualCurrency[index]));
              }, separatorBuilder: (context, index) {
                return const Divider(thickness: 1, color: Colors.black);
                }, itemCount: virtualCurrency.length),
            ],
          ),
        ),
      ],
    );
  }
}
