import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/category/category.dart';
import '../entities/maker/maker.dart';

abstract class CatalogRepository {
  Future<Either<Failure, Iterable<Category>>> getCategories();

  Future<Either<Failure, Iterable<Maker>>> getMakers();
}
