import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddist_clone_app/core/constants/const.dart';
import 'package:reddist_clone_app/features/auth/controller/auth_controller.dart';
import 'package:reddist_clone_app/theme/pallete.dart';

class SignInButtion extends ConsumerWidget {
  const SignInButtion({super.key});

  void signInWithGoogle(WidgetRef ref) {
    ref.read(authControllerProvider).signInWithGoogle();
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
        onPressed: () => signInWithGoogle(ref),
        label: const Text(
          'Continue with Google',
          style: TextStyle(color: Pallete.whiteColor, fontSize: 18),
        ),
        icon: Image.asset(AppContants.googlepath, width: 30),
      ),
    );
  }
}

// A shared state that can be accessed by multiple widgets at the same time.
// @riverpod
// class Count extends _$Count {
//   @override
//   int build() => 0;

//   void increment() => state++;
// }

// // Consumes the shared state and rebuild when it changes
// class Title extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final count = ref.watch(countProvider);
//     return Text('$count');
//   }
// }