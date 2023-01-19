import 'package:riverpod_test/features/anime_list/model/response/anime_list_response.dart';

abstract class AnimeRepository {
  Future<List<AnimeListResponse?>?> getAnimeListFromAPI();
  Future<List<AnimeListResponse?>?> getAnimeListFromLocalStorage();
}