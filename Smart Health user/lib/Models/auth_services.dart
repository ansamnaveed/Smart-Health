import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User> get authStateChanges => _auth.idTokenChanges();
  Future<User> login(String email, String password) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final User user = result.user;

    return user;
  }

  Future<User> signUp(email, password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final User user = result.user;

    return user;
  }
}
