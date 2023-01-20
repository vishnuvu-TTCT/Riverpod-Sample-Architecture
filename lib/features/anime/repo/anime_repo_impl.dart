import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/data/endpoint/api_endpoints.dart';
import 'package:riverpod_test/data/model/enums/http_types.dart';
import 'package:riverpod_test/features/anime/model/response/anime_response.dart';
import 'package:riverpod_test/features/anime/repo/anime_repo.dart';
import 'package:riverpod_test/service/api_provider.dart';

final animeRepoProvider = Provider((ref) {
  final apiHelper = ref.read(apiHelperProvider);
  return AnimeRepoImpl(apiHelper);
});

class AnimeRepoImpl implements AnimeRepository {
  late ApiHelper _apiHelper;

  AnimeRepoImpl(ApiHelper apiHelper) {
    _apiHelper = apiHelper;
  }

  @override
  Future<List<AnimeResponse>> getAnimeListFromAPI() async {
    final response = await _apiHelper.callApi(
      service: ApiEndPoints.getAnime,
      requestType: HttpRequestType.get,
      authRequired: false,
    );

    return animeResponseFromJson(json.encode(response));
  }

  @override
  Future<List<AnimeResponse>> getAnimeListFromLocalStorage() {
    // TODO: implement getAnimeListFromLocalStorage
    throw UnimplementedError();
  }
}
