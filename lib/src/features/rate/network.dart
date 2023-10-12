import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lib/src/constants/constants.dart';
import 'package:lib/src/features/rate/apiConstants.dart';

Stream<BitcoinAlbum> fetchBitcoinAlbum() async* {
  final responseBTC = await http.get(
      Uri.parse(CurrentCryptoCurrenciesSpotTrading.bitcoin.URL));

  if (responseBTC.statusCode == 200) {
    yield BitcoinAlbum.fromJson(jsonDecode(responseBTC.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Stream<EthereumAlbum> fetchEthereumAlbum() async* {
  final responseETH = await http.get(
      Uri.parse(CurrentCryptoCurrenciesSpotTrading.ethereum.URL));

  if (responseETH.statusCode == 200) {
    yield EthereumAlbum.fromJson(jsonDecode(responseETH.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Stream<BitcoinCashAlbum> fetchBitcoinCashAlbum() async* {
  final responseBCH = await http.get(
      Uri.parse(CurrentCryptoCurrenciesSpotTrading.bitcoinCash.URL));

  if (responseBCH.statusCode == 200) {
    yield BitcoinCashAlbum.fromJson(jsonDecode(responseBCH.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Stream<LitecoinAlbum> fetchLitecoinAlbum() async* {
  final responseLTC = await http.get(
      Uri.parse(CurrentCryptoCurrenciesSpotTrading.litecoin.URL));

  if (responseLTC.statusCode == 200) {
    yield LitecoinAlbum.fromJson(jsonDecode(responseLTC.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Stream<RippleAlbum> fetchRippleAlbum() async* {
  final responseXRP = await http.get(
      Uri.parse(CurrentCryptoCurrenciesSpotTrading.ripple.URL));

  if (responseXRP.statusCode == 200) {
    yield RippleAlbum.fromJson(jsonDecode(responseXRP.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class network extends StatefulWidget {
   const network({super.key});

  @override
  State<network> createState() => _networkState();
}

class _networkState extends State<network> {
  late Stream<BitcoinAlbum> streamBitcoinAlbum;
  late Stream<EthereumAlbum> streamEthereumAlbum;
  late Stream<BitcoinCashAlbum> streamBitcoinCashAlbum;
  late Stream<LitecoinAlbum> streamLitecoinAlbum;
  late Stream<RippleAlbum> streamRippleAlbum;

  final StreamController lastController = StreamController();

  @override
  void initState() {
    super.initState();
    streamBitcoinAlbum = fetchBitcoinAlbum();
    streamEthereumAlbum = fetchEthereumAlbum();
    streamBitcoinCashAlbum = fetchBitcoinCashAlbum();
    streamLitecoinAlbum = fetchLitecoinAlbum();
    streamRippleAlbum = fetchRippleAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          children: [
                StreamBuilder<BitcoinAlbum>(
                  stream: streamBitcoinAlbum,
                  builder: (context, AsyncSnapshot<BitcoinAlbum> snapshot) {
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                        return const Text(noConnection);

                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();

                      case ConnectionState.done:
                        switch(snapshot.hasData){
                          case true:
                            String currentLastValueBTC = snapshot.data!.data.first[lastTradedPrice];

                            return Text(currentLastValueBTC);

                          case false:
                            return const Text(disconnection);
                        }
                    }
                  },
                ),
                StreamBuilder<EthereumAlbum>(
                  stream: streamEthereumAlbum,
                  builder: (context, AsyncSnapshot<EthereumAlbum> snapshot) {
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                        return const Text(noConnection);

                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();

                      case ConnectionState.done:
                        switch(snapshot.hasData){
                          case true:
                            currentLastValue = snapshot.data!.data.first[lastTradedPrice];

                            return Text(currentLastValue);

                          case false:
                            return const Text(disconnection);
                        }
                    }
                  },
                ),
                StreamBuilder<BitcoinCashAlbum>(
                  stream: streamBitcoinCashAlbum,
                  builder: (context, AsyncSnapshot<BitcoinCashAlbum> snapshot) {
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                        return const Text(noConnection);

                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();

                      case ConnectionState.done:
                        switch(snapshot.hasData){
                          case true:
                            currentLastValue = snapshot.data!.data.first[lastTradedPrice];

                            return Text(currentLastValue);

                          case false:
                            return const Text(disconnection);
                        }
                    }
                  },
                ),
                StreamBuilder<LitecoinAlbum>(
                  stream: streamLitecoinAlbum,
                  builder: (context, AsyncSnapshot<LitecoinAlbum> snapshot) {
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                        return const Text(noConnection);

                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();

                      case ConnectionState.done:
                        switch(snapshot.hasData){
                          case true:
                            currentLastValue = snapshot.data!.data.first[lastTradedPrice];

                            return Text(currentLastValue);

                          case false:
                            return const Text(disconnection);
                        }
                    }
                  },
                ),
                StreamBuilder<RippleAlbum>(
                  stream: streamRippleAlbum,
                  builder: (context, AsyncSnapshot<RippleAlbum> snapshot) {
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                        return const Text(noConnection);

                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();

                      case ConnectionState.done:
                        switch(snapshot.hasData){
                          case true:
                            currentLastValue = snapshot.data!.data.first[lastTradedPrice];

                            return Text(currentLastValue);

                          case false:
                            return const Text(disconnection);
                        }
                    }
                  },
                ),
              ],
            )
            ),
        );
  }
}
