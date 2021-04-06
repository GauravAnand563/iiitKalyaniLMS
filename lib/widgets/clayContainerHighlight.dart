import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClayContainerHighlight extends StatelessWidget {
  bool isSpreadAllowed;
  IconData iconData;
  ClayContainerHighlight(
      {required this.iconData, this.isSpreadAllowed = false});
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
        spread: isSpreadAllowed ? null : 0,
        color: Colors.white,
        parentColor: Color(0xffF2F7FC),
        depth: 2,
        width: 40,
        height: 40,
        borderRadius: 15,
        child: Icon(
          iconData,
          color: Colors.blueGrey,
        ));
  }
}
