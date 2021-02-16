import 'package:carbnote/models/exception_model.dart';
import 'package:carbnote/models/record_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecordRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Record> getOne(String id, String userID) async {
    final doc = await firestore
        .collection('users')
        .doc(userID)
        .collection('records')
        .doc(id)
        .get();
    return docToRecord(doc);
  }

  Future<Record> create(Record record) async {
    final ref = firestore
        .collection('users')
        .doc(record.userID)
        .collection('records')
        .doc();
    await ref.set(recordToData(record.copyWith(
      id: ref.id,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    )));
    return await getOne(ref.id, record.userID);
  }

  RecordTimeType stringToTimeType(String value) {
    switch (value) {
      case 'breakfast':
        return RecordTimeType.breakfast;
      case 'lunch':
        return RecordTimeType.lunch;
      case 'dinner':
        return RecordTimeType.dinner;
      case 'snack':
        return RecordTimeType.snack;
    }
    throw AppException('${this}の処理がありません');
  }

  String timeTypeToString(RecordTimeType value) {
    switch (value) {
      case RecordTimeType.breakfast:
        return 'breakfast';
      case RecordTimeType.lunch:
        return 'lunch';
      case RecordTimeType.dinner:
        return 'dinner';
      case RecordTimeType.snack:
        return 'snack';
    }
    throw AppException('${this}の処理がありません');
  }

  Record docToRecord(DocumentSnapshot doc) {
    return Record(
      id: doc.id,
      userID: doc['userID'] as String,
      timeType: stringToTimeType(doc['timeType'] as String),
      name: doc['name'] as String,
      imageURL: doc['imageURL'] as String,
      intakeGram: doc['intakeGram'] as int,
      carbGram: doc['carbGram'] as int,
      recordedAt: (doc['recordedAt'] as Timestamp).toDate(),
      updatedAt: (doc['updatedAt'] as Timestamp).toDate(),
      createdAt: (doc['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> recordToData(Record value) {
    return <String, dynamic>{
      'id': value.id,
      'userID': value.userID,
      'timeType': timeTypeToString(value.timeType),
      'name': value.name,
      'imageURL': value.imageURL,
      'intakeGram': value.intakeGram,
      'carbGram': value.carbGram,
      'recordedAt': Timestamp.fromDate(value.recordedAt),
      'updatedAt': Timestamp.fromDate(value.updatedAt),
      'createdAt': Timestamp.fromDate(value.createdAt),
    };
  }
}
