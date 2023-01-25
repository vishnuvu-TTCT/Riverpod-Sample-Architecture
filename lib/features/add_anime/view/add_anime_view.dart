import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/features/add_anime/provider/add_anime_provider.dart';

class AddAnimeScreen extends ConsumerWidget {
  const AddAnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController(text: '');
    final characterController = TextEditingController(text: '');
    final addAnimeBuilder = ref.watch(addAnimeProvider);
    final animeListener = ref.read(addAnimeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3889C4),
        title: const Text("Add Anime"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: 250,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: const Text("Anime Name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
            width: 250,
            child: TextField(
              controller: characterController,
              decoration: InputDecoration(
                  label: const Text("Main Character"),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            animeListener.addAnime(nameController.text, characterController.text);
          }, child: const Text("Add new anime")),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                onTap: () => animeListener.removeAnime(addAnimeBuilder[index]),
                title: Text(addAnimeBuilder[index].anime),
                subtitle: Text(addAnimeBuilder[index].character),
                leading: const CircleAvatar(child: Text("0")),
              ),
              itemCount: addAnimeBuilder.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          )        ],
      ),
    );
  }
}
