import 'package:carbnote/models/auth_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:flutter/material.dart';

class AuthUserRepo {
  final fa.FirebaseAuth auth = fa.FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<AuthUser> onCurrentChanges() {
    return auth.userChanges().map((fbUser) => fbUser?.toAuthUser());
  }

  AuthUser getCurrent() {
    return auth.currentUser?.toAuthUser();
  }

  Future<AuthUser> updateEmail({
    @required String newEmail,
    @required String email,
    @required String password,
  }) async {
    final user = auth.currentUser;
    await user.reauthenticateWithCredential(fa.EmailAuthProvider.credential(
      email: email,
      password: password,
    ));
    await user.updateEmail(newEmail);
    await user.reload();
    return user.toAuthUser();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future<AuthUser> linkWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    final user = auth.currentUser;
    await user.linkWithCredential(fa.EmailAuthProvider.credential(
      email: email,
      password: password,
    ));
    await user.reload();
    return user.toAuthUser();
  }

  Future<AuthUser> signUpWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    final credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user?.toAuthUser();
  }

  Future<AuthUser> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    final credential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user.toAuthUser();
  }

  Future<AuthUser> signInAnonymously() async {
    final credential = await auth.signInAnonymously();
    return credential.user.toAuthUser();
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}

extension ExFirebaseUser on fa.User {
  AuthUser toAuthUser() {
    return AuthUser(
      id: uid,
      email: email,
      isAnonymous: isAnonymous,
    );
  }
}
