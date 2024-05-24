import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final firebaseProvider = Provider((ref) => FirebaseAuth.instance);
final fireStoreProvider = Provider((ref) => FirebaseFirestore.instance);
final googleAuthProvider = Provider((ref) => GoogleSignIn());
  