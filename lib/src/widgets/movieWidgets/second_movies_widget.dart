
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';

import '../../utils/utils.dart';

class SecondMoviesWidget extends StatelessWidget {
  final Function() Tap;
  final String img;
  final String title;
  final String genre;
  final String type;
  final String rating;
  const SecondMoviesWidget({Key? key, required this.Tap, required this.img, required this.title, required this.rating, required this.genre, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return GestureDetector(
      onTap: Tap,
      child: Container(
        margin: EdgeInsets.only(left: 10 * w,right: 10 * w),
        width: 194 * w,
        height: 330 * h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                img,
                fit: BoxFit.cover,
                width: 194 * w,
                height: 253 * h,
              ),
            ),
            SizedBox(height: 8 * h,),
            Text(title,style: GoogleFonts.montserrat(
                textStyle: AppStyle.twelvebold(Theme.of(context).iconTheme.color)
            ),),
            SizedBox(height: 8 * h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.star,size: 16,color: Colors.yellow,),
                SizedBox(width: 8 * w,),
                Padding(
                  padding: EdgeInsets.only(bottom: 5 * h),
                  child: Text(rating,style: GoogleFonts.montserrat(
                      textStyle: AppStyle.twelvebold(Colors.white)
                  ),),
                ),
                SizedBox(width: 5 * w,),
                Container(
                  margin: EdgeInsets.only(top: 3.5 * h),
                  width: 1.5 * w,
                  height: 10 * h,
                  color: Colors.white,
                ),
                SizedBox(width: 8 * w,),
                Padding(
                  padding: EdgeInsets.only(bottom: 5 * h),
                  child: Text(genre + '.',style: GoogleFonts.montserrat(
                      textStyle: AppStyle.twelvebold(Colors.grey)
                  ),),
                ),
                SizedBox(width: 8 * w,),
                Padding(
                  padding: EdgeInsets.only(bottom: 5 * h),
                  child: Text(type,style: GoogleFonts.montserrat(
                      textStyle: AppStyle.twelvebold(Colors.grey)
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
