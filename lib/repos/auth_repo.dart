import 'dart:io';

import 'package:carbnote/models/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AuthRepo {
  Stream<AuthUser> currentUserChanges() {
    return FirebaseAuth.instance.userChanges().map((user) {
      print(user.photoURL);
      return _firebaseUserToAuthUser(user);
    });
  }

  AuthUser getCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    return _firebaseUserToAuthUser(user);
  }

  Future<void> updateCurrentUser({
    @required String nickname,
    @required String imageURL,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    await user.updateProfile(displayName: nickname, photoURL: imageURL);
    await user.reload();
    return _firebaseUserToAuthUser(user);
  }

  Future<String> uploadUserImage({
    @required String userID,
    @required File file,
  }) async {
    final snapshot = await FirebaseStorage.instance
        .ref('/users/$userID/${Uuid().v4()}')
        .putFile(file);
    return await snapshot.ref.getDownloadURL();
  }

  Future<AuthUser> signUpWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final user = credential.user;
    return _firebaseUserToAuthUser(user);
  }

  Future<AuthUser> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final user = credential.user;
    return _firebaseUserToAuthUser(user);
  }

  Future<AuthUser> signInAnonymously() async {
    final credential = await FirebaseAuth.instance.signInAnonymously();
    final user = credential.user;
    return _firebaseUserToAuthUser(user);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  AuthUser _firebaseUserToAuthUser(User user) {
    return user == null
        ? null
        : AuthUser(
            id: user.uid,
            email: user.email,
            nickname: user.displayName,
            imageURL: user.photoURL,
            isAnonymous: user.isAnonymous,
          );
  }
}
