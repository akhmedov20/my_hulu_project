
import 'package:flutter/material.dart';
import 'package:hulu/src/widgets/buttons/second_button_widget.dart';

import '../../utils/utils.dart';

class ContinueMoviesWidget extends StatelessWidget {
  final Function() press;
  final Function() onTap;
  final String img;
  const ContinueMoviesWidget({Key? key, required this.press, required this.onTap, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 10 * w, right: 10 * w),
        width: 300 * w,
        child: Stack(
          children: [
           ClipRRect(
               borderRadius: BorderRadius.circular(10),
               child: Image.network(img,fit: BoxFit.fitWidth,width: 300 * w,height: 184 * h,)),
           Positioned(
             top: 80 * h,
             left: 100 * w,
             child: SecondButtonWidget(press: press, width: 85 * w, height: 33 * h, color: Color(0xff1CE783),
                 icon: Icons.play_arrow, text:"Resume", iconsize: 9, circular: 20, ),
           )
          ],
        ),
      ),
    );
  }
}
