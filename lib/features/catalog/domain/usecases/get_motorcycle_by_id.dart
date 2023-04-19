import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/motorcycle/motorcycle.dart';
import '../repositories/catalog_repository.dart';

class GetMotorcycleById implements UseCase<Motorcycle, GetMotorcycleByIdParam> {
  // Since we're gonna initialize the variable later,
  // the null safety requires a late.
  late final CatalogRepository repository;

  GetMotorcycleById(this.repository);

  @override
  Future<Either<Failure, Motorcycle>> call(
      GetMotorcycleByIdParam params) async {
    return await repository.getMotorcycleById(params.id);
  }
}

class GetMotorcycleByIdParam {
  final int id;

  const GetMotorcycleByIdParam({required this.id});

  // Differing from the original implementation, since we can expect a null value,
  // the Object becomes Object?
  @override
  List<Object?> get props => [id];
}
