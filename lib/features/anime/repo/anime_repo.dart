
import 'package:riverpod_test/features/anime/model/response/anime_response.dart';

abstract class AnimeRepository {
  Future<List<AnimeResponse>> getAnimeListFromAPI();
  Future<List<AnimeResponse>> getAnimeListFromLocalStorage();
}