// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PhotoStruct extends FFFirebaseStruct {
  PhotoStruct({
    String? photo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _photo = photo,
        super(firestoreUtilData);

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;
  bool hasPhoto() => _photo != null;

  static PhotoStruct fromMap(Map<String, dynamic> data) => PhotoStruct(
        photo: data['photo'] as String?,
      );

  static PhotoStruct? maybeFromMap(dynamic data) =>
      data is Map ? PhotoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'photo': _photo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
      }.withoutNulls;

  static PhotoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PhotoStruct(
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PhotoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PhotoStruct && photo == other.photo;
  }

  @override
  int get hashCode => const ListEquality().hash([photo]);
}

PhotoStruct createPhotoStruct({
  String? photo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PhotoStruct(
      photo: photo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PhotoStruct? updatePhotoStruct(
  PhotoStruct? photoStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    photoStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPhotoStructData(
  Map<String, dynamic> firestoreData,
  PhotoStruct? photoStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (photoStruct == null) {
    return;
  }
  if (photoStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && photoStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final photoStructData = getPhotoFirestoreData(photoStruct, forFieldValue);
  final nestedData =
      photoStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = photoStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPhotoFirestoreData(
  PhotoStruct? photoStruct, [
  bool forFieldValue = false,
]) {
  if (photoStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(photoStruct.toMap());

  // Add any Firestore field values
  photoStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPhotoListFirestoreData(
  List<PhotoStruct>? photoStructs,
) =>
    photoStructs?.map((e) => getPhotoFirestoreData(e, true)).toList() ?? [];
