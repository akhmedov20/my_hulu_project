import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/utils.dart';

class FAG extends StatelessWidget {
  final String img;
  final Function() onPress;
  const FAG({Key? key, required this.img, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(left: 15,right: 15),
        width: 53 * w,
        height: 48 * h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CupertinoColors.black,
          border: Border.all(color: Colors.white,width: 1),
          boxShadow: [
            BoxShadow(
              offset: Offset(1.22,1.22)
            )
          ]
        ),
        child: Center(
          child: SvgPicture.asset(img),
        ),
      ),
    );
  }
}
