import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/main.dart';
import 'package:hulu/src/widgets/buttons/button_widget.dart';
import 'package:hulu/src/widgets/buttons/second_button_widget.dart';
import 'package:hulu/src/widgets/buttons/short_button_widget.dart';
import 'package:hulu/src/widgets/changeThemeButton/change_theme_button_widget.dart';
import 'package:hulu/src/widgets/switch_adpative_widget/switch_adaptive_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../utils/utils.dart';
import '../../widgets/textstyle/textstyle_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 20 * w),
            width: 73 * w,
            height: 38 * h,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(CupertinoIcons.left_chevron,size: 22 * h,color: Theme.of(context).iconTheme.color,),
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 20 * w),
          child: Text("Settings",style: GoogleFonts.montserrat(
            textStyle: AppStyle.twenty(Theme.of(context).iconTheme.color),
          ),),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20 * w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24 * h,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180 * h,
              child: Row(
                children: [
                  SizedBox(width: 20  * w,),
                  Container(
                    width: 108 * w,
                    height: 176 * h,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 4 * w,
                            top: 4 * h,
                            child: ShortButtonWidget(icon: CupertinoIcons.refresh, press: (){})),
                        Positioned(
                          top: 43 * h,
                            left: 8 * w,
                            child: Image.asset("assets/images/huluprofile2.png",fit: BoxFit.cover,width: 98 * w,height: 136 * h,)),
                      ],
                    ),
                  ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10 * w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Profile",style: GoogleFonts.montserrat(
                            textStyle: AppStyle.twenty(Theme.of(context).iconTheme.color),
                          ),),
                          SizedBox(height: 14 * h,),
                          Row(
                            children: [
                              SecondButtonWidget(press: (){}, width: 96 * w, height: 34 * h, color: Colors.white, icon: Icons.circle, text: 'Helmi', iconsize: 8, circular: 18,),
                              SizedBox(width: 15 * w,),
                              Text("Status .  ",style: GoogleFonts.montserrat(
                                textStyle: AppStyle.ten(Theme.of(context).iconTheme.color),
                              ),),
                              Text("Active",style: GoogleFonts.montserrat(
                                textStyle: AppStyle.ten(Theme.of(context).iconTheme.color),
                              ),),
                            ],
                          ),
                          SizedBox(height: 20 * h,),
                          Text("App Language ",style: GoogleFonts.montserrat(
                            textStyle: AppStyle.twenty(Theme.of(context).iconTheme.color),
                          ),),
                          SizedBox(height: 20 * h,),
                          Container(
                            width: 211 * w,
                            height: 32* h,
                            color: Theme.of(context).canvasColor,
                            child: Row(
                              children: [
                                SizedBox(width: 20 * w,),
                                Text("English",style: GoogleFonts.montserrat(
                                  textStyle: AppStyle.ten(Theme.of(context).iconTheme.color),
                                ),),
                               Spacer(),
                               IconButton(
                                  onPressed: (){},
                                  icon: Icon(CupertinoIcons.right_chevron,size: 14 * h,color: Theme.of(context).iconTheme.color,),
                                ),
                              ],
                            )
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 22 * h,),
            Padding(
              padding: EdgeInsets.only(left: 15 * w),
              child: Text("Settings",style: GoogleFonts.montserrat(
                textStyle: AppStyle.twenty(Theme.of(context).iconTheme.color),
              ),),
            ),
            SizedBox(height: 16 * h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10 * w,vertical: 5 * h),
              height: 56 * h,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  border: Border.all(color: Theme.of(context).primaryColorDark)
              ),
              child: ListTile(
                title: Text("Only by Wi-fi",style: GoogleFonts.montserrat(
                  textStyle: AppStyle.fourteen(Theme.of(context).iconTheme.color),
                ),),
                trailing: SwitchAdaptiveWidget(),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10  *w,vertical: 5 * h),
              height: 56 * h,
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                border: Border.all(color: Theme.of(context).primaryColorDark)
              ),
              child: ListTile(
                title: Text("Light & Dark Mode",style: GoogleFonts.montserrat(
                  textStyle: AppStyle.fourteen(Theme.of(context).iconTheme.color),
                ),),
                trailing: ChangeThemeButtonWidget(),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10 * w,vertical: 5 * h),
              height: 56 * h,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  border: Border.all(color: Theme.of(context).primaryColorDark)
              ),
              child: ListTile(
                title: Text("TV Connect",style: GoogleFonts.montserrat(
                  textStyle: AppStyle.fourteen(Theme.of(context).iconTheme.color),
                ),),
                trailing: IconButton(
                  onPressed: (){},
                  icon: Icon(CupertinoIcons.right_chevron,size: 14 * h,color: Theme.of(context).iconTheme.color,),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10 * w,vertical: 5 * h),
              height: 56 * h,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  border: Border.all(color: Theme.of(context).primaryColorDark)
              ),
              child: ListTile(
                title: Text("Default Quality ",style: GoogleFonts.montserrat(
                  textStyle: AppStyle.fourteen(Theme.of(context).iconTheme.color),
                ),),
                trailing: IconButton(
                  onPressed: (){},
                  icon: Icon(CupertinoIcons.right_chevron,size: 14 * h,color: Theme.of(context).iconTheme.color,),
                ),
              ),
            ),
            SizedBox(height: 15 * h,),
            Padding(
              padding: EdgeInsets.only(left: 15 * w),
              child: Text("Notification",style: GoogleFonts.montserrat(
                textStyle: AppStyle.twenty(Theme.of(context).iconTheme.color),
              ),),
            ),
            SizedBox(height: 16 * h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10 * w,vertical: 5 * h),
              height: 56 * h,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  border: Border.all(color: Theme.of(context).primaryColorDark)
              ),
              child: ListTile(
                title: Text("Allow Notification",style: GoogleFonts.montserrat(
                  textStyle: AppStyle.fourteen(Theme.of(context).iconTheme.color),
                ),),
                trailing: SwitchAdaptiveWidget(),
              ),
            ),
            Spacer(),
            ButtonWidget(ontap: (){}, text: "Log out"),
            SizedBox(height: 22 * h,)
          ],
        ),
      )
    );
  }
}
