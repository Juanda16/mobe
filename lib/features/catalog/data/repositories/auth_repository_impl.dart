import 'package:dartz/dartz.dart';
import 'package:mobe/core/error/failures.dart';
import 'package:mobe/features/catalog/domain/entities/user/user.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, User>> logInWithEmailAndPassword(
      String email, String password) {
    return remoteDataSource.logInWithEmailAndPassword(email, password);
  }

  @override
  Future<Either<Failure, User>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUp(User user) {
    return remoteDataSource.signUp(user);
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword(
      String email, String password) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}
