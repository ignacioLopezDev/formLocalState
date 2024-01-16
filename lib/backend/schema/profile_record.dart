import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProfileRecord extends FirestoreRecord {
  ProfileRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "emailAdress" field.
  String? _emailAdress;
  String get emailAdress => _emailAdress ?? '';
  bool hasEmailAdress() => _emailAdress != null;

  // "photoProfile" field.
  String? _photoProfile;
  String get photoProfile => _photoProfile ?? '';
  bool hasPhotoProfile() => _photoProfile != null;

  // "nickName" field.
  String? _nickName;
  String get nickName => _nickName ?? '';
  bool hasNickName() => _nickName != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _firstName = snapshotData['firstName'] as String?;
    _lastName = snapshotData['lastName'] as String?;
    _emailAdress = snapshotData['emailAdress'] as String?;
    _photoProfile = snapshotData['photoProfile'] as String?;
    _nickName = snapshotData['nickName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profile');

  static Stream<ProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileRecord.fromSnapshot(s));

  static Future<ProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfileRecord.fromSnapshot(s));

  static ProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileRecordData({
  DateTime? createdTime,
  String? firstName,
  String? lastName,
  String? emailAdress,
  String? photoProfile,
  String? nickName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'firstName': firstName,
      'lastName': lastName,
      'emailAdress': emailAdress,
      'photoProfile': photoProfile,
      'nickName': nickName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfileRecordDocumentEquality implements Equality<ProfileRecord> {
  const ProfileRecordDocumentEquality();

  @override
  bool equals(ProfileRecord? e1, ProfileRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.emailAdress == e2?.emailAdress &&
        e1?.photoProfile == e2?.photoProfile &&
        e1?.nickName == e2?.nickName;
  }

  @override
  int hash(ProfileRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.firstName,
        e?.lastName,
        e?.emailAdress,
        e?.photoProfile,
        e?.nickName
      ]);

  @override
  bool isValidKey(Object? o) => o is ProfileRecord;
}
