import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lib/src/constants/constants.dart';
import 'package:lib/src/features/rate/apiConstants.dart';

Future<Album> fetchAlbum() async {

  final responseBTC = await http.get(
      Uri.parse(CurrentCryptoCurrenciesSpotTrading.bitcoin.URL));

  if (responseBTC.statusCode == 200) {
    yield Album.fromJson(jsonDecode(responseBTC.body));
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
  late Future<Album> futureAlbum;

  final StreamController lastController = StreamController();

  @override
  void initState() {
    super.initState();
    streamAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: Center(
          child: StreamBuilder<Album>(
            stream: streamAlbum,
            builder: (context, AsyncSnapshot<Album> snapshot) {
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
                  debugPrint(currentLastValue.toString());
                  return Text(currentLastValue.toString());

                  case false:
                  return const Text(disconnection);
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
