import 'package:flutter/material.dart';
import 'package:github_explore/model/color_constant.dart';
import 'package:github_explore/providers/github_provider.dart';
import 'package:github_explore/repositories/repository.dart';

import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<GithubProvider>(context, listen: false);

    Future.delayed(Duration(seconds: 4), () async {
      var hiveUserModel = await Repositery().getHiveUserModel();

      if (hiveUserModel == null) {
        Navigator.of(context).pushNamed('/user_login');
      } else {
        List<dynamic> repositoryList =
            await Repositery().getUserRepository(page: 1, per_page: 8);

        provider.setRepositoryList(repositoryList);
        Navigator.of(context).pushNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_theam_color,
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  child: Image.asset(
                    'assets/images/github_logo.png',
                    scale: 0.8,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Center(
                    child: Text(
                  'Github Explore',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      letterSpacing: 2),
                )),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
