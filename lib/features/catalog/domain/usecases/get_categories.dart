import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/motorcyvle.dart';
import '../repositories/catalog_repository.dart';

class GetCategories implements UseCase<Motorcycle, NoParam> {
  late final CatalogRepository repository;

  GetCategories(this.repository);

  @override
  Future<Either<Failure, Motorcycle>> call(NoParam _) async {
    return await repository.getRandomNumberTrivia();
  }
}
