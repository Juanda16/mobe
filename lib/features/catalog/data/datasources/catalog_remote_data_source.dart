// ignore_for_file: unused_import

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../../domain/entities/category/category.dart';
import '../../domain/entities/maker/maker.dart';
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

  Future<Map<String, dynamic>> _getResponseFromUrl(String url) async {
    var uri = Uri.parse('$baseUrl/$url');
    print('uri>>> $uri');
    final response = await client.get(uri, headers: {
      'X-RapidAPI-Key': rapidAPIKey,
      'X-RapidAPI-Host': rapidAPIHost,
    });
    final String preProcessResponse = '{"categories":${response.body}}';

    if (response.statusCode == 200) {
      try {
        return json.decode(
          preProcessResponse,
        ) as Map<String, dynamic>;
      } catch (e) {
        print(e);
        return {};
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Iterable<Category>> getCategories() async {
    final Map<String, dynamic> response = await _getResponseFromUrl('category');

    Iterable<Category> categories = (response['categories'] as List)
        .map((category) => Category.fromJson(category));

    print('categories>>> ${categories}');
    return categories;
  }

  @override
  Future<Iterable<Maker>> getMakers() async {
    final Map<String, dynamic> response = await _getResponseFromUrl('make');
    Iterable<Maker> makers =
        (response as List).map((maker) => Maker.fromJson(maker));
    return makers;
  }
}
