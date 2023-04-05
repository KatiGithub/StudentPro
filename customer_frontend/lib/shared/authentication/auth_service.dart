import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final _auth = FirebaseAuth.instance;

  Stream<bool> isLoggedIn() {
    return _auth.authStateChanges().map((user) => user != null);
  }

  Future<User?> authenticationWithEmailAndPassword(String email,
      String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential userCredential) {
      return userCredential.user;
    });
  }

  void verifySchoolEmail(String schoolEmail) {
    _auth.currentUser!.sendEmailVerification();
  }

  Future<User?> signUp({required String email, required String password}) async {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password)
        .then((UserCredential userCredential) {
          return userCredential.user;
    });
  }

  bool isLoggedInSingle() {
    return !(_auth.currentUser == null);
  }
}