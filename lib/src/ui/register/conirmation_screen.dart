import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/widgets/buttons/button_widget.dart';
import 'package:pinput/pinput.dart';

import '../../utils/utils.dart';
import '../../widgets/textstyle/textstyle_widget.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final pinController = TextEditingController();
  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    final defaultPinTheme = PinTheme(
      padding: EdgeInsets.symmetric(horizontal: 10 * w),
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),),
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20 * w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30 * h,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black),
                onPressed: (){
                  Navigator.pop(context);
                }, child: Icon(CupertinoIcons.left_chevron,size: 22,color: Colors.white,)
            ),
            SizedBox(height: 30 * h,),
            Text("Create Account",style: AppStyle.thirtythree(Color(0xff1CE783)),),
            SizedBox(height: 10 * h,),
            Text("Register now and start exploring all that our app has to offer. We’re excited to welcome you to our community!",style: AppStyle.thirteen(Colors.white),),
            SizedBox(height: 38 * h,),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              length: 5,
              controller: pinController,
            ),
            SizedBox(height: 33  *h,),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: ButtonWidget(ontap: (){}, text: "Confirm"),
            ),
            SizedBox(height: 22 * h,),
            Row(
              children: [
                Spacer(),
                TextButton(onPressed: (){}, child: Text('R  esent code',style: GoogleFonts.montserrat(
                    textStyle: AppStyle.eleven(Colors.white)
                ),)),
                SizedBox(width: 15 * w,)
              ],
            ),
            Spacer(),
            Text("By clicking “ CONFIRM “  you accepted our  Terms & Conditions",style: GoogleFonts.montserrat(
              textStyle: AppStyle.ten(Colors.white)
            ),),
            Center(
              child: Text("User Agreement ",style: GoogleFonts.montserrat(
                  textStyle: AppStyle.ten(Colors.green)
              ),),
            ),
            SizedBox(height: 20 * h,)
          ],
        ),
      ),
    );
  }
}
