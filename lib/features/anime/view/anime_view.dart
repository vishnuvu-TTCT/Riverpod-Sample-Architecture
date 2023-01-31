import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_test/features/anime/provider/anime_provider.dart';
import 'package:riverpod_test/utils/common_utils/theme/theme_notifier.dart';

class AnimeListView extends ConsumerWidget {
  const AnimeListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeAsync = ref.watch(animeProvider);
    var darkMode = ref.watch(darkModeProvider);

    return animeAsync.when(
        data: (list) => Scaffold(
            appBar: AppBar(
              title: const Text(
                "Riverpod Test",
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      context.pushNamed('addAnime');
                    },
                    icon: const Icon(
                      Icons.add,
                    )),
                IconButton(
                    onPressed: () => ref.read(darkModeProvider.notifier).toggle(),
                    icon: Icon(
                      darkMode ? Icons.light_mode : Icons.dark_mode,
                    )),
              ],
            ),
            floatingActionButton:
                FloatingActionButton(onPressed: () => ref.refresh(animeProvider), child: const Icon(Icons.refresh)),
            body: animeAsync.isRefreshing
                ? const Scaffold(body: Center(child: CircularProgressIndicator()))
                : ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {},
                      title: Text(list[index].anime.toString()),
                      leading: CircleAvatar(child: Text(list[index].anime.substring(0, 1).toString())),
                    ),
                    itemCount: list.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  )),
        error: (err, stack) => Scaffold(body: Center(child: Text('Error: $err  $stack'))),
        loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())));
  }
}
