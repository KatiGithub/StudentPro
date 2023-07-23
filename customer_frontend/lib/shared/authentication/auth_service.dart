import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final _auth = FirebaseAuth.instance;

  String getUserID() {
    return _auth.currentUser!.uid;
  }

  Stream<bool> isLoggedIn() {
    return _auth.authStateChanges().map((user) => user != null);
  }

  void sendPasswordResetEmail(String email) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logOut() async {
    return _auth.signOut().then((_) {
      print(_auth.currentUser);
    });
  }

  Future<User?> authenticationWithEmailAndPassword(String email,
      String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential userCredential) {
      return userCredential.user;
    });
  }

  void verifySchoolEmail(String schoolEmail) async {
    return await _auth.currentUser!.sendEmailVerification();
  }

  Future<bool> checkEmailVerified(String schoolEmail) async {
    await _auth.currentUser!.reload();

    return _auth.currentUser!.emailVerified;
  }

  Future<User?> signUp({required String email, required String password}) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password)
        .then((UserCredential userCredential) {
          return userCredential.user;
    });
  }

  Future<bool> isLoggedInSingle() async {
    if(_auth.currentUser != null) {
      _auth.currentUser!.reload();
    }

    return _auth.currentUser != null;
  }

  Future<String?> getIdToken() async {
    return await _auth.currentUser!.getIdToken().then((String? idToken) {
      return idToken;
    });
  }
}