import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/widgets/party/party_widget.dart';

import '../../utils/utils.dart';
import '../textstyle/textstyle_widget.dart';

class FourthOnBoardWidget extends StatefulWidget {
  const FourthOnBoardWidget({Key? key}) : super(key: key);

  @override
  State<FourthOnBoardWidget> createState() => _FourthOnBoardWidgetState();
}

class _FourthOnBoardWidgetState extends State<FourthOnBoardWidget> {
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Container(
      padding: EdgeInsets.only(left: 25 * w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40 * h,),
          Text("PARTY MODE",style: GoogleFonts.montserrat(
              textStyle: AppStyle.thirtythree(Color(0xff1CE783),)
          ),),
          Text("is now LIVE",style: GoogleFonts.montserrat(
              textStyle: AppStyle.thirtythree(Colors.white)
          ),),
          SizedBox(height: 11 * h,),
          PartyWidget(party: "YOUR", profile: "", profile2: "https://egoamo.co.za/cdn/shop/products/Avengers_-_End_Game_800x.jpg?v=1558989681", profile3: "https://egoamo.co.za/cdn/shop/products/Avengers_-_End_Game_800x.jpg?v=1558989681",
              part2: "YOUR", part3: "Still Requesting", buttonColor: Colors.white,
              pressProfile: (){}, pressProfile2: (){}, pressProfile3: (){},
              part4: "None", buttonText: "Request", buttonpress: (){}),
          SizedBox(height: 32 * h,),
          Padding(
            padding: EdgeInsets.only(left: 70),
            child: PartyWidget(party: "YOUR", profile: "https://egoamo.co.za/cdn/shop/products/Avengers_-_End_Game_800x.jpg?v=1558989681",
                profile2: "https://egoamo.co.za/cdn/shop/products/Avengers_-_End_Game_800x.jpg?v=1558989681", profile3: "https://egoamo.co.za/cdn/shop/products/Avengers_-_End_Game_800x.jpg?v=1558989681",
                part2: "YOUR", part3: "Still Requesting", buttonColor: Colors.lightGreen, pressProfile: (){}, pressProfile2: (){}, pressProfile3: (){}, part4: "None", buttonText: "Join", buttonpress: (){}),
          ),
          SizedBox(height: 37 * h,),
          Text("Enjoy watching your Favorite movies & shows \nwith your friends using Party Mode \nparty holds up to 20 ",
          style: GoogleFonts.montserrat(
            textStyle: AppStyle.twelvebold(Colors.white)
          ),)
        ],
      ),
    );
  }
}
