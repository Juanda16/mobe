import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/motorcyvle.dart';

abstract class CatalogRepository {
  Future<Either<Failure, Motorcycle>> getConcreteNumberTrivia(int number);

  Future<Either<Failure, Motorcycle>> getRandomNumberTrivia();
}
