import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/data/endpoint/api_endpoints.dart';
import 'package:riverpod_test/data/model/enums/http_types.dart';
import 'package:riverpod_test/features/anime_list/model/response/anime_list_response.dart';
import 'package:riverpod_test/features/anime_list/repo/anime_list_interface.dart';
import 'package:riverpod_test/service/api_provider.dart';

final animeRepoProvider = Provider((ref) {
  final apiHelper = ref.watch(apiHelperProvider);
  return AnimeRepo(apiHelper);
});

class AnimeRepo implements AnimeRepository {
  late ApiHelper _apiHelper;

  AnimeRepo(ApiHelper apiHelper) {
    _apiHelper = apiHelper;
  }

  @override
  Future<List<AnimeListResponse?>?> getAnimeListFromAPI() async {
    final response = await _apiHelper.callApi(
      service: ApiEndPoints.getAnime,
      requestType: HttpRequestType.get,
      authRequired: false,
    );

    return animeListResponseFromJson(json.encode(response));
  }

  @override
  Future<List<AnimeListResponse?>?> getAnimeListFromLocalStorage() {
    // TODO: implement getAnimeListFromLocalStorage
    throw UnimplementedError();
  }
}
