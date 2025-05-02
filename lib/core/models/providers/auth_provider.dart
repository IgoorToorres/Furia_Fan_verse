import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  AuthProvider() {
    user = _auth.currentUser;
    _auth.authStateChanges().listen((User? newUser) {
      user = newUser;
      notifyListeners();
    });
  }

  bool get isLoggedIn => user != null;

  Future<void> register({
    required String name,
    required String email,
    required String password,
    String? photoUrl,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      if (photoUrl != null) {
        await credential.user?.updatePhotoURL(photoUrl);
      }
      user = credential.user;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = credential.user;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    user = null;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // Usuário cancelou

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      user = userCredential.user;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
