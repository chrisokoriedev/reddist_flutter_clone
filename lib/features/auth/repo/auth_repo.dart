import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddist_clone_app/core/constants/const.dart';
import 'package:reddist_clone_app/core/constants/firebase_constant.dart';
import 'package:reddist_clone_app/core/providers/firebase_provider.dart';
import 'package:reddist_clone_app/models/user_model.dart';

final authRepoProvider = Provider((ref) => AuthRepoistory(
    firebaseAuth: ref.read(firebaseProvider),
    firebaseFirestore: ref.read(fireStoreProvider),
    googleSignIn: ref.read(googleAuthProvider)));

class AuthRepoistory {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepoistory(
      {required FirebaseFirestore firebaseFirestore,
      required FirebaseAuth firebaseAuth,
      required GoogleSignIn googleSignIn})
      : _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;
  CollectionReference get users =>
      FirebaseFirestore.instance.collection(FirebaseContants.usersCollection);
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      UserCredential userCrl =
          await _firebaseAuth.signInWithCredential(credential);
      late UserModel userModel;
      if (userCrl.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            name: userCrl.user!.displayName!,
            profilePic: userCrl.user!.photoURL ?? AppContants.avatarDefault,
            banner: AppContants.bannerDefault,
            uid: userCrl.user!.uid,
            isAuthenticated: true,
            karma: 0,
            awards: []);
        await users.doc(userCrl.user!.uid).set(userModel.toMap());
      }
      return userModel;
    } catch (e) {
      rethrow;
    }
  }
}
