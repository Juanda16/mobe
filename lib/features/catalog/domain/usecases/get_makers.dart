import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/maker/maker.dart';
import '../repositories/catalog_repository.dart';

class GetMakers implements UseCase<Iterable<Maker>, NoParam> {
  late final CatalogRepository repository;

  GetMakers(this.repository);

  @override
  Future<Either<Failure, Iterable<Maker>>> call(NoParam _) async {
    return await repository.getMakers();
  }
}
