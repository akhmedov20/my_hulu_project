import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';

import '../../utils/utils.dart';

class EpisodeWidget extends StatelessWidget {
  final String img;
  final Function() presTap;
  final Function() downloadTap;
  final int S;
  final int E1;
  final String episodeName;
  final String overview;
  final double rating;
  const EpisodeWidget({Key? key, required this.img, required this.presTap, required this.downloadTap, required this.S, required this.E1, required this.episodeName, required this.overview, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Container(
      width: 375 * w,
      height: 110 * h,
      child: Row(
        children: [
          Container(
            width: 134 * w,
            height: 90 * h,
            child: Stack(
              children: [
                CachedNetworkImage(imageUrl: img,width: 134 * w,height: 114 * h,fit: BoxFit.cover,
                  errorWidget: (context,url,error) => Image.network(
                      "https://media.istockphoto.com/id/1011988208/vector/404-error-like-laptop-with-dead-emoji-cartoon-flat-minimal-trend-modern-simple-logo-graphic.jpg?s=612x612&w=0&k=20&c=u_DL0ZH5LkX57_25Qa8hQVIl41F9D0zXlTgkWNnHRkQ="
                  ),),
                Center(child: IconButton(
                  onPressed: presTap,
                  icon: Icon(Icons.play_circle,size: 23,color: Colors.red),
                ),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15 * w),
            width: 200 * w,
              height: 100 * h,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("S " + S.toString(),style: GoogleFonts.montserrat(
                    textStyle: AppStyle.twelvebold(Theme.of(context).iconTheme.color),
                  ),),
                  SizedBox(width: 8 * w,),
                  Text("E "+ E1.toString()+ " .",style: GoogleFonts.montserrat(
                    textStyle: AppStyle.twelvebold(Theme.of(context).iconTheme.color),
                  ),),
                  Text(episodeName,style: GoogleFonts.montserrat(
                    textStyle: AppStyle.twelvebold(Theme.of(context).iconTheme.color),
                  ),),
                ],
              ),
              SizedBox(height: 8 * h,),
              Text(overview,style: GoogleFonts.montserrat(
                textStyle: AppStyle.eight(Theme.of(context).iconTheme.color)
              ),),
              SizedBox(height: 8 * w,),
              Row(
                children: [
                  Icon(Icons.star,size: 13 * h,color: Colors.amber,),
                  SizedBox(width: 5 * w,),
                  Text(rating.toString(),style: GoogleFonts.montserrat(
                      textStyle: AppStyle.ten(Theme.of(context).iconTheme.color)
                  ),),
                  SizedBox(width: 5 * w,),
                  Text("Rate",style: GoogleFonts.montserrat(
                      textStyle: AppStyle.ten(Color(0xff00CF71))
                  ),),
                  Spacer(),
                  GestureDetector(
                    onTap: downloadTap,
                    child: Container(
                      width: 89 * w,
                      height: 25 * h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).iconTheme.color,
                        border: Border.all(color: Theme.of(context).primaryColor,),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.download,size: 12 * h,color: Theme.of(context).primaryColor),
                          SizedBox(width: 8 * w,),
                          Text("Download",style: GoogleFonts.montserrat(
                              textStyle: AppStyle.ten(Theme.of(context).primaryColor)
                          ),)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
