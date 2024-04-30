import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/category/category.dart';
import '../repositories/catalog_repository.dart';

class GetCategories implements UseCase<Iterable<Category>, NoParam> {
  final CatalogRepository repository;

  GetCategories(this.repository);

  @override
  Future<Either<Failure, Iterable<Category>>> call(NoParam _) async {
    return await repository.getCategories();
  }
}
