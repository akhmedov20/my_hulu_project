
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulu/src/ui/bottom_navigator_screen/bottom_navigator_screen.dart';
import 'package:hulu/src/ui/login/practise_login_screen.dart';
import 'package:hulu/src/ui/register/register_screen.dart';
import 'package:hulu/src/widgets/buttons/button_widget.dart';
import 'package:hulu/src/widgets/googleapplefacebook/face_apple_google_widget.dart';
import 'package:hulu/src/widgets/teftfield_widget/textfield_widget.dart';

import '../../utils/utils.dart';
import '../main/tv_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff000000),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return MainScreen();
          }
          else {
            return PractiseLoginScreen();
          }
        }
      ),
    );
  }
}
