import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParam {
  // Differing from the original implementation, since we can expect a null value,
  // the Object becomes Object?

}
