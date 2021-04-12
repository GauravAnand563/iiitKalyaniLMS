import 'package:firebase_auth/firebase_auth.dart';
import 'package:lms/views/home.dart';
import 'package:lms/views/login.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static String id = 'splashPage';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // CustomUser? _user;
  Future<void> navigate() async {
    final _user = FirebaseAuth.instance.currentUser;
    return Future.delayed(Duration(milliseconds: 500), () {
      if (_user == null)
        Navigator.popAndPushNamed(context, LoginPage.id);
      else
        Navigator.popAndPushNamed(context, HomePage.id);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => afterFirstLayout(context));
  }

  void afterFirstLayout(BuildContext context) => navigate();

  @override
  Widget build(BuildContext context) {
    // _user = Provider.of<CustomUser?>(context);
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/images/background.jpg').image,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              fit: BoxFit.cover),
        ),
        child: Image.asset(
          'assets/images/logo_dark.png',
        ),
      ),
    ));
  }
}
