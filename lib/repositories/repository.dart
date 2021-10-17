import 'package:github_explore/model/github_model.dart';
import 'package:github_explore/model/hive/hive_config.dart';
import 'package:github_explore/model/hive/hive_user_model.dart';
import 'package:github_explore/network/api_path.dart';
import 'package:github_explore/network/http_client.dart';

class Repositery {
  Future<List<dynamic>> getUserRepository(
      {required int page, required int per_page}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    String uriPath = APIPathHelper.getValue(APIPath.userrepo) +
        '?page=$page&per_page=$per_page';

    var responce = await HttpClient.instance.getRequst(uriPath, headers);

    List<dynamic> list = responce;
    GithubModel githubModel = GithubModel.fromJson(list[0]);

    return list;
  }

  Future<bool> addHiveUser({required HiveUserModel hiveUserModel}) async {
    final hiveUserBox = await HiveConfig().openUserBox();

    hiveUserBox.add(hiveUserModel);
    return true;
  }

  Future<HiveUserModel?> getHiveUserModel() async {
    final hiveUserBox = await HiveConfig().openUserBox();

    final hiveUserModel = hiveUserBox.get(0);
    return hiveUserModel;
  }
}
