import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulu/src/ui/bottom_navigator_screen/bottom_navigator_screen.dart';
import 'package:hulu/src/ui/login/login_screen.dart';
import 'package:hulu/src/ui/main/tv_screen.dart';
import 'package:hulu/src/ui/register/conirmation_screen.dart';
import 'package:hulu/src/widgets/buttons/button_widget.dart';
import 'package:hulu/src/widgets/teftfield_widget/textfield_widget.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';
import '../../utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff000000),
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
            TextFieldWidget(controller: controller, hintext: "Email", width: 20, height: 10, horizontal: 0,),
            SizedBox(height: 20 * h,),
            TextFieldWidget(controller: controller2, hintext: "Password", width: 20, height: 10, horizontal: 0,),
            SizedBox(height: 20 * h,),
            TextFieldWidget(controller: controller3, hintext: "Confirm Password", width: 20, height: 10, horizontal: 0,),
            SizedBox(height: 20 * h,),
            TextFieldWidget(controller: controller4, hintext: "Your Number", width: 20, height: 10, horizontal: 0,),
            SizedBox(height: 20 * h,),
            ButtonWidget(ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MainScreen();
              }));
            }, text: "Create Account"),
            SizedBox(height: 20 * h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 44),
              width: MediaQuery.of(context).size.width,
              height: 30 * h,
              child: Text("By logging. your agree to our Terms & Conditions and Privacy Policy.",textAlign: TextAlign.center,style: AppStyle.eleven(Colors.white),),
            ),
            SizedBox(height: 36 * h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: 0.55,
                  child: Text("Already have an account?",style: TextStyle(
                      fontSize: 14.89,
                      color: Colors.white
                  ),),
                ),
                Opacity(
                    opacity: 0.55,
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return LoginScreen();
                        }));
                      },
                      child: Text("Login in",style: TextStyle(
                          fontSize: 14.89,
                          color: Color(0xff00CF71)
                      ),),
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
