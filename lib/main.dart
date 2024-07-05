import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/core/router/router.dart';
import 'package:tread_clone_assignment/core/theme/thread_theme.dart';
import 'package:tread_clone_assignment/features/settings/account/repo/theme_config_repo.dart';
import 'package:tread_clone_assignment/features/settings/account/view_model.dart/theme_config_vm.dart';
import 'package:tread_clone_assignment/core/firebase_options.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = ThemeConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        themeConfigProvider.overrideWith(
          () => ThemeConfigViewModel(repository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      isDarkMode(ref) ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    );
    setState(() {});
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      themeMode: ref.watch(themeConfigProvider).darkmode
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Thread Clone',
      theme: ThreadTheme.lightTheme(context),
      darkTheme: ThreadTheme.darkTheme(context),
    );
  }
}
