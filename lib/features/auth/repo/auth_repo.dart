import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddist_clone_app/core/providers/firebase_provider.dart';

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
    print('start');
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await _firebaseAuth.signInWithCredential(credential);
      print('success');
    } catch (e) {
      print(e.toString());
      debugPrint(e.toString());
    }
  }
}