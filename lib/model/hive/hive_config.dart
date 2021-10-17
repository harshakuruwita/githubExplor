import 'dart:io';

import 'package:github_explore/model/hive/hive_user_model.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static const String userBox = 'userBox';

  static Future<void> initHiveDatabase() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocDirectory.path);

    Hive.registerAdapter(HiveUserModelAdapter());
  }

  Future<Box> openUserBox() async {
    var userBoxInstance = await Hive.openBox(userBox);
    return userBoxInstance;
  }
}
