import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParam {
  static const NoParam _instance = NoParam._();

  /// Returns the only [NoParam] instance that can be created.
  static NoParam get i => _instance;

  const NoParam._();
}
