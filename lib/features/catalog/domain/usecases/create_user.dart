import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user/user.dart';
import '../repositories/auth_repository.dart';

class CreateUserParams {
  final User user;

  CreateUserParams(this.user);
}

class CreateUser extends UseCase<String, CreateUserParams> {
  final AuthRepository repository;

  CreateUser(this.repository);

  @override
  Future<Either<Failure, String>> call(CreateUserParams params) async {
    return await repository.signUp(params.user);
  }
}
