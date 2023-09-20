
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';

import '../../utils/utils.dart';

class LatestMoviesWidget extends StatelessWidget {
  final String img;
  final String title;
  final int time;
  final Function() bos;

  const LatestMoviesWidget({Key? key, required this.img, required this.title, required this.time, required this.bos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return GestureDetector(
      onTap: bos,
      child: Container(
        margin: EdgeInsets.only(left: 10 * w, right: 10 * w),
        width: 144 * w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(img,fit: BoxFit.cover,
              width: 144 * w,height: 180 * h,),
            ),
            SizedBox(height: 6 * h,),
            SizedBox(
              width: 120 * w,
              child: Text(title,style: GoogleFonts.montserrat(
                textStyle: AppStyle.twelvebold(Theme.of(context).iconTheme.color)
              ),),
            ),
            SizedBox(height: 8 * h,),
            Text(time.toString(),style: GoogleFonts.montserrat(
              textStyle: AppStyle.ten(Theme.of(context).iconTheme.color)
            ),),
            SizedBox(height: 10 * h,),
            Container(
              width: 122 * w,
              height: 30 * h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Theme.of(context).canvasColor,width: 1)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 8 * w,),
                  Icon(Icons.bookmark_add,size: 14,color: Theme.of(context).iconTheme.color),
                  SizedBox(width: 8 * w,),
                  Text("Add Watchlist",style: GoogleFonts.montserrat(
                    textStyle: AppStyle.ten(Theme.of(context).iconTheme.color)
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
