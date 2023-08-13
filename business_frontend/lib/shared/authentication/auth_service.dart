import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final _auth = FirebaseAuth.instance;

  static String _userJwtId = "";

  String getUserId() {
    return _auth.currentUser!.uid;
  }

  Stream<bool> isLoggedIn() {
    return _auth.authStateChanges().map((User? user) => user != null);
  }

  void logOut() async {
    return await _auth.signOut();
  }

  Future<User?> authenticationWithEmailAndPassword(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential userCredential) {
          return userCredential.user;
    });
  }

  String getCurrentToken() {
    return _userJwtId;
  }

  Future<String?> getIdToken() async {
    return _auth.currentUser!.getIdToken().then((String? idToken) {
      _userJwtId = idToken!;
      return idToken;
    });
  }

}