import 'package:flutter/material.dart';
import 'package:lib/src/constants/constants.dart';
import 'package:lib/src/features/rate/network.dart';

network _network = network();

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
          title: const Text(rateScreenTabName),
          bottom: const TabBar(
            tabs: <Widget>[Tab(text: cryptoCurrencyTabName),],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[NestedTabBar(cryptoCurrencyTabName),],
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

  List virtualCurrency = [
    CryptoCurrenciesName.bitcoin.Abbreviation,
    CryptoCurrenciesName.ethereum.Abbreviation,
    CryptoCurrenciesName.bitcoinCash.Abbreviation,
    CryptoCurrenciesName.litecoin.Abbreviation,
    CryptoCurrenciesName.ripple.Abbreviation
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          tabs: const <Widget>[
            Tab(child: Text(exchangeSpotTabName,
                style: TextStyle(color: Colors.black, fontSize: 12))
            ),
            Tab(child: Text(exchangeLeverageTabName,
                style: TextStyle(color: Colors.black, fontSize: 12))
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListView.separated(itemBuilder: (context, index) {
                debugPrint(currentLastValue.toString());
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
