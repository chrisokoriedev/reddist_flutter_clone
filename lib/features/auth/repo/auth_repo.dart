import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddist_clone_app/core/constants/const.dart';
import 'package:reddist_clone_app/core/constants/firebase_constant.dart';
import 'package:reddist_clone_app/core/faliure.dart';
import 'package:reddist_clone_app/core/providers/firebase_provider.dart';
import 'package:reddist_clone_app/core/typedef.dart';
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
  FutureEither<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      UserCredential userCrl =
          await _firebaseAuth.signInWithCredential(credential);
      UserModel userModel;
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
      } else {
        userModel = await getUserData(userCrl.user!.uid).first;
      }
      return right(userModel);
    } on SocketException catch (e) {
      throw e.toString();
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Faliure(message: e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return users.doc(_firebaseAuth.currentUser!.uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }
}
