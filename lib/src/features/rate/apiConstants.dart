import 'package:lib/src/constants/constants.dart';

// Bitcoin
class BitcoinAlbum {
  final int status;
  final List data;
  final String responsetime;

  BitcoinAlbum({
    required this.status,
    required this.data,
    required this.responsetime,
  });

  factory BitcoinAlbum.fromJson(Map<String, dynamic> json) {
    return BitcoinAlbum(
      status: json[jsonKeyNameStatus],
      data: json[jsonKeyNameData],
      responsetime: json[jsonKeyNameResponseTime],
    );
  }
}

// Ethereum
class EthereumAlbum {
  final int status;
  final List data;
  final String responsetime;

  EthereumAlbum({
    required this.status,
    required this.data,
    required this.responsetime,
  });

  factory EthereumAlbum.fromJson(Map<String, dynamic> json) {
    return EthereumAlbum(
      status: json[jsonKeyNameStatus],
      data: json[jsonKeyNameData],
      responsetime: json[jsonKeyNameResponseTime],
    );
  }
}

// BitcoinCash
class BitcoinCashAlbum {
  final int status;
  final List data;
  final String responsetime;

  BitcoinCashAlbum({
    required this.status,
    required this.data,
    required this.responsetime,
  });

  factory BitcoinCashAlbum.fromJson(Map<String, dynamic> json) {
    return BitcoinCashAlbum(
      status: json[jsonKeyNameStatus],
      data: json[jsonKeyNameData],
      responsetime: json[jsonKeyNameResponseTime],
    );
  }
}

// Litecoin
class LitecoinAlbum {
  final int status;
  final List data;
  final String responsetime;

  LitecoinAlbum({
    required this.status,
    required this.data,
    required this.responsetime,
  });

  factory LitecoinAlbum.fromJson(Map<String, dynamic> json) {
    return LitecoinAlbum(
      status: json[jsonKeyNameStatus],
      data: json[jsonKeyNameData],
      responsetime: json[jsonKeyNameResponseTime],
    );
  }
}

// Ripple
class RippleAlbum {
  final int status;
  final List data;
  final String responsetime;

  RippleAlbum({
    required this.status,
    required this.data,
    required this.responsetime,
  });

  factory RippleAlbum.fromJson(Map<String, dynamic> json) {
    return RippleAlbum(
      status: json[jsonKeyNameStatus],
      data: json[jsonKeyNameData],
      responsetime: json[jsonKeyNameResponseTime],
    );
  }
}
