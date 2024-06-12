import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddist_clone_app/core/constants/utils.dart';
import 'package:reddist_clone_app/features/auth/repo/auth_repo.dart';
import 'package:reddist_clone_app/models/user_model.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) => AuthController(
          authRepoistory: ref.watch(authRepoProvider),
          ref: ref,
        ));
final authStateChangesProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController._authRepoistory.userAuthChanges;
});

class AuthController extends StateNotifier<bool> {
  final AuthRepoistory _authRepoistory;
  final Ref _ref;

  AuthController({required AuthRepoistory authRepoistory, required Ref ref})
      : _authRepoistory = authRepoistory,
        _ref = ref,
        super(false);

  void signInWithGoogle(BuildContext context) async {
    state = true;
    final user = await _authRepoistory.signInWithGoogle();
    state = false;
    user.fold(
        (l) => showSnacker(context, l.message),
        (userModelReponse) => _ref
            .read(userProvider.notifier)
            .update((state) => userModelReponse));
  }
}
