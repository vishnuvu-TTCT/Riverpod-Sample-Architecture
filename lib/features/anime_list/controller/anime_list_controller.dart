import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/di/di.dart';
import 'package:riverpod_test/features/anime_list/model/response/anime_list_response.dart';
import 'package:riverpod_test/features/anime_list/repo/anime_list_repo.dart';

final animeProvider = FutureProvider.autoDispose<List<AnimeListResponse?>?>((ref) {
  // get repository from the provider below
  AnimeRepo animeRepo = locate<AnimeRepo>();
  // call method that returns a Future<List<AnimeListResponse>>
  return animeRepo.getAnimeListFromAPI();
});
