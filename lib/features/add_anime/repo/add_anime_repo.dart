import 'package:riverpod_test/features/add_anime/model/add_anime.dart';

abstract class AddAnimeRepo {
  void addAnime(String name, String character) {}

  void removeAnime(AddAnimeModel animeModel) {}
}
