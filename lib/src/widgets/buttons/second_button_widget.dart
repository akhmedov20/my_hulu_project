
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';

import '../../utils/utils.dart';

class SecondButtonWidget extends StatelessWidget {
  final Function() press;
  final double width;
  final double height;
  final double iconsize;
  final double circular;
  final Color color;
  final IconData icon;
  final String text;
  const SecondButtonWidget({Key? key, required this.press, required this.width, required this.height, required this.color, required this.icon, required this.text, required this.iconsize, required this.circular,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return GestureDetector(
      onTap: press,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circular),
          boxShadow: [
            BoxShadow(
              blurRadius: 1
            )
          ],
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 8 * w,),
            Icon(icon,color: Colors.black,size: iconsize,),
            SizedBox(width: 8 * w,),
            Text(text,style: GoogleFonts.montserrat(
              textStyle: AppStyle.eleven(Theme.of(context).primaryColor)
            ),)
          ],
        ),
      ),
    );
  }
}
