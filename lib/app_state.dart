import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _nickNameAppState = '';
  String get nickNameAppState => _nickNameAppState;
  set nickNameAppState(String value) {
    _nickNameAppState = value;
  }

  String _firstNameAppState = '';
  String get firstNameAppState => _firstNameAppState;
  set firstNameAppState(String value) {
    _firstNameAppState = value;
  }

  String _lastNameAppState = '';
  String get lastNameAppState => _lastNameAppState;
  set lastNameAppState(String value) {
    _lastNameAppState = value;
  }

  String _emailAppState = '';
  String get emailAppState => _emailAppState;
  set emailAppState(String value) {
    _emailAppState = value;
  }

  String _imageProfileAppState = '';
  String get imageProfileAppState => _imageProfileAppState;
  set imageProfileAppState(String value) {
    _imageProfileAppState = value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
