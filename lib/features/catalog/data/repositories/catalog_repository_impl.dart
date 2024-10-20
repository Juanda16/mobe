import 'package:dartz/dartz.dart';
import 'package:mobe/features/catalog/domain/entities/maker/maker.dart';
import 'package:mobe/features/catalog/domain/entities/motorcycle/motorcycle.dart';
import 'package:mobe/features/catalog/domain/entities/product/product.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/category/category.dart';
import '../../domain/entities/vendor/store.dart';
import '../../domain/repositories/catalog_repository.dart';
import '../datasources/catalog_remote_data_source.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final CatalogRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  CatalogRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Iterable<Category>>> getCategories() async {
    return await _getRequest<Iterable<Category>>(() {
      return remoteDataSource.getCategories();
    });
  }

  @override
  Future<Either<Failure, Iterable<Store>>> getStores() async {
    return await _getRequest<Iterable<Store>>(() {
      return remoteDataSource.getStores();
    });
  }

  @override
  Future<Either<Failure, Iterable<Product>>> getProducts() async {
    return await _getRequest<Iterable<Product>>(() {
      return remoteDataSource.getProducts();
    });
  }

  @override
  Future<Either<Failure, Iterable<Maker>>> getMakers() async {
    return await _getRequest<Iterable<Maker>>(() {
      return remoteDataSource.getMakers();
    });
  }

  Future<Either<Failure, T>> _getRequest<T>(
    Future<T> Function() getData,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getData();
        // localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteResponse);
      } on ServerException {
        return Left(ServerFailure(
          message: 'Server error',
        ));
      }
    }
    return Left(ServerFailure(
      message: 'No internet connection',
    ));
    // else {
    //   try {
    //     final localTrivia = await localDataSource.getLastNumberTrivia();
    //     return Right(localTrivia);
    //   } on CacheException {
    //     return Left(CacheFailure());
    //   }
    // }
  }

  @override
  Future<Either<Failure, Iterable<Motorcycle>>> getMotorcyclesByMaker(int id) {
    return _getRequest<Iterable<Motorcycle>>(() {
      return remoteDataSource.getMotorcyclesByMaker(id);
    });
  }

  @override
  Future<Either<Failure, Motorcycle>> getMotorcycleById(int id) {
    return _getRequest<Motorcycle>(() {
      return remoteDataSource.getMotorcycleById(id);
    });
  }

  @override
  Future<Either<Failure, Iterable<Motorcycle>>> getMotorcyclesById(int id) {
    // TODO: implement getMotorcyclesById
    throw UnimplementedError();
  }
}
