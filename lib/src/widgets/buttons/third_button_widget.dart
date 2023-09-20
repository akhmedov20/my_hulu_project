import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/widgets/color/color_widget.dart';

import '../../utils/utils.dart';

class ThirdButtonWidget extends StatelessWidget {
  final Function() ontap;
  final String text;
  final double width;
  final double height;
  final double circular;
  final double fontsize;
  final Color color;
  final Color textcolor;
  const ThirdButtonWidget({Key? key, required this.ontap, required this.text, required this.width, required this.height, required this.circular, required this.fontsize, required this.color, required this.textcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.grey),
            color: color,
            borderRadius: BorderRadius.circular(circular)
        ),
        child: Center(
          child: Text(text,style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontsize,
                  color: textcolor
              )
          ),),
        ),
      ),
    );
  }
}
