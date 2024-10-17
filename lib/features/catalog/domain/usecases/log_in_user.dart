import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user/user.dart';
import '../repositories/auth_repository.dart';

class LogInUserParams {
  final email;

  final password;

  LogInUserParams({required this.email, required this.password});
}

class LogInUser extends UseCase<User, LogInUserParams> {
  final AuthRepository repository;

  LogInUser(this.repository);

  Future<Either<Failure, User>> call(LogInUserParams params) async {
    return await repository.logInWithEmailAndPassword(
        params.email, params.password);
  }
}
