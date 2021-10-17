import 'package:hive/hive.dart';
part 'hive_user_model.g.dart';

@HiveType(typeId: 1)
class HiveUserModel {
  @HiveField(1)
  final bool isLogin;

  HiveUserModel({
    required this.isLogin,
  });
}
