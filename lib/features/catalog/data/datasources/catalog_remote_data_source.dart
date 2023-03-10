// // ignore_for_file: unused_import
//
// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:meta/meta.dart';
//
// import '../../../../core/error/exception.dart';
// import '../models/number_trivia_model.dart';
//
// abstract class CatalogRemoteDataSource {
//   /// Calls the http://numbersapi.com/{number} endpoint.
//   ///
//   /// Throws a [ServerException] for all error codes.
//   Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
//
//   /// Calls the http://numbersapi.com/random endpoint.
//   ///
//   /// Throws a [ServerException] for all error codes.
//   Future<NumberTriviaModel> getRandomNumberTrivia();
// }
//
// class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
//   final http.Client client;
//
//   CatalogRemoteDataSourceImpl({required this.client});
//
//   @override
//   Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
//       _getTriviaFromUrl('http://numbersapi.com/$number');
//
//   @override
//   Future<NumberTriviaModel> getRandomNumberTrivia() =>
//       _getTriviaFromUrl('http://numbersapi.com/random');
//
//   Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
//     var uri = Uri.parse(url);
//     final response = await client.get(
//       uri,
//       headers: {
//         'Content-Type': 'application/json',
//       },
//     );
//
//     if (response.statusCode == 200) {
//       return NumberTriviaModel.fromJson(json.decode(response.body));
//     } else {
//       throw ServerException();
//     }
//   }
// }
