import 'package:dartz/dartz.dart';
import 'package:mobe/features/catalog/domain/entities/motorcycle_name/motorcycle_name.dart';

import '../../../../core/error/failures.dart';
import '../entities/category/category.dart';
import '../entities/maker/maker.dart';

abstract class CatalogRepository {
  Future<Either<Failure, Iterable<Category>>> getCategories();

  Future<Either<Failure, Iterable<Maker>>> getMakers();

  Future<Either<Failure, Iterable<MotorcycleName>>> getMotorcyclesByMaker(int id);
}
