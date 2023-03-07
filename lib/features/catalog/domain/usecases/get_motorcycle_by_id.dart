import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/motorcyvle.dart';
import '../repositories/catalog_repository.dart';

class GetMotorcycleById implements UseCase<Motorcycle, Params> {
  // Since we're gonna initialize the variable later,
  // the null safety requires a late.
  late final CatalogRepository repository;

  GetMotorcycleById(this.repository);

  @override
  Future<Either<Failure, Motorcycle>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  // Differing from the original implementation, since we can expect a null value,
  // the Object becomes Object?
  @override
  List<Object?> get props => [number];
}
