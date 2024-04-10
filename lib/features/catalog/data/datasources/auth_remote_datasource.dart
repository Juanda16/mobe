import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user/user.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, User>> logInWithEmailAndPassword(
      String email, String password);

  Future<User> logInWithGoogle();

  Future<User> logInWithFacebook();

  Future<Either<Failure, String>> signUp(User user);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    required this.client,
  });

  final http.Client client;

  static const String localUrl = "http://localhost:8080/api_v1/auth";

  static const String baseUrl =
      "https://mobeappbe.azurewebsites.net/api_v1/auth";

  final String currentBaseUrl = baseUrl;

  @override
  Future<Either<Failure, User>> logInWithEmailAndPassword(
      String email, String password) async {
    Map<String, dynamic> response = await _postResponseFromUrl(
        'login', {'username': email, 'password': password});

    print('server response ${response}');

    if (response.containsKey('error')) {
      return Left(ServerFailure(
        message: response['error'],
      ));
    }

    print(' response${response}');

    return Right(User.fromJson(response['login']));
  }

  @override
  Future<User> logInWithFacebook() {
    // TODO: implement LogInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<User> logInWithGoogle() {
    // TODO: implement LogInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUp(User user) async {
    Map<String, dynamic> response =
        await _postResponseFromUrl('signup', user.toJson());

    if (response.containsKey('error')) {
      return Left(ServerFailure(
        message: response['error'],
      ));
    }
    return Right('User created successfully');
  }

  @override
  Future<User> signUpWithEmailAndPassword(String email, String password) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> _getResponseFromUrl(String url) async {
    var uri = Uri.parse('$currentBaseUrl/$url');
    final http.Response response = await client.get(uri, headers: {});

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

  Future<Map<String, dynamic>> _postResponseFromUrl(
      String url, Map<String, dynamic> body) async {
    Uri uri = Uri.parse('$currentBaseUrl/$url');

    print('user body>>> ${body}');

    final finalBody = json.encode(body);

    final http.Response response = await client.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: finalBody,
    );

    print('response>>> ${response.statusCode}, ${response.body}');

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
      return json.decode(response.body);
    }
  }
}
