import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/widgets/clayContainerHighlight.dart';

class SubmitButton extends StatefulWidget {
  double height;
  String text;
  bool isActionEnabled;
  Function() onTap;
  Color? pColor;
  Color? sColor;

  SubmitButton(
      {required this.text,
      this.height = 60,
      this.isActionEnabled = false,
      required this.onTap,
      this.pColor,
      this.sColor});

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      curveType: CurveType.convex,
      parentColor: widget.sColor ?? Color(0xffF6FAFE),
      color: widget.pColor ?? Color(0xff2F4858),
      height: widget.height,
      borderRadius: 15,
      width: double.infinity,
      child: widget.isActionEnabled
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.text,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ),
                ClayContainerHighlight(iconData: CupertinoIcons.chevron_forward)
              ],
            )
          : TextButton(
              onPressed: widget.onTap,
              child: Text(
                widget.text,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ),
            ),
    );
  }
}
