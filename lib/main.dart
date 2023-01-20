import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_test/features/anime_list/view/anime_list_view.dart';
import 'package:riverpod_test/routing/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive [local storage]
  await Hive.initFlutter();
  await Hive.openBox('river-box');
  // Initialize GetIt [Dependency Injection]
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Sample Riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimeListView(),
      routes: pageRoutes,
    );
  }
}
