import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/vendor/store.dart';
import '../repositories/catalog_repository.dart';

class GetStores implements UseCase<Iterable<Store>, NoParam> {
  final CatalogRepository repository;

  GetStores(this.repository);

  @override
  Future<Either<Failure, Iterable<Store>>> call(NoParam _) async {
    return await repository.getStores();
  }
}
