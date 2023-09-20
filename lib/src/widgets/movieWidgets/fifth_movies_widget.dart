
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';

import '../../utils/utils.dart';

class FifthMoviesWidget extends StatelessWidget {
  final Function() Tap;
  final String img;
  final String title;
  final String genre;
  final String type;
  final double rating;
  const FifthMoviesWidget({Key? key, required this.Tap, required this.img, required this.title, required this.rating, required this.genre, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return GestureDetector(
      onTap: Tap,
      child: Container(
        margin: EdgeInsets.only(left: 10 * w,right: 5 * w),
        width: 314 * w,
        height: 370 * h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(imageUrl: img,width: 294 * w,height: 174 * h,fit: BoxFit.cover,
                errorWidget: (context,url,error) => Image.network(
                  "https://media.istockphoto.com/id/1011988208/vector/404-error-like-laptop-with-dead-emoji-cartoon-flat-minimal-trend-modern-simple-logo-graphic.jpg?s=612x612&w=0&k=20&c=u_DL0ZH5LkX57_25Qa8hQVIl41F9D0zXlTgkWNnHRkQ="
                ),),
            ),
            SizedBox(height: 5 * h,),
            SizedBox(
              width: 314 * w,
              height: 30 * h,
              child: Text(title,style: GoogleFonts.montserrat(
                  textStyle: AppStyle.twelvebold(Theme.of(context).primaryColor)
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
                      textStyle: AppStyle.twelvebold(Theme.of(context).primaryColor)
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
