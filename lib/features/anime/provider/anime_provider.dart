import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/features/anime/model/response/anime_response.dart';
import 'package:riverpod_test/features/anime/repo/anime_repo_impl.dart';

  //if you remove auto-dispose the data will be persistent
final animeProvider = FutureProvider.autoDispose<List<AnimeResponse>>((ref) {
  // get repository from the provider below
  final animeRepo = ref.read(animeRepoProvider);
  // call method that returns a Future<List<AnimeListResponse>>
  return animeRepo.getAnimeListFromAPI();
});


