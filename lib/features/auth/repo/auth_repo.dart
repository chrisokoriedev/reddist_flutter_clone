import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddist_clone_app/core/constants/const.dart';
import 'package:reddist_clone_app/core/providers/firebase_provider.dart';
import 'package:reddist_clone_app/models/user_model.dart';

final authRepoProvider = Provider((ref) => AuthRepoistory(
    firebaseAuth: ref.read(firebaseProvider),
    firebaseFirestore: ref.read(fireStoreProvider),
    googleSignIn: ref.read(googleAuthProvider)));

class AuthRepoistory {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepoistory(
      {required FirebaseAuth firebaseAuth,
      required FirebaseFirestore firebaseFirestore,
      required GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      UserCredential userCrl =
          await _firebaseAuth.signInWithCredential(credential);
      UserModel _userModel = UserModel(
          name: userCrl.user!.displayName!,
          profilePic: userCrl.user!.photoURL ?? AppContants.avatarDefault,
          banner: AppContants.bannerDefault,
          uid: userCrl.user!.uid,
          isAuthenticated: userCrl.user!.isAnonymous,
          karma: 0,
          awards: []);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
