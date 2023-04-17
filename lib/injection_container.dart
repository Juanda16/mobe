import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobe/features/catalog/domain/usecases/get_categories.dart';

import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';
import 'features/catalog/data/datasources/catalog_remote_data_source.dart';
import 'features/catalog/data/repositories/catalog_repository_impl.dart';
import 'features/catalog/domain/domain.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  // getIt.registerFactory(
  //   () => NumberTriviaBloc(
  //     concrete: getIt(),
  //     inputConverter: getIt(),
  //     random: getIt(),
  //   ),
  // );

  // Use cases
  // getIt.registerLazySingleton(() => GetMotorcycleById(getIt()));
  getIt.registerLazySingleton(() => GetCategories(getIt()));
  getIt.registerLazySingleton(() => GetMakers(getIt()));
  getIt.registerLazySingleton(() => GetMotorcycleByMaker(getIt()));

  // Repository
  getIt.registerLazySingleton<CatalogRepository>(
    () => CatalogRepositoryImpl(
      // localDataSource: getIt(),
      networkInfo: getIt(),
      remoteDataSource: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<CatalogRemoteDataSource>(
    () => CatalogRemoteDataSourceImpl(client: getIt()),
  );

  // getIt.registerLazySingleton<CatalogLocalDataSource>(
  //   () => CatalogLocalDataSourceImpl(sharedPreferences: getIt()),
  // );

  //! Core
  getIt.registerLazySingleton(() => InputConverter());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
