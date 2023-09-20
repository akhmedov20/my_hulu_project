
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';

import '../../utils/utils.dart';

class MoviesWidget extends StatelessWidget {
  final Function() Tap;
  final String img;
  final String title;
  final String genre;
  final String type;
  final double rating;
  const MoviesWidget({Key? key, required this.Tap, required this.img, required this.title, required this.rating, required this.genre, required this.type}) : super(key: key);

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
              child: CachedNetworkImage(
                imageUrl: img,
                fit: BoxFit.cover,
                width: 194 * w,
                height: 253 * h,
                errorWidget: (context,url,error) =>
                    Image.network(
                        "https://img.freepik.com/free-vector/thoughtful-woman-with-laptop-looking-big-question-mark_1150-39362.jpg?w=2000"
                    ),
              ),
            ),
            SizedBox(height: 8 * h,),
            SizedBox(
              height: 40 * h,
              child: Text(title,style: GoogleFonts.montserrat(
                textStyle: AppStyle.twelvebold(Theme.of(context).iconTheme.color)
              ),),
            ),
            SizedBox(height: 8 * h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.star,size: 16,color: Colors.yellow,),
                SizedBox(width: 8 * w,),
                Padding(
                  padding: EdgeInsets.only(bottom: 5 * h),
                  child: Text(rating.toStringAsPrecision(2),style: GoogleFonts.montserrat(
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
