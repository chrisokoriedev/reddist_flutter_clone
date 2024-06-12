import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddist_clone_app/core/constants/app_strings.dart';
import 'package:reddist_clone_app/theme/pallete.dart';
import 'package:routemaster/routemaster.dart';

import 'core/route/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: Pallete.darkModeAppTheme,
      // home: const LoginScreen(),
      routerDelegate:
          RoutemasterDelegate(routesBuilder: (context) => loggedOutROute),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
