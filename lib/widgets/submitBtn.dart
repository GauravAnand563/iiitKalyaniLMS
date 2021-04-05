import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitButton extends StatefulWidget {
  String text;
  Function() onTap;

  SubmitButton({required this.text, required this.onTap});

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      curveType: CurveType.convex,
      parentColor: Color(0xffF6FAFE),
      color: Color(0xff2F4858),
      height: 60,
      borderRadius: 15,
      width: double.infinity,
      child: TextButton(
        onPressed: widget.onTap,
        child: Text(
          widget.text,
          style: GoogleFonts.montserrat(
              textStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
