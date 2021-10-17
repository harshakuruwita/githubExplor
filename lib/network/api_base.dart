import 'package:flutter/foundation.dart';

class APIBase {
  static String get baseURL {
    if (kReleaseMode) {
      return 'https://api.github.com/';
    } else {
      return 'https://api.github.com/';
    }
  }
}
