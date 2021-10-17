import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:github_explore/model/color_constant.dart';
import 'package:github_explore/model/hive/hive_user_model.dart';
import 'package:github_explore/providers/github_provider.dart';
import 'package:github_explore/repositories/repository.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool passwordVisible = true;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  var localAuth = LocalAuthentication();

  bool isEmail(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  void fakeLogin() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (!isEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid emial addresses"),
      ));
    } else if (password == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password can not be empty!"),
      ));
    } else {
      if (email == 'harsha@mail.com' && password == 'Test@123') {
        completeLogin();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Invalid email or password!"),
        ));
      }
    }
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await localAuth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await localAuth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await localAuth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await localAuth.authenticate(
          localizedReason:
              'Scan your fingerprint (or face or whatever) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      completeLogin();
      _authorized = message;
    });
  }

  void _cancelAuthentication() async {
    await localAuth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  void completeLogin() async {
    var provider = Provider.of<GithubProvider>(context, listen: false);
    HiveUserModel hiveUserModel = HiveUserModel(
      isLogin: true,
    );

    await Repositery().addHiveUser(hiveUserModel: hiveUserModel);
    List<dynamic> repositoryList =
        await Repositery().getUserRepository(page: 1, per_page: 8);

    provider.setRepositoryList(repositoryList);
    Navigator.of(context).pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Image.asset(
                  'assets/images/github_logo.png',
                ),
              ),
              // isLoading ? const LoadingIndicatorWidget() : const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 22),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your emil',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 14),
                child: TextField(
                  controller: _passwordController,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          passwordVisible
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 42),
                child: ElevatedButton(
                  onPressed: () {
                    fakeLogin();
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: const Size(67, 56),
                    shadowColor: app_theam_color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, top: 22, bottom: 32),
                child: Row(
                  children: const [
                    Expanded(
                        child: Divider(
                      color: Colors.black26,
                    )),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        'or continue with',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 14),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.black26,
                    ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Not avialable!"),
                      ));
                    },
                    child: Container(
                      width: 68,
                      height: 48,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(9))),
                      child: Image.asset(
                        'assets/images/fb_icon.png',
                        scale: 2.8,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: InkWell(
                      onTap: () async {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Not avialable!"),
                        ));
                      },
                      child: Container(
                        width: 68,
                        height: 48,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(9))),
                        child: Image.asset(
                          'assets/images/google_icon.png',
                          scale: 2.8,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _authenticateWithBiometrics();
                    },
                    child: Container(
                      width: 68,
                      height: 48,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(9))),
                      child: Image.asset(
                        'assets/images/fingerprint.png',
                        scale: 2.8,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
