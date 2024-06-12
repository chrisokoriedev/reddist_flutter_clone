import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddist_clone_app/core/common/error_text.dart';
import 'package:reddist_clone_app/core/constants/app_strings.dart';
import 'package:reddist_clone_app/features/auth/controller/auth_controller.dart';
import 'package:reddist_clone_app/theme/pallete.dart';
import 'package:routemaster/routemaster.dart';

import 'core/common/loader.dart';
import 'core/route/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangesProvider).when(
        data: (data) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: AppString.appName,
              theme: Pallete.darkModeAppTheme,
              routerDelegate: RoutemasterDelegate(
                routesBuilder: (context) =>
                    data != null ? loggedInROute : loggedOutROute,
              ),
              routeInformationParser: const RoutemasterParser(),
            ),
        error: (_, __) =>
            Center(child: ErrorTextWidget(errorText: _.toString())),
        loading: () => const LoaderWidget());
  }
}
