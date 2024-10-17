import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> logInWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, User>> signUpWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, User>> signInWithGoogle();

  Future<Either<Failure, User>> signInWithFacebook();

  Future<Either<Failure, String>> signUp(User user);

  Future<Either<Failure, void>> signOut();
}
