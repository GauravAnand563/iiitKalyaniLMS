import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ShelfBooksCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 80,
            margin: EdgeInsets.only(right: 10),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              "https://covers.openlibrary.org/b/id/8739161-L.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Operating Systems',
                style: kPageSubtitleTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Modern OS',
                style: kPageHeading3TextStyle,
              ),
              Text(
                'Galvin',
                style: kPageSecondaryTextStyle,
              ),
              Icon(CupertinoIcons.heart)
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularPercentIndicator(
                  center: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Spacer(),
                      Spacer(),
                      Icon(
                        CupertinoIcons.shopping_cart,
                        color: Colors.orange,
                      ),
                      Icon(
                        CupertinoIcons.arrow_right,
                        size: 14,
                      ),
                      Spacer(),
                    ],
                  ),
                  progressColor: Colors.blueGrey,
                  percent: 0.6,
                  radius: 65,
                ),
                Text('3/4')
              ],
            ),
          )
        ],
      ),
    );
  }
}
