import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';

import '../../utils/utils.dart';

class TvActorsWidget extends StatelessWidget {
  final String img;
  final String text;
  const TvActorsWidget({Key? key, required this.img, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Container(
      width: 134 * w,
      height: 190 * h,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(imageUrl: img,fit: BoxFit.cover,width: 134 * w,height: 150 * h,
              errorWidget: (context,url,error) =>
                  Image.network(
                      "https://img.freepik.com/free-vector/thoughtful-woman-with-laptop-looking-big-question-mark_1150-39362.jpg?w=2000"
                  )
            ),
          ),
          SizedBox(height: 10 * h,),
          Text(text,style: GoogleFonts.montserrat(
            textStyle: AppStyle.twelvebold(Theme.of(context).iconTheme.color)
          ),)
        ],
      )
    );
  }
}
