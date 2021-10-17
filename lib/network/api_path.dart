import 'api_base.dart';

enum APIPath {
  userrepo,
}

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.userrepo:
        return APIBase.baseURL + 'users/JakeWharton/repos';

      default:
        return '';
    }
  }
}
