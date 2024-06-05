import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddist_clone_app/core/constants/const.dart';
import 'package:reddist_clone_app/features/auth/controller/auth_controller.dart';
import 'package:reddist_clone_app/theme/pallete.dart';

class SignInButtion extends ConsumerWidget {
  const SignInButtion({super.key});

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.greyColor,
            minimumSize: const Size(double.infinity, 45),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () => signInWithGoogle(context, ref),
        label: const Text(
          'Continue with Google',
          style: TextStyle(color: Pallete.whiteColor, fontSize: 18),
        ),
        icon: Image.asset(AppContants.googlepath, width: 30),
      ),
    );
  }
}

