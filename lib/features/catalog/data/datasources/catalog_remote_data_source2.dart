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
import '../../domain/entities/product/product.dart';
import '../../domain/entities/vendor/store.dart';
import 'catalog_remote_data_source.dart';
import 'fake_makers_response.dart';
import 'fake_motorcycle_response.dart';
import 'fake_motorcycles_name_response.dart';

const String logosUrl = "https://logo.clearbit.com/";
const String responseString =
    '[{"id":2,"name":"Prototype-concept model"},{"id":3,"name":"Sport"},{"id":4,"name":"ATV"},{"id":5,"name":"Allround"},{"id":6,"name":"Scooter"},{"id":7,"name":"Naked bike"},{"id":8,"name":"Custom-cruiser"},{"id":9,"name":"Cross-motocross"},{"id":10,"name":"Super motard"},{"id":11,"name":"Minibike-sport"},{"id":12,"name":"Minibike-cross"},{"id":13,"name":"Classic"},{"id":14,"name":"Touring"},{"id":15,"name":"Enduro-offroad"},{"id":16,"name":"Trial"},{"id":18,"name":"Sport touring"},{"id":19,"name":"Speedway"}]';

class CatalogRemoteDataSourceImpl2 implements CatalogRemoteDataSource {
  final http.Client client;

  // static const String baseUrl =
  //     "https://tprofqzgthutyxzhogzj.supabase.co/rest/v1/";
  // static const String apiKey =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwcm9mcXpndGh1dHl4emhvZ3pqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODE2ODk4NzQsImV4cCI6MTk5NzI2NTg3NH0.8kLIMV-TD0AYbq0tuwpXIIykj7FA6TRLoFP-DHLloLs';
  // static const String authToken =
  //     'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwcm9mcXpndGh1dHl4emhvZ3pqIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4MTY4OTg3NCwiZXhwIjoxOTk3MjY1ODc0fQ.09n3aZNWC-qKzkUqf6EQJwuXGuNd54K7WHlkYH4Ru3k';
  //
  // // '05a54ebaeemsh5044d354e81f934p17ac0cjsn0cc8e6061ea2';
  //
  // static const String rapidAPIHost = 'motorcycle-specs-database.p.rapidapi.com';

  static const String localUrl = "http://localhost:8080/api_v1";

  static const String baseUrl = "https://mobeappbe.azurewebsites.net/api_v1";

  final String currentBaseUrl = baseUrl;

  CatalogRemoteDataSourceImpl2({required this.client});

  Future<Map<String, dynamic>> _getResponseFromUrl(String url) async {
    var uri = Uri.parse('$currentBaseUrl/$url');
    final http.Response response = await client.get(uri, headers: {
      'Content-Type': 'application/json',
    });

    print('response>>>: ${response.body}');
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
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Iterable<Category>> getCategories() async {
    final Map<String, dynamic> response =
        (await _getResponseFromUrl('categories/all')) as Map<String, dynamic>;
    // final Map<String, dynamic> response = {
    //   'categories/all': [
    //     {"id": 1, "name": "tiendas", "logoUrl": ""},
    //     {"id": 2, "name": "talleres", "logoUrl": ""},
    //     {"id": 3, "name": "repuestos", "logoUrl": ""},
    //     {"id": 4, "name": "accesorios", "logoUrl": ""},
    //     {"id": 5, "name": "obligatorios", "logoUrl": ""},
    //     {"id": 6, "name": "servicios", "logoUrl": ""}
    //   ]
    // };

    try {
      final List<dynamic> responseList = response['categories/all'] as List<dynamic>;

      Iterable<Category> categories = responseList.map((category) {
        return Category.fromJson(category);
      });

      return categories;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<Iterable<Store>> getStores() async {
    final Map<String, dynamic> response =
        (await _getResponseFromUrl('stores/all')) as Map<String, dynamic>;

    print('Stores>>> ${response}');

    // final Map<String, dynamic> response = {
    //   'stores/all': [
    //     {
    //       "id": 1,
    //       "name": "Inducascos",
    //       "address": "Calle 10",
    //       "picUrl":
    //           "https://inducascos.vtexassets.com/assets/vtex.file-manager-graphql/images/aa43f469-9586-400c-8700-e9c42b0955ce___da941c25a98add7bc84a346f47a399e0.png",
    //       "phone": 12345,
    //       "description": "Tienda de cascos y accesorios",
    //       "rating": 3.4
    //     },
    //     {
    //       "id": 2,
    //       "name": "Fp_Motos",
    //       "address": "Calle 11",
    //       "picUrl":
    //           "https://www.fpmoto.com/media/athlete2/Demos/brazil/categorias/Maletero_Moto.png",
    //       "phone": 456758,
    //       "description": "Tienda de herrajes, maleteros y cascos",
    //       "rating": 4.2
    //     },
    //     {
    //       "id": 3,
    //       "name": "Ultrallantas",
    //       "address": "Calle 12",
    //       "picUrl": "https://ultrallantas.com/wp-content/uploads/2023/06/banner.png",
    //       "phone": 45654764,
    //       "description": "Tienda de llantas y cascos",
    //       "rating": 5.0
    //     },
    //     {
    //       "id": 4,
    //       "name": "tienda de prueba",
    //       "address": "prueba",
    //       "picUrl": "prueba",
    //       "phone": 2342,
    //       "description": "prueba",
    //       "rating": 1.0
    //     }
    //   ]
    // };

    try {
      final List<dynamic> responseList = response['stores/all'] as List<dynamic>;

      Iterable<Store> stores = responseList.map((store) {
        return Store.fromJson(store);
      });

      return stores;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<Iterable<Product>> getProducts() async {
    final Map<String, dynamic> response =
        (await _getResponseFromUrl('products/all')) as Map<String, dynamic>;

    print('Products>>> ${response}');

    try {
      final List<dynamic> responseList = response['products/all'] as List<dynamic>;

      Iterable<Product> stores = responseList.map((store) {
        return Product.fromJson(store);
      });

      return stores;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<Iterable<Maker>> getMakers() async {
    final Map<String, dynamic> response = await _getResponseFromUrl('brands');
    // makersFakeResponse;
    // log('getMakers>>> ${response}');
    Iterable<Maker> makers = (response['brands'] as List).map((maker) {
      final String makerName = (maker["name"])?.toLowerCase().replaceAll(" ", '') ?? '';
      final String makerUrl = "$logosUrl$makerName.com";
      final Map<String, dynamic> modifiedMaker = {...maker, "logoUrl": maker["logo_url"]};

      return Maker.fromJson(modifiedMaker);
    });

    return makers;
  }

  @override
  Future<Iterable<Motorcycle>> getMotorcyclesByMaker(int id) async {
    final Map<String, dynamic> response =
        //await _getResponseFromUrl('motorcycles?brand_id=eq.$id');
        await _getResponseFromUrl(
            'motorcycles?select=*,brand:brands(name,vendor:vendors(*))&brand_id=eq.$id');
    // motorcycleNameFakeResponse2;
    Iterable<Motorcycle> motorcycleName =
        (response['motorcycles?select=*,brand:brands(name,vendor:vendors(*))&brand_id=eq.$id']
                as List)
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
    final Map<String, dynamic> response = await _getResponseFromUrl(
        'motorcycles?select=*,brand:brands(name,vendor:vendors(*))&id=eq.$id');
    //motorcycleFakeResponse;
    Motorcycle motorcycle = Motorcycle.fromJson(response['article/$id']);
    return motorcycle;
  }
}
