import 'dart:io';

import 'package:carbnote/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class UserRepo {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<User> getOneStream(String id) {
    return firestore
        .collection('users')
        .doc(id)
        .snapshots()
        .map((doc) => docToUser(doc));
  }

  Future<User> getOne(String id) async {
    final doc = await firestore.collection('users').doc(id).get();
    return docToUser(doc);
  }

  Future<User> create(User user) async {
    final ref = firestore.collection('users').doc(user.id);
    await ref.set(userToData(user.copyWith(
      id: ref.id,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    )));
    return await getOne(user.id);
  }

  Future<User> update(User user) async {
    final ref = firestore.collection('users').doc(user.id);
    await ref.update(userToData(user.copyWith(
      updatedAt: DateTime.now(),
    )));
    return await getOne(user.id);
  }

  Future<String> createImage(User user, File file) async {
    final ref = storage.ref('users').child(user.id).child(Uuid().v4());
    final task = await ref.putFile(file);
    return await task.ref.getDownloadURL();
  }

  User docToUser(DocumentSnapshot doc) {
    return User(
      id: doc.id,
      nickname: doc['nickname'] as String,
      imageURL: doc['imageURL'] as String,
      goalCarbGram: doc['goalCarbGram'] as int,
      isAnonymous: doc['isAnonymous'] as bool,
      updatedAt: (doc['updatedAt'] as Timestamp).toDate(),
      createdAt: (doc['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> userToData(User value) {
    return <String, dynamic>{
      'id': value.id,
      'nickname': value.nickname,
      'imageURL': value.imageURL,
      'goalCarbGram': value.goalCarbGram,
      'isAnonymous': value.isAnonymous,
      'updatedAt': Timestamp.fromDate(value.updatedAt),
      'createdAt': Timestamp.fromDate(value.createdAt),
    };
  }
}
