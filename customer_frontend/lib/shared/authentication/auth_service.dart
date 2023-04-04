import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final _auth = FirebaseAuth.instance;

  Stream<bool> isLoggedIn() {
    return _auth.authStateChanges().map((user) => user != null);
  }

  Future<bool> authenticationWithEmailAndPassword(String email,
      String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential userCredential) {
      if (userCredential.user != null) {
        return true;
      } else {
        return false;
      }
    });
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