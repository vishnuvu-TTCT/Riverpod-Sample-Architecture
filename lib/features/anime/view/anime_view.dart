import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_test/features/anime/provider/anime_provider.dart';

class AnimeListView extends ConsumerWidget {
  const AnimeListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeAsync = ref.watch(animeProvider);

    return animeAsync.when(
        data: (list) => Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF3889C4),
              title: const Text(
                "Riverpod Test",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      context.pushNamed('addAnime');
                    },
                    icon: const Icon(
                      Icons.looks_one_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.two_k,
                      color: Colors.white,
                    )),
              ],
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () => ref.refresh(animeProvider),
                backgroundColor: const Color(0xFF3889C4),
                child: const Icon(Icons.refresh)),
            body: animeAsync.isRefreshing
                ? const Scaffold(body: Center(child: CircularProgressIndicator()))
                : ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {},
                      title: Text(list[index].anime.toString()),
                      leading: CircleAvatar(
                          backgroundColor: const Color(0xFF3889C4), child: Text(list[index].anime.substring(0, 1).toString())),
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
