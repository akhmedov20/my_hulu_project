
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintext;
  final double width;
  final double height;
  final double horizontal;
  TextFieldWidget({Key? key, required this.controller, required this.hintext, required this.width, required this.height, required this.horizontal}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _icon = false;

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Container(
      padding: EdgeInsets.only(left: widget.width,top: widget.height),
      margin: EdgeInsets.symmetric(horizontal: widget.horizontal),
      width: MediaQuery.of(context).size.width,
      height: 83 * h,
      decoration: BoxDecoration(
        color: Color(0xff232429),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Opacity(
        opacity: 0.55,
        child: TextField(
          style: TextStyle(
              fontSize: 15.89,
              color: Colors.white
          ),
          controller: widget.controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: _icon ? Icon(CupertinoIcons.eye,size: 20,) : null,
            hintText: widget.hintext,
            hintStyle: TextStyle(
              fontSize: 15.89,
              color: Colors.white
            )
          ),
        ),
      ),
    );
  }
}
