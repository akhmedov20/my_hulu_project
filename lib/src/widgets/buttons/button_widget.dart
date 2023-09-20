import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';

class ButtonWidget extends StatelessWidget {
  final Function() ontap;
  final String text;
  const ButtonWidget({Key? key, required this.ontap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20 * w),
        width: MediaQuery.of(context).size.width,
        height: 63 * h,
        decoration: BoxDecoration(
          color: Color(0xff00CF71),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(text,style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xff000000)
            )
          ),),
        ),
      ),
    );
  }
}
