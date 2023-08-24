import 'package:lib/src/constants/constants.dart';

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
