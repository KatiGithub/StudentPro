import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final _auth = FirebaseAuth.instance;

  static String _userJwtId = "";

  String getUserID() {
    return _auth.currentUser!.uid;
  }

  Stream<bool> isLoggedIn() {
    return _auth.authStateChanges().map((user) => user != null);
  }

  String getcurrentToken() {
    return _userJwtId;
  }

  void sendPasswordResetEmail(String email) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut().then((_) {
      _userJwtId = "";
      print(_auth.currentUser);
      if(_auth.currentUser == null) {
        exit(0);
      }
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
    return _auth.currentUser!.getIdToken().then((String? idToken) {
      _userJwtId = idToken!;
      return idToken;
    });
  }

  void sendEmailVerificationAgain() {
    _auth.sendPasswordResetEmail(email: _auth.currentUser!.email!);
  }
}