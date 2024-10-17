import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product/product.dart';
import '../repositories/catalog_repository.dart';

class GetProducts implements UseCase<Iterable<Product>, NoParam> {
  final CatalogRepository repository;

  GetProducts(this.repository);

  @override
  Future<Either<Failure, Iterable<Product>>> call(NoParam _) async {
    print('GetProducts call>>>');
    return await repository.getProducts();
  }
}
