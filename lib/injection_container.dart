import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobe/features/catalog/domain/usecases/get_categories.dart';

import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  // sl.registerFactory(
  //   () => NumberTriviaBloc(
  //     concrete: sl(),
  //     inputConverter: sl(),
  //     random: sl(),
  //   ),
  // );

  // Use cases
  // sl.registerLazySingleton(() => GetMotorcycleById(sl()));
  sl.registerLazySingleton(() => GetCategories(sl()));

  // Repository
  // sl.registerLazySingleton<CatalogRepository>(
  //   () => CatalogRepositoryImpl(
  //     localDataSource: sl(),
  //     networkInfo: sl(),
  //     remoteDataSource: sl(),
  //   ),
  // );

  // Data sources
  // sl.registerLazySingleton<CatalogRemoteDataSource>(
  //   () => CatalogRemoteDataSourceImpl(client: sl()),
  // );

  // sl.registerLazySingleton<CatalogLocalDataSource>(
  //   () => CatalogLocalDataSourceImpl(sharedPreferences: sl()),
  // );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
