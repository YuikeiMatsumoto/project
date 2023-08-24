import 'package:flutter/material.dart';
import 'package:lib/src/constants/constants.dart';

class RateTabBar extends StatefulWidget {
  const RateTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<RateTabBar> createState() => _RateTabBarState();
}

class _RateTabBarState extends State<RateTabBar>
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
                return ListTile(title: Text(currentLastValue.toString()));
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
