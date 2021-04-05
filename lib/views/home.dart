import 'package:flutter/material.dart';
import 'package:lms/services/auth.dart';
import 'package:lms/views/login.dart';
import 'package:lms/widgets/fab.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static String id = 'homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSignedOut = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isSignedOut,
      dismissible: false,
      child: SafeArea(
          child: Scaffold(
        floatingActionButton: ActionFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/images/background.jpg').image,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Hello World!"),
              ElevatedButton(
                  onPressed: () async {
                    final _auth = Provider.of<Auth>(context, listen: false);
                    setState(() {
                      _isSignedOut = true;
                    });
                    var result = await _auth.signOut(context: context);
                    setState(() {
                      _isSignedOut = false;
                    });
                    if (result) {
                      Navigator.popAndPushNamed(context, LoginPage.id);
                    }
                  },
                  child: Text('Sign Out'))
            ],
          ),
        ),
      )),
    );
  }
}
