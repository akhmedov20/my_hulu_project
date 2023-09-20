import 'package:flutter/cupertino.dart';

import '../../utils/utils.dart';


class MovieDetailWidget extends StatelessWidget {
  final String img;
  final String name;
  const MovieDetailWidget({Key? key, required this.img, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Container(
      margin: EdgeInsets.only(left: 8,right: 8),
      width: 142 * w,
      height: 156 * h,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(img,
              fit: BoxFit.cover,
              width: 142 * w,
              height: 106 * h,
            ),
          ),
          SizedBox(height: 10 * h,),
          SizedBox(
            width: 142,
            child: Text(name,style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 12 * h
            ),),
          ),

        ],
      ),
    );
  }
}
