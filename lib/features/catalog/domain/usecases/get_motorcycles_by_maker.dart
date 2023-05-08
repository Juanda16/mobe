import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/motorcycle/motorcycle.dart';
import '../repositories/catalog_repository.dart';

class GetMotorcycleByMaker implements UseCase<Iterable<Motorcycle>, Params> {
  // Since we're gonna initialize the variable later,
  // the null safety requires a late.
  final CatalogRepository repository;

  GetMotorcycleByMaker(this.repository);

  @override
  Future<Either<Failure, Iterable<Motorcycle>>> call(Params params) async {
    return await repository.getMotorcyclesByMaker(params.id);
  }
}

class Params {
  final int id;

  const Params({required this.id});

  // Differing from the original implementation, since we can expect a null value,
  // the Object becomes Object?
  @override
  List<Object?> get props => [id];
}
