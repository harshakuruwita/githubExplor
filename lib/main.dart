import 'package:flutter/material.dart';
import 'package:github_explore/model/hive/hive_config.dart';
import 'package:github_explore/providers/github_provider.dart';

import 'package:github_explore/router.dart' as app_route;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.initHiveDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GithubProvider>(
            create: (context) => GithubProvider())
      ],
      child: const MaterialApp(
        initialRoute: '/splash',
        onGenerateRoute: app_route.Router.genarateRoute,
      ),
    );
  }
}
