// ignore_for_file: unused_import

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/maker.dart';
import '../models/number_trivia_model.dart';

abstract class CatalogRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Iterable<Category>> getCategories();

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Iterable<Maker>> getMakers();
}

class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  final http.Client client;

  static const String baseUrl =
      "https://motorcycle-specs-database.p.rapidapi.com";
  static const String rapidAPIKey =
      '8aded21a64msh8c903c14ef97a29p13041ajsn117e83620b51';
  static const String rapidAPIHost = 'motorcycle-specs-database.p.rapidapi.com';

  CatalogRemoteDataSourceImpl({required this.client});

  Future<Iterable<Map<String, dynamic>>> _getResponseFromUrl(String url) async {
    var uri = Uri.parse('$baseUrl/$url');
    final response = await client.get(uri, headers: {
      'X-RapidAPI-Key': rapidAPIKey,
      'X-RapidAPI-Host': rapidAPIHost,
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Iterable<Category>> getCategories() {
    _getResponseFromUrl('category');
    return Future.value([]);
  }

  @override
  Future<Iterable<Maker>> getMakers() {
    _getResponseFromUrl('make');
    return Future.value([]);
  }
}
