import 'package:flutter/material.dart';
import 'package:reddist_clone_app/core/constants/const.dart';
import 'package:reddist_clone_app/theme/pallete.dart';

class SignInButtion extends StatelessWidget {
  const SignInButtion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.greyColor,
            minimumSize: const Size(double.infinity, 45),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {},
        label: const Text(
          'Continue with Google',
          style: TextStyle(color: Pallete.whiteColor, fontSize: 18),
        ),
        icon: Image.asset(AppContants.googlepath, width: 30),
      ),
    );
  }
}
