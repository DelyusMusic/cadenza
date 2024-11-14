import 'package:cadenza/database/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<LocalUser?> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user!;

      return LocalUser.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future<LocalUser?> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user!;

      return LocalUser.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future editPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // выход с аккаунта
  Future logOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      return;
    }
  }

  // проверять есть ли аккаунт, слушаем поток с Firebase
  Stream<LocalUser?> get currentUser {
    return _firebaseAuth.authStateChanges().map(
          (User? user) => user != null ? LocalUser.fromFirebase(user) : null,
        );
  }

 
}
