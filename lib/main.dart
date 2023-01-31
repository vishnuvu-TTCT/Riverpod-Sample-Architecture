import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_test/routing/routes.dart';
import 'package:riverpod_test/utils/common_utils/theme/theme_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive [local storage]
  await Hive.initFlutter();
  await Hive.openBox('river-box');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      title: 'Sample Riverpod',
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch:Colors.red,
      ),
      themeMode: darkMode ? ThemeMode.dark: ThemeMode.light,
      routerConfig: router,
    );
  }
}
