import 'package:cloud_firestore/cloud_firestore.dart';

class UsersCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addUsersCollection(
      String name, String email, String password, String uid) async {
    try {
      await _firebaseFirestore.collection("users").doc(uid).set({
        "uid": uid,
        "name": name,
        "email": email,
        "password": password,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> editUsersCollection() async {}

  
  Future<void> deleteUsersCollection(String uid) async {
    try {
      await _firebaseFirestore.collection("users").doc(uid).delete();
    } catch (e) {
      return;
    }
  }
}
