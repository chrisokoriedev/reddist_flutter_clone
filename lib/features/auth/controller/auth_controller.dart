import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddist_clone_app/core/constants/utils.dart';
import 'package:reddist_clone_app/features/auth/repo/auth_repo.dart';

final authControllerProvider = Provider(
    (ref) => AuthController(authRepoistory: ref.read(authRepoProvider)));

class AuthController {
  final AuthRepoistory _authRepoistory;

  AuthController({required AuthRepoistory authRepoistory})
      : _authRepoistory = authRepoistory;

  void signInWithGoogle(BuildContext context) async {
    final user = await _authRepoistory.signInWithGoogle();
    user.fold((l) => showSnacker(context, l.message), (r) => null);
  }
}
