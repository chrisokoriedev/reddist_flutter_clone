import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:reddist_clone_app/core/common/loader.dart';
import 'package:reddist_clone_app/core/common/sigin_button.dart';
import 'package:reddist_clone_app/core/constants/const.dart';
import 'package:reddist_clone_app/features/auth/controller/auth_controller.dart';
import 'package:reddist_clone_app/theme/pallete.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Image.asset(AppContants.appLogo, height: 40),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text('skip',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Pallete.blueColor)))
          ]),
      body: loading
          ? const LoaderWidget()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Dive into anything',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(AppContants.logoEmote, height: 300),
                    ),
                    const Gap(20),
                    const SignInButtion()
                  ],
                ),
              ),
            ),
    );
  }
}

