import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/category/category.dart';
import '../entities/maker/maker.dart';
import '../entities/motorcycle/motorcycle.dart';

abstract class CatalogRepository {
  Future<Either<Failure, Iterable<Category>>> getCategories();

  Future<Either<Failure, Iterable<Maker>>> getMakers();

  Future<Either<Failure, Iterable<Motorcycle>>> getMotorcyclesByMaker(int id);

  Future<Either<Failure, Iterable<Motorcycle>>> getMotorcyclesById(int id);

  Future<Either<Failure, Motorcycle>> getMotorcycleById(int id);
}
