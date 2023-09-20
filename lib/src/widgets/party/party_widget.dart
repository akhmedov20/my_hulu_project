import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/widgets/buttons/second_button_widget.dart';

import '../../utils/utils.dart';
import '../textstyle/textstyle_widget.dart';

class PartyWidget extends StatelessWidget {
  final String party;
  final String profile;
  final String profile2;
  final String profile3;
  final String part2;
  final String part3;
  final String part4;
  final String buttonText;
  final Color buttonColor;
  final Function() pressProfile;
  final Function() pressProfile2;
  final Function() pressProfile3;
  final Function() buttonpress;
  const PartyWidget({Key? key, required this.party, required this.profile, required this.profile2, required this.profile3, required this.part2, required this.part3, required this.buttonColor, required this.pressProfile, required this.pressProfile2, required this.pressProfile3, required this.part4, required this.buttonText, required this.buttonpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Container(
      padding: EdgeInsets.only(left: 25 * w),
      width: 282 * w,
      height: 200 * h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).canvasColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 27 * h,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 36 * h,
            child: Stack(
              children: [
                Positioned(
                  left: 60 * w,
                  child: GestureDetector(
                    onTap: pressProfile,
                    child: Container(
                        width: 26  *w,
                        height: 26  *h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            border: Border.all(width: 1,color: Color(0xff393A3E))
                        ),
                        child: Center(child: Icon(CupertinoIcons.eye,size: 15 * h,))
                    ),
                  ),
                ),
                Positioned(
                  left: 40 * w,
                  child: GestureDetector(
                    onTap: pressProfile2,
                    child: Container(
                      width: 26  *w,
                      height: 26  *h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(width: 1,color: Colors.white)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: Image.network(
                          profile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20 * w,
                  child: GestureDetector(
                    onTap: pressProfile3,
                    child: Container(
                      width: 26  *w,
                      height: 26  *h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(width: 1,color: Colors.white)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: Image.network(
                          profile2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 14 * h,),
          Text(party,style: GoogleFonts.montserrat(
              textStyle: AppStyle.seventeen(Theme.of(context).iconTheme.color)
          ),),
          Text(part2,style: GoogleFonts.montserrat(
              textStyle: AppStyle.seventeen(Theme.of(context).iconTheme.color)
          ),),
          Text(part3,style: GoogleFonts.montserrat(
              textStyle: AppStyle.eight(Theme.of(context).iconTheme.color)
          ),),
          Text(part4,style: GoogleFonts.montserrat(
              textStyle: AppStyle.ten(Theme.of(context).iconTheme.color)
          ),),
          Row(
            children: [
              Spacer(),
              SecondButtonWidget(press: buttonpress, width: 89 * w, height: 25 * h, color: buttonColor,
                  icon: CupertinoIcons.scissors, text: buttonText, iconsize: 0.0, circular: 12),
              SizedBox(width: 15 * w,)
            ],
          )
        ],
      ),
    );
  }
}
