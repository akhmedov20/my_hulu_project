import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';

import '../../utils/utils.dart';

class SecondOnboardWidget extends StatelessWidget {
  const SecondOnboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 62  * h,),
          Text("DOWNLOAD",style: GoogleFonts.montserrat(
              textStyle: AppStyle.fifty(Color(0xff1CE783),)
          ),),
          Text("SHOWS",style: GoogleFonts.montserrat(
              textStyle: AppStyle.fifty(Colors.white)
          ),),
          SizedBox(
            height: 450 * h,
            child: Stack(
              children: [
                Text("& MOVIES",style: GoogleFonts.montserrat(
                    textStyle: AppStyle.fifty(Colors.white)
                ),),
                Positioned(
                  top: 35 * h,
                    left: 50 * w,
                    child: Image.asset("assets/images/phone.png",width: 176 * w,height: 356 * h,fit: BoxFit.fill,)),
                Positioned(
                  top: 40* h,
                    left: 62* w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/images/screen.png",width: 150 * w,height: 336 * h,fit: BoxFit.fill,))),
              ],
            ),
          ),
          Text("Always have something \n to watch offline ",textAlign: TextAlign.center,style: GoogleFonts.montserrat(
            textStyle: AppStyle.twelvebold(Colors.white)
          ),)
        ],
      )
    );
  }
}
