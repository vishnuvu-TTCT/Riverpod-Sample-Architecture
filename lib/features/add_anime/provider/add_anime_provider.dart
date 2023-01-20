import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/features/add_anime/model/add_anime.dart';

final addAnimeProvider = StateNotifierProvider<AnimeCRUD, List<AddAnimeModel>>((ref) {
  return AnimeCRUD();
});
  class AnimeCRUD extends StateNotifier<List<AddAnimeModel>> {
  AnimeCRUD() : super([AddAnimeModel(anime: "Naruto", character: "Obito")]);
  
  addAnime(String name, String character) {
    state.add(AddAnimeModel(anime: name, character: character));
    state = [...state];
  }

  removeAnime(AddAnimeModel animeModel) {
    state.remove(animeModel);
    state = [...state];
  }
}
