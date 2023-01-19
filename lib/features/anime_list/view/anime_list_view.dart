import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/features/anime_list/controller/anime_list_controller.dart';

class AnimeListView extends ConsumerWidget {
  const AnimeListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeAsync = ref.watch(animeProvider);

    return animeAsync.when(
        data: (list) => Scaffold(
          appBar: AppBar(
            title: const Text("Riverpod Test"),
            actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.refresh))],
          ),
                body: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: Text(list[index]!.anime.toString()),
                leading: CircleAvatar(child: Text(list[index]!.anime!.substring(0, 1).toString())),
              ),
              itemCount: list!.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )),
        error: (err, stack) => Scaffold(body: Center(child: Text('Error: $err  $stack'))),
        loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())));
  }
}
