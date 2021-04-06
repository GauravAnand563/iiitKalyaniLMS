import 'dart:ui';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/constants.dart';
import 'package:lms/services/auth.dart';
import 'package:lms/views/login.dart';
import 'package:lms/widgets/clayContainerHighlight.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class UserTab extends StatefulWidget {
  @override
  _UserTabState createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  bool _isSignedOut = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, left: 90, right: 90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    "assets/images/dp.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child:
                      ClayContainerHighlight(iconData: CupertinoIcons.camera),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          UserInfoRow(subtitle: '457', title: "Regd no."),
          UserInfoRow(subtitle: '9576983316', title: "Phone"),
          UserInfoRow(subtitle: '457_bt19@iiitkalyani.ac.in', title: "Email"),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: FrostedGlassUserInfo(
                  color: Colors.greenAccent,
                  title: 'Last Issued',
                  subtitle: '5-Apr-2021',
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: FrostedGlassUserInfo(
                  color: Colors.amberAccent,
                  title: 'Fines Paid',
                  subtitle: '₹ 100',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(CupertinoIcons.map),
            tileColor: Colors.white,
            title: Text('Address'),
            subtitle: Text(
              "Anand's, Road no.- 15, Basargarh, Hatia, Ranchi, Jharkhand",
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget getSignOutButton() {
    return ElevatedButton(
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
        child: Text('Sign Out'));
  }
}

class FrostedGlassUserInfo extends StatelessWidget {
  Color color;
  String title;
  IconData iconData;
  bool showActionButton;
  String subtitle;
  FrostedGlassUserInfo(
      {Key? key,
      required this.color,
      required this.subtitle,
      required this.title,
      this.iconData = CupertinoIcons.arrow_up,
      this.showActionButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      parentColor: Colors.white10,
      height: 100,
      borderRadius: 20,
      color: color,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200.withOpacity(0.5)),
            child: Row(
              mainAxisAlignment: showActionButton
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: kPageHeading3TextStyle.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      style: kPageSecondaryTextStyle,
                    )
                  ],
                ),
                showActionButton
                    ? ClayContainerHighlight(
                        isSpreadAllowed: false, iconData: iconData)
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserInfoRow extends StatelessWidget {
  String title;
  String subtitle;
  UserInfoRow({required this.subtitle, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        dense: true,
        tileColor: Colors.white,
        title: Text(
          title,
          style: kPageHeading3TextStyle,
        ),
        trailing: Text(
          subtitle,
          overflow: TextOverflow.ellipsis,
          style: kPageSecondaryTextStyle,
        ),
      ),
    );
  }
}
