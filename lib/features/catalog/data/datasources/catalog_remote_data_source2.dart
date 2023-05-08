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
import 'catalog_remote_data_source.dart';
import 'fake_makers_response.dart';
import 'fake_motorcycle_response.dart';
import 'fake_motorcycles_name_response.dart';

const String logosUrl = "https://logo.clearbit.com/";
const String responseString =
    '[{"id":2,"name":"Prototype-concept model"},{"id":3,"name":"Sport"},{"id":4,"name":"ATV"},{"id":5,"name":"Allround"},{"id":6,"name":"Scooter"},{"id":7,"name":"Naked bike"},{"id":8,"name":"Custom-cruiser"},{"id":9,"name":"Cross-motocross"},{"id":10,"name":"Super motard"},{"id":11,"name":"Minibike-sport"},{"id":12,"name":"Minibike-cross"},{"id":13,"name":"Classic"},{"id":14,"name":"Touring"},{"id":15,"name":"Enduro-offroad"},{"id":16,"name":"Trial"},{"id":18,"name":"Sport touring"},{"id":19,"name":"Speedway"}]';

class CatalogRemoteDataSourceImpl2 implements CatalogRemoteDataSource {
  final http.Client client;

  static const String baseUrl =
      "https://tprofqzgthutyxzhogzj.supabase.co/rest/v1";
  static const String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwcm9mcXpndGh1dHl4emhvZ3pqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODE2ODk4NzQsImV4cCI6MTk5NzI2NTg3NH0.8kLIMV-TD0AYbq0tuwpXIIykj7FA6TRLoFP-DHLloLs';
  static const String authToken =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwcm9mcXpndGh1dHl4emhvZ3pqIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4MTY4OTg3NCwiZXhwIjoxOTk3MjY1ODc0fQ.09n3aZNWC-qKzkUqf6EQJwuXGuNd54K7WHlkYH4Ru3k';

  // '05a54ebaeemsh5044d354e81f934p17ac0cjsn0cc8e6061ea2';

  static const String rapidAPIHost = 'motorcycle-specs-database.p.rapidapi.com';

  CatalogRemoteDataSourceImpl2({required this.client});

  Future<Map<String, dynamic>> _getResponseFromUrl(String url) async {
    var uri = Uri.parse('$baseUrl/$url');
    final http.Response response = await client.get(uri, headers: {
      'apikey': apiKey,
      'Authorization': authToken,
    });

    log('response>>>: ${response.body}');
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
    final Map<String, dynamic> response = await _getResponseFromUrl('brands');
    // makersFakeResponse;
    // log('getMakers>>> ${response}');
    Iterable<Maker> makers = (response['brands'] as List).map((maker) {
      final String makerName =
          (maker["name"])?.toLowerCase().replaceAll(" ", '') ?? '';
      final String makerUrl = "$logosUrl$makerName.com";
      final Map<String, dynamic> modifiedMaker = {
        ...maker,
        "logoUrl": maker["logo_url"]
      };

      return Maker.fromJson(modifiedMaker);
    });

    return makers;
  }

  @override
  Future<Iterable<Motorcycle>> getMotorcyclesByMaker(int id) async {
    final Map<String, dynamic> response =
        await _getResponseFromUrl('motorcycles?brand_id=eq.$id');
    // motorcycleNameFakeResponse2;

    //change response id to type int
    Iterable<Motorcycle> motorcycleName =
        (response['motorcycles?brand_id=eq.$id'] as List)
            .map((motorcycle) => Motorcycle.fromJson(motorcycle));
    return motorcycleName;
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
}
