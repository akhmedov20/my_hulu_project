import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/ui/bottom_navigator_screen/bottom_navigator_screen.dart';

import '../../utils/utils.dart';
import '../../widgets/buttons/button_widget.dart';
import '../../widgets/googleapplefacebook/face_apple_google_widget.dart';
import '../../widgets/teftfield_widget/textfield_widget.dart';
import '../register/register_screen.dart';

class PractiseLoginScreen extends StatefulWidget {
  const PractiseLoginScreen({Key? key}) : super(key: key);

  @override
  State<PractiseLoginScreen> createState() => _PractiseLoginScreenState();
}

class _PractiseLoginScreenState extends State<PractiseLoginScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  void dispose(){
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 70 * h,),
          Center(child: Text("Movie Studio",style: GoogleFonts.montserrat(
            textStyle: TextStyle(fontSize: 40)
          ),)),
          SizedBox(height: 137 * h,),
          TextFieldWidget(controller: controller, hintext: "Email or Username", width: 20, height: 10, horizontal: 20,),
          SizedBox(height: 23 * h,),
          TextFieldWidget(controller: controller2, hintext: "Password", width: 20, height: 10, horizontal: 20,),
          SizedBox(height: 20 * h,),
          Row(
            children: [
              SizedBox(width: 10 * w,),
              Checkbox(
                  focusColor: Colors.black,
                  value: _isChecked,
                  checkColor: Colors.white,
                  onChanged: (bool? value){
                    setState(() {
                      _isChecked = value!;
                    });
                  }),
              Opacity(
                opacity: 0.55,
                child: Text("Remember me",style: TextStyle(
                    fontSize: 15.89,
                    color: Colors.white
                ),),
              ),
              Spacer(),
              Opacity(
                opacity: 0.55,
                child: Text("Forget Password?",style: TextStyle(
                    fontSize: 15.89,
                    color: Colors.white
                ),),
              ),
              SizedBox(width: 20 * w,),
            ],
          ),
          SizedBox(height: 30 * h,),
          ButtonWidget(ontap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return MainScreen();
            }));
          }, text: 'Sign in',),
          SizedBox(height: 28 * h,),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20 * w, right: 10 * w),
                width: 108 * w,
                height: 0.5 * h,
                color: Colors.grey,
              ),
              Opacity(
                opacity: 0.55,
                child: Text("Or sign up using ",style: TextStyle(
                    fontSize: 14.89,
                    color: Colors.white
                ),),
              ),
              Container(
                margin: EdgeInsets.only(right: 20 * w, left: 10 * w),
                width: 108 * w,
                height: 0.5 * h,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(height: 33 * h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FAG(img: "assets/icons/facebook.svg", onPress: () {  },),
              FAG(img: "assets/icons/hulugoogle.svg", onPress: () {  },),
              FAG(img: "assets/icons/huluapple.svg", onPress: () {  },)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0.55,
                child: Text("Don’t have an account?",style: TextStyle(
                    fontSize: 14.89,
                    color: Colors.white
                ),),
              ),
              Opacity(
                  opacity: 0.55,
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return RegisterScreen();
                      }));
                    },
                    child: Text("Register",style: TextStyle(
                        fontSize: 14.89,
                        color: Color(0xff00CF71)
                    ),),
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: controller.text.trim(),
        password: controller2.text.trim()
    );
  }

}
