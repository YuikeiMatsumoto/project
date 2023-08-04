import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lib/src/constants/constants.dart';

Future<Album> fetchAlbum() async {
  final responseBTC = await http.get(
      Uri.parse(CurrentCryptoCurrenciesSpotTrading.bitcoin.URL));

  if (responseBTC.statusCode == 200) {
    return Album.fromJson(jsonDecode(responseBTC.body));
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
      status: json['status'],
      data: json['data'],
      responsetime: json['responsetime'],
    );
  }
}

class network extends StatefulWidget {
  const network({super.key});

  @override
  State<network> createState() => _networkState();
}

class _networkState extends State<network> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
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
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.data.first[lastTradedPrice]);
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
