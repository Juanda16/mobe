// ignore_for_file: unused_import

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mobe/core/error/failures.dart';
import 'package:mobe/features/catalog/domain/entities/motorcycle_name/motorcycle_name.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entities/category/category.dart';
import '../../domain/entities/maker/maker.dart';
import '../models/number_trivia_model.dart';
import 'fake_makers_response.dart';
import 'fake_motorcycles_name_response.dart';

const String logosUrl = "https://logo.clearbit.com/";
const String responseString =
    '[{"id":2,"name":"Prototype-concept model"},{"id":3,"name":"Sport"},{"id":4,"name":"ATV"},{"id":5,"name":"Allround"},{"id":6,"name":"Scooter"},{"id":7,"name":"Naked bike"},{"id":8,"name":"Custom-cruiser"},{"id":9,"name":"Cross-motocross"},{"id":10,"name":"Super motard"},{"id":11,"name":"Minibike-sport"},{"id":12,"name":"Minibike-cross"},{"id":13,"name":"Classic"},{"id":14,"name":"Touring"},{"id":15,"name":"Enduro-offroad"},{"id":16,"name":"Trial"},{"id":18,"name":"Sport touring"},{"id":19,"name":"Speedway"}]';

abstract class CatalogRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Iterable<Category>> getCategories();

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Iterable<Maker>> getMakers();

  Future<Iterable<MotorcycleName>> getMotorcyclesByMaker(int id);
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
    // final http.Response response = await client.get(uri, headers: {
    //   'X-RapidAPI-Key': rapidAPIKey,
    //   'X-RapidAPI-Host': rapidAPIHost,
    // });

    // final http.Response response = http.Response(responseString, 200);
    // final String preProcessResponse = '{"categories":${response.body}}';

    final http.Response response = http.Response(makersFakeResponseString, 200);
    // final String preProcessResponse = '{"makers":${response.body}}';

    if (response.statusCode == 200) {
      return makersFakeResponse;
      // try {
      //   return json.decode(
      //     preProcessResponse,
      //   ) as Map<String, dynamic>;
      // } catch (e) {
      //   print(e);
      //   return {};
      // }
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
    Map<String, dynamic> response = await _getResponseFromUrl('make');

    Iterable<Maker> makers = (response['makers'] as List<Map<String, String>>)
        .map((Map<String, String> maker) {
      final makerName =
          (maker["name"])?.toLowerCase().replaceAll(" ", '') ?? '';
      final makerUrl = "$logosUrl$makerName.com";
      final modifiedMaker = {...maker, "logoUrl": makerUrl};

      return Maker.fromJson(modifiedMaker);
    });

    return makers;
  }

  @override
  Future<Iterable<MotorcycleName>> getMotorcyclesByMaker(int id) async {

    final http.Response response2 = http.Response(motorcycleNameFakeResponseString, 200);
    final Map<String, dynamic> response =
    //     await _getResponseFromUrl('model/make-id/$id');
    motorcycleNameFakeResponse;

    Iterable<MotorcycleName> motorcycleName =
        (response['motorcycles_names'] as List)
            .map((motorcycle) => MotorcycleName.fromJson(motorcycle));

    return motorcycleName;
  }
}
