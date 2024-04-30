// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mobe/core/error/failures.dart';
import 'package:mobe/features/catalog/domain/entities/motorcycle/motorcycle.dart';
import 'package:mobe/features/catalog/domain/entities/motorcycle_name/motorcycle_name.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entities/category/category.dart';
import '../../domain/entities/maker/maker.dart';
import '../../domain/entities/vendor/store.dart';
import 'fake_makers_response.dart';
import 'fake_motorcycle_response.dart';
import 'fake_motorcycles_name_response.dart';

const String logosUrl = "https://logo.clearbit.com/";
const String responseString =
    '[{"id":2,"name":"Prototype-concept model"},{"id":3,"name":"Sport"},{"id":4,"name":"ATV"},{"id":5,"name":"Allround"},{"id":6,"name":"Scooter"},{"id":7,"name":"Naked bike"},{"id":8,"name":"Custom-cruiser"},{"id":9,"name":"Cross-motocross"},{"id":10,"name":"Super motard"},{"id":11,"name":"Minibike-sport"},{"id":12,"name":"Minibike-cross"},{"id":13,"name":"Classic"},{"id":14,"name":"Touring"},{"id":15,"name":"Enduro-offroad"},{"id":16,"name":"Trial"},{"id":18,"name":"Sport touring"},{"id":19,"name":"Speedway"}]';

abstract class CatalogRemoteDataSource {
  /// Calls them endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Iterable<Category>> getCategories();

  Future<Iterable<Store>> getStores();

  /// Calls the endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Iterable<Maker>> getMakers();

  Future<Iterable<Motorcycle>> getMotorcyclesByMaker(int id);

  Future<Iterable<MotorcycleName>> getMotorcyclesById(int id);

  Future<Motorcycle> getMotorcycleById(int id);
}

class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  final http.Client client;

  static const String baseUrl =
      "https://motorcycle-specs-database.p.rapidapi.com";
  static const String rapidAPIKey =
      '8aded21a64msh8c903c14ef97a29p13041ajsn117e83620b51';

  // '05a54ebaeemsh5044d354e81f934p17ac0cjsn0cc8e6061ea2';

  static const String rapidAPIHost = 'motorcycle-specs-database.p.rapidapi.com';

  CatalogRemoteDataSourceImpl({required this.client});

  Future<Map<String, dynamic>> _getResponseFromUrl(String url) async {
    var uri = Uri.parse('$baseUrl/$url');
    final http.Response response = await client.get(uri, headers: {
      'X-RapidAPI-Key': rapidAPIKey,
      'X-RapidAPI-Host': rapidAPIHost,
    });

    final String preProcessResponse = '{"$url":${response.body}}';
    // final http.Response response = http.Response(makersFakeResponseString, 200);

    if (response.statusCode == 200) {
      try {
        return json.decode(
          preProcessResponse,
        ) as Map<String, dynamic>;
      } catch (e) {
        print(e);
        return {};
      }

      return json.decode(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Iterable<Category>> getCategories() async {
    final Map<String, dynamic> response =
        // (await _getResponseFromUrl('category')) as Map<String, dynamic>;
        makersFakeResponse;
    Iterable<Category> categories =
        (response as List).map((category) => Category.fromJson(category));

    return categories;
  }

  @override
  Future<Iterable<Maker>> getMakers() async {
    final Map<String, dynamic> response =
        // await _getResponseFromUrl('make');
        makersFakeResponse;

    Iterable<Maker> makers = (response['make'] as List).map((maker) {
      final String makerName =
          (maker["name"])?.toLowerCase().replaceAll(" ", '') ?? '';
      final String makerUrl = "$logosUrl$makerName.com";
      final Map<String, dynamic> modifiedMaker = {
        ...maker,
        "logoUrl": makerUrl
      };

      return Maker.fromJson(modifiedMaker);
    });

    return makers;
  }

  @override
  Future<Iterable<Motorcycle>> getMotorcyclesByMaker(int id) async {
    final Map<String, dynamic> response =
        // await _getResponseFromUrl('model/make-id/$id');
        motorcycleNameFakeResponse2;

    //change response id to type int
    Iterable<Motorcycle> motorcycle = (response['model/make-id/$id'] as List)
        .map((motorcycle) => Motorcycle.fromJson(motorcycle));
    return motorcycle;
  }

  @override
  Future<Iterable<MotorcycleName>> getMotorcyclesById(int id) {
    // TODO: implement getMotorcyclesById
    throw UnimplementedError();
  }

  @override
  Future<Motorcycle> getMotorcycleById(int id) async {
    final Map<String, dynamic>
        response = //await _getResponseFromUrl('article/$id');
        motorcycleFakeResponse;

    Motorcycle motorcycle = Motorcycle.fromJson(response['article/$id']);
    return motorcycle;
  }

  @override
  Future<Iterable<Store>> getStores() {
    // TODO: implement getStores
    throw UnimplementedError();
  }
}
