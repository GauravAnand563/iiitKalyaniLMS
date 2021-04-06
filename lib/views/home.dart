import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/models/tabs.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset('assets/images/background.jpg').image,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.dstATop),
                      fit: BoxFit.cover),
                ),
                child: Provider.of<TabViews>(context).getTabView(),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      BottomNavigationTabs(
                        index: 0,
                        iconData: CupertinoIcons.house_alt,
                      ),
                      BottomNavigationTabs(
                        index: 1,
                        iconData: CupertinoIcons.square_favorites_alt,
                      ),
                      Expanded(child: Container()),
                      BottomNavigationTabs(
                        index: 2,
                        iconData: CupertinoIcons.cart,
                      ),
                      BottomNavigationTabs(
                        index: 3,
                        iconData: CupertinoIcons.person,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ActionFab(),
          )
        ],
      ),
    ));
  }
}

class BottomNavigationTabs extends StatefulWidget {
  int index;
  IconData iconData;
  BottomNavigationTabs({Key? key, required this.index, required this.iconData})
      : super(key: key);

  @override
  _BottomNavigationTabsState createState() => _BottomNavigationTabsState();
}

class _BottomNavigationTabsState extends State<BottomNavigationTabs> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Provider.of<TabViews>(context, listen: false)
              .setTabView(widget.index);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Icon(
            widget.iconData,
            color:
                Provider.of<TabViews>(context, listen: false).selectedIndex ==
                        widget.index
                    ? Colors.green
                    : Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
