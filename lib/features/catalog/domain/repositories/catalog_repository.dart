import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failures.dart';
import '../entities/maker/maker.dart';

abstract class CatalogRepository {
  Future<Either<Failure, Category>> getCategories();

  Future<Either<Failure, Maker>> getMakers();
}
