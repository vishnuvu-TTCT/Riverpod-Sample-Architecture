import 'package:flutter/material.dart';
import 'package:riverpod_test/features/anime_list/view/anime_list_view.dart';

Map<String, WidgetBuilder> pageRoutes = {
  "anime": (context) => const AnimeListView()

  //TODO: Add more Routes here
};
