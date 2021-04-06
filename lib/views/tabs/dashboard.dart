import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms/constants.dart';
import 'package:lms/widgets/clayContainerHighlight.dart';
import 'package:lms/widgets/issuedBookCard.dart';
import 'package:lms/widgets/shelfBooksCard.dart';
import 'package:lms/widgets/submitBtn.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashBoardTab extends StatefulWidget {
  @override
  _DashBoardTabState createState() => _DashBoardTabState();
}

class _DashBoardTabState extends State<DashBoardTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Hi, Gaurav!',
                  style: kPageHeading3TextStyle,
                ),
                Spacer(),
                ClayContainerHighlight(
                  iconData: CupertinoIcons.bell,
                ),
                SizedBox(
                  width: 10,
                ),
                ClayContainerHighlight(iconData: CupertinoIcons.search)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SubmitButton(
              text: 'Due Date : 15-Apr-2021',
              onTap: () {},
              pColor: Colors.green.shade600.withAlpha(200),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Issued Books',
              style: kPageTitleTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 180,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return IssuedBookCard();
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Find in Library',
              style: kPageTitleTextStyle.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 30,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                        disabledColor: Colors.amber.shade700.withOpacity(0.2),
                        label: Text(
                          'Operating Systems',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                  fontWeight: FontWeight.w400)),
                        ),
                        selected: false),
                  );
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    child: ShelfBooksCard(),
                    margin: EdgeInsets.only(bottom: 10),
                  );
                })
          ],
        ));
  }
}