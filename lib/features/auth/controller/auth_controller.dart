import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddist_clone_app/features/auth/repo/auth_repo.dart';

final authControllerProvider = Provider(
    (ref) => AuthController(authRepoistory: ref.read(authRepoProvider)));

class AuthController {
  final AuthRepoistory _authRepoistory;

  AuthController({required AuthRepoistory authRepoistory})
      : _authRepoistory = authRepoistory;

  void signInWithGoogle() async {
    _authRepoistory.signInWithGoogle();
  }
}
