import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "nickName" field.
  String? _nickName;
  String get nickName => _nickName ?? '';
  bool hasNickName() => _nickName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "profilePhoto" field.
  String? _profilePhoto;
  String get profilePhoto => _profilePhoto ?? '';
  bool hasProfilePhoto() => _profilePhoto != null;

  // "backgroundPhoto" field.
  String? _backgroundPhoto;
  String get backgroundPhoto => _backgroundPhoto ?? '';
  bool hasBackgroundPhoto() => _backgroundPhoto != null;

  void _initializeFields() {
    _created = snapshotData['created'] as DateTime?;
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _nickName = snapshotData['nickName'] as String?;
    _email = snapshotData['email'] as String?;
    _profilePhoto = snapshotData['profilePhoto'] as String?;
    _backgroundPhoto = snapshotData['backgroundPhoto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  DateTime? created,
  String? firstName,
  String? lastName,
  String? nickName,
  String? email,
  String? profilePhoto,
  String? backgroundPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created': created,
      'firstName': firstName,
      'lastName': lastName,
      'nickName': nickName,
      'email': email,
      'profilePhoto': profilePhoto,
      'backgroundPhoto': backgroundPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.created == e2?.created &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.nickName == e2?.nickName &&
        e1?.email == e2?.email &&
        e1?.profilePhoto == e2?.profilePhoto &&
        e1?.backgroundPhoto == e2?.backgroundPhoto;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.created,
        e?.firstName,
        e?.lastName,
        e?.nickName,
        e?.email,
        e?.profilePhoto,
        e?.backgroundPhoto
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
