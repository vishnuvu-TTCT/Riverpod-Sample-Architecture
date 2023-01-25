import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/features/add_anime/model/add_anime.dart';

final addAnimeProvider = NotifierProvider<AnimeController, List<AddAnimeModel>>(AnimeController.new);

class AnimeController extends Notifier<List<AddAnimeModel>> {
  @override
  List<AddAnimeModel> build() {
    return []; ///<--- Initial State
  }

  addAnime(String name, String character) {
    // Method [One] to update List
    //you need to update the [state] to rebuild the UI
    /**************/
    List<AddAnimeModel> animeList = [...state];
    animeList.add(AddAnimeModel(anime: name, character: character));
    state = animeList;
    /**************/

  }

  removeAnime(AddAnimeModel animeModel) {
    // Method [Two] to update List
    /**************/
    state.remove(animeModel);
    state = [...state];
    /**************/

  }
}
