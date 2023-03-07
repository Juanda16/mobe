// import 'package:dartz/dartz.dart';
//
// import '../../../../core/error/exception.dart';
// import '../../../../core/error/failures.dart';
// import '../../../../core/network/network_info.dart';
// import '../../domain/entities/motorcyvle.dart';
// import '../../domain/repositories/catalog_repository.dart';
// import '../datasources/catalog_local_data_source.dart';
// import '../datasources/catalog_remote_data_source.dart';
// import '../models/number_trivia_model.dart';
//
// typedef _ConcreteOrRandomChooser = Future<Motorcycle> Function();
//
// class CatalogRepositoryImpl implements CatalogRepository {
//   final CatalogRemoteDataSource remoteDataSource;
//   final CatalogLocalDataSource localDataSource;
//   final NetworkInfo networkInfo;
//
//   CatalogRepositoryImpl({
//     required this.remoteDataSource,
//     required this.localDataSource,
//     required this.networkInfo,
//   });
//
//   @override
//   Future<Either<Failure, Motorcycle>> getConcreteNumberTrivia(
//     int number,
//   ) async {
//     return await _getTrivia(() {
//       return remoteDataSource.getConcreteNumberTrivia(number);
//     });
//   }
//
//   @override
//   Future<Either<Failure, Motorcycle>> getRandomNumberTrivia() async {
//     return await _getTrivia(() {
//       return remoteDataSource.getRandomNumberTrivia();
//     });
//   }
//
//   Future<Either<Failure, Motorcycle>> _getTrivia(
//     _ConcreteOrRandomChooser getConcreteOrRandom,
//   ) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final remoteTrivia = await getConcreteOrRandom();
//         localDataSource.cacheNumberTrivia(remoteTrivia);
//         return Right(remoteTrivia);
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       try {
//         final localTrivia = await localDataSource.getLastNumberTrivia();
//         return Right(localTrivia);
//       } on CacheException {
//         return Left(CacheFailure());
//       }
//     }
//   }
// }
