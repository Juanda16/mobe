import 'package:dartz/dartz.dart';
import 'package:mobe/features/catalog/domain/entities/product/product.dart';

import '../../../../core/error/failures.dart';
import '../entities/category/category.dart';
import '../entities/maker/maker.dart';
import '../entities/motorcycle/motorcycle.dart';
import '../entities/vendor/store.dart';

abstract class CatalogRepository {
  Future<Either<Failure, Iterable<Category>>> getCategories();

  Future<Either<Failure, Iterable<Store>>> getStores();

  Future<Either<Failure, Iterable<Product>>> getProducts();

  Future<Either<Failure, Iterable<Maker>>> getMakers();

  Future<Either<Failure, Iterable<Motorcycle>>> getMotorcyclesByMaker(int id);

  Future<Either<Failure, Iterable<Motorcycle>>> getMotorcyclesById(int id);

  Future<Either<Failure, Motorcycle>> getMotorcycleById(int id);
}
