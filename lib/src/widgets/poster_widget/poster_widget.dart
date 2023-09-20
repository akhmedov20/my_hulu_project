import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui/search/search_screen.dart';
import '../../utils/utils.dart';
import '../buttons/third_button_widget.dart';
import '../textstyle/textstyle_widget.dart';

class PosterWidget extends StatelessWidget {
  final String img;
  final String title;
  final String about;
  final int date;
  const PosterWidget({Key? key, required this.img, required this.title, required this.about, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return  Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: img,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            errorWidget: (context, url, error) =>
                Image.asset("assets/images/logohulu.png"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15 * w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text("Recommended movies",style: GoogleFonts.montserrat(
                  textStyle: AppStyle.eleven(Colors.white),
                ),),
                SizedBox(height: 8 * h,),
                Text(title + date.toString(),
                  style: GoogleFonts.montserrat(
                    textStyle: AppStyle.twentyfourbold(Colors.white),
                  ),),
                SizedBox(height: 12 * h,),
                Text(about,style: GoogleFonts.montserrat(
                  textStyle: AppStyle.ten(Colors.white),
                ),),
                SizedBox(height: 25 * h,),
                Row(
                  children: [
                    ThirdButtonWidget(ontap: (){}, text: "Watch", width: 139 * w, height: 46 * h, circular: 36.6,
                        fontsize: 13 * h, color: Color(0xff35C658), textcolor: Colors.black),
                    SizedBox(width: 15 * w,),
                    ThirdButtonWidget(ontap: (){}, text: "Trailer", width: 139 * w, height: 46 * h, circular: 36.6,
                        fontsize: 13 * h, color: Colors.black, textcolor: Colors.white),
                  ],
                ),
                SizedBox(height: 150 * h,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
