import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const GMOApiRoute = 'https://api.coin.z.com/public';

Future<Album> fetchAlbum() async {
  final responseBTC = await http
      .get(Uri.parse('$GMOApiRoute/v1/ticker?symbol=BTC'));

  if (responseBTC.statusCode == 200) {
    return Album.fromJson(jsonDecode(responseBTC.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int status;
  List<Map<String, String>> data;
  late Map<String, String> parameter = data.elementAt(0);
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

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      title: 'GMO coin data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('GMO coin data'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.data.first['ask']);
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
