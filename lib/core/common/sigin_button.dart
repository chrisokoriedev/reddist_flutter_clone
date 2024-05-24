import 'package:flutter/material.dart';
import 'package:reddist_clone_app/core/constants/const.dart';
import 'package:reddist_clone_app/theme/pallete.dart';

class SignInButtion extends StatelessWidget {
  const SignInButtion({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallete.greyColor,
      ),
      onPressed: () {},
      label: const Text(
        'Continue with Google',
        style: TextStyle(color: Pallete.whiteColor, fontSize: 18),
      ),
      icon: Image.asset(AppContants.googlepath, width: 30),
    );
  }
}
