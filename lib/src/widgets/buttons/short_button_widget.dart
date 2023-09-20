import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ShortButtonWidget extends StatelessWidget {
  final IconData icon;
  final Function() press;
  const ShortButtonWidget({Key? key, required this.icon, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 41 * w,
        height: 41 * h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(41),
          color: Color(0xff4F4F4F)
        ),
        child: Center(
          child: Icon(icon,size: 15,color: Colors.white,),
        ),
      ),
    );
  }
}
