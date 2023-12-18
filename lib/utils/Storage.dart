import 'package:localstorage/localstorage.dart';

class Storage {
  static final Storage _singleton = Storage._internal();

  factory Storage() {
    return _singleton;
  }

  Storage._internal();
}
