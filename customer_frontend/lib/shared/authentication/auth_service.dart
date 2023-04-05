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

  void verifySchoolEmail(String schoolEmail) async {
    return await _auth.currentUser!.sendEmailVerification();
  }

  Future<bool> checkEmailVerified(String schoolEmail) async {
    await _auth.currentUser!.reload();

    return _auth.currentUser!.emailVerified;
  }

  Future<User?> signUp({required String email, required String password}) async {
    return _auth.createUserWithEmailAndPassword(
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
}