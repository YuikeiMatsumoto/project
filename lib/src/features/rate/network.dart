import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lib/src/constants/constants.dart';

Stream<Album> fetchAlbum() async* {
  final responseBTC = await http.get(
      Uri.parse(CurrentCryptoCurrenciesSpotTrading.bitcoin.URL));

  if (responseBTC.statusCode == 200) {
    yield Album.fromJson(jsonDecode(responseBTC.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int status;
  final List data;
  final String responsetime;

  Album({
    required this.status,
    required this.data,
    required this.responsetime,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      status: json[jsonKeyNameStatus],
      data: json[jsonKeyNameData],
      responsetime: json[jsonKeyNameResponseTime],
    );
  }
}

class network extends StatefulWidget {
  network({super.key});

  String? currentLastValue;

  @override
  State<network> createState() => _networkState();
}

class _networkState extends State<network> {
  late Stream<Album> streamAlbum;

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
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                currentLastValue = snapshot.data!.data.first[lastTradedPrice];
                debugPrint(currentLastValue.toString());
                return Text(currentLastValue.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
