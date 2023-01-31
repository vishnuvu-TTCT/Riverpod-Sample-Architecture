import 'dart:core';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/features/add_anime/model/add_anime.dart';
import 'package:riverpod_test/features/add_anime/repo/add_anime_repo.dart';

//Create a provider of the AnimeController to use in view
final addAnimeProvider = NotifierProvider<AnimeController, List<AddAnimeModel>>(AnimeController.new);

class AnimeController extends Notifier<List<AddAnimeModel>> implements AddAnimeRepo {
  @override
  List<AddAnimeModel> build() {
    return []; //<--- Initial State
  }

  @override
  addAnime(String name, String character) {
    // Method [One] to update List
    //you need to update the [state] to rebuild the UI
    /**************/
    List<AddAnimeModel> animeList = [...state];
    animeList.add(AddAnimeModel(anime: name, character: character));
    state = animeList;
    /**************/
  }

  @override
  removeAnime(AddAnimeModel animeModel) {
    // Method [Two] to update List
    /**************/
    state.remove(animeModel);
    state = [...state];
    /**************/
  }
}
