import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'model/pizza.dart';

class HttpHelper {
  final String authority = '02z2g.mocklab.io';
  final String path = 'pizzalist';

  static final HttpHelper _httpHelper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() {
    return _httpHelper;
  }

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    try {
      // set a reasonable timeout so the app can fall back quickly
      final http.Response result = await http
          .get(url)
          .timeout(const Duration(seconds: 10));
      if (result.statusCode == HttpStatus.ok) {
        final dynamic jsonResponse = json.decode(result.body);
        List<dynamic> listData;
        if (jsonResponse is List) {
          listData = jsonResponse;
        } else if (jsonResponse is Map) {
          // try to find the first value that is a List (common wrapper formats)
          final firstList = jsonResponse.values.firstWhere(
            (v) => v is List,
            orElse: () => null,
          );
          if (firstList != null && firstList is List) {
            listData = firstList;
          } else {
            throw Exception(
              'Unexpected JSON structure: Map with no list inside',
            );
          }
        } else {
          throw Exception('Unexpected JSON type: ${jsonResponse.runtimeType}');
        }

        List<Pizza> pizzas = listData
            .map<Pizza>((i) => Pizza.fromJson(i))
            .toList();
        return pizzas;
      } else {
        throw Exception('HTTP ${result.statusCode}: ${result.reasonPhrase}');
      }
    } catch (e) {
      // If network fails (timeout, socket), try to load bundled asset as fallback
      try {
        final String asset = await rootBundle.loadString(
          'assets/pizzalist.json',
        );
        final dynamic jsonResponse = json.decode(asset);
        List<dynamic> listData;
        if (jsonResponse is List) {
          listData = jsonResponse;
        } else if (jsonResponse is Map) {
          final firstList = jsonResponse.values.firstWhere(
            (v) => v is List,
            orElse: () => null,
          );
          if (firstList != null && firstList is List) {
            listData = firstList;
          } else {
            throw Exception('Fallback JSON structure not usable');
          }
        } else {
          throw Exception('Fallback JSON type not usable');
        }
        return listData.map<Pizza>((i) => Pizza.fromJson(i)).toList();
      } catch (assetError) {
        // both network and fallback failed — propagate clear message
        throw Exception(
          'Failed to load pizzas (network: $e, fallback: $assetError)',
        );
      }
    }
  }
}
