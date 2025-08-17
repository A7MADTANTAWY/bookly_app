import 'package:bokly_app/core/utils/api_service.dart';
import 'package:bokly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bokly_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService(Dio()));
  getIt.registerLazySingleton(
    () => HomeRepoImplementation(getIt.get<ApiService>()),
  );
    getIt.registerLazySingleton(
    () => SearchRepoImplementation(getIt.get<ApiService>()),
  );
}
