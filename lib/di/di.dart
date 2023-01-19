import 'package:get_it/get_it.dart';
import 'package:riverpod_test/features/anime_list/repo/anime_list_repo.dart';
import 'package:riverpod_test/service/api_client.dart';
import 'package:riverpod_test/service/api_provider.dart';

GetIt getIt = GetIt.instance;

void initDI() {
  getIt.registerLazySingleton(() => ApiClient());
  getIt.registerLazySingleton(() => ApiHelper(locate<ApiClient>()));
  getIt.registerLazySingleton(() => AnimeRepo(locate<ApiHelper>()));
}

locate<T extends Object>({String? instanceName}) =>
    instanceName == null ? getIt.get<T>() : getIt.get<T>(instanceName: instanceName);
