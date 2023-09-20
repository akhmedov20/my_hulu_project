import 'package:flutter/material.dart';
import 'package:hulu/src/apimodels/trendingModels/trending_model.dart';
import 'package:hulu/src/ui/bottom_navigator_screen/bottom_navigator_screen.dart';
import 'package:hulu/src/ui/login/login_screen.dart';
import 'package:hulu/src/ui/main/tv_screen.dart';
import 'package:hulu/src/widgets/buttons/button_widget.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/trendingBloc/trending_bloc.dart';
import '../../utils/utils.dart';

class LastPage extends StatefulWidget {
  final Color color;
  const LastPage({Key? key, required this.color}) : super(key: key);

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  @override
  void initState() {
    trendingBloc.getTrending();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return StreamBuilder<TrendingModel>(
      stream: trendingBloc.getTrendingMovies,
      builder: (context, snapshot) {
       if (snapshot.hasData){
         return Container(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           color: widget.color,
           child: Stack(
             children: [
               Positioned(
                 right: 368.39 * w,
                 top: 165 * h,
                 child: Transform(
                   transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(5.93),
                   child: Container(
                     width: 171 * w,
                     height: 284 * h,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.network(
                         "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[0].posterPath}",
                         fit: BoxFit.fill,
                       ),
                     ),
                   ),
                 ),
               ),
               Positioned(
                 right: 198.39 * w,
                 top: 85 * h,
                 child: Transform(
                   transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(5.93),
                   child: Container(
                     width: 171 * w,
                     height: 284 * h,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.network(
                         "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[1].posterPath}",
                         fit: BoxFit.fill,
                       ),
                     ),
                   ),
                 ),
               ),
               Positioned(
                 left: 120.39 * w,
                 top: 365 * h,
                 child: Transform(
                   transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(5.93),
                   child: Container(
                     width: 171 * w,
                     height: 127 * h,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.network(
                         "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[2].posterPath}",
                         fit: BoxFit.fill,
                       ),
                     ),
                   ),
                 ),
               ),
               Positioned(
                 right: 270 * w,
                 bottom: 255 * h,
                 child: Transform(
                   transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(5.93),
                   child: Container(
                     width: 171 * w,
                     height: 127 * h,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.network(
                         "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[3].posterPath}",
                         fit: BoxFit.fill,
                       ),
                     ),
                   ),
                 ),
               ),
               Positioned(
                 left: 188.39 * w,
                 child: Transform(
                   transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(5.93),
                   child: Container(
                     width: 171 * w,
                     height: 127 * h,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.network(
                         "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[4].posterPath}",
                         fit: BoxFit.fill,
                       ),
                     ),
                   ),
                 ),
               ),
               Positioned(
                 top: 130 * h,
                 left: 235.39 * w,
                 child: Transform(
                   transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(5.93),
                   child: Container(
                     width: 171 * w,
                     height: 127 * h,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.network(
                         "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[5].posterPath}",
                         fit: BoxFit.fill,
                       ),
                     ),
                   ),
                 ),
               ),
               Positioned(
                 top: 260 * h,
                 left: 280.39 * w,
                 child: Transform(
                   transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(5.93),
                   child: Container(
                     width: 171 * w,
                     height: 284 * h,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.network(
                         "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[6].posterPath}",
                         fit: BoxFit.fill,
                       ),
                     ),
                   ),
                 ),
               ),
               Positioned(
                 bottom: 5,
                 child: Opacity(
                   opacity: 0.97,
                   child: Container(
                     width: MediaQuery.of(context).size.width,
                     height: 350 * h,
                     decoration: BoxDecoration(
                       color: Colors.transparent,
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Image.asset("assets/images/logohulu.png",fit: BoxFit.cover,),
                         Text.rich(
                           TextSpan(
                             children: [
                               TextSpan(
                                 text: 'Enjoy The ',
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 14.40 * h,
                                   fontFamily: 'Montserrat',
                                   fontWeight: FontWeight.w600,
                                 ),
                               ),
                               TextSpan(
                                 text: 'Best ',
                                 style: TextStyle(
                                   color: Color(0xFF00CF71),
                                   fontSize: 14.40 * h,
                                   fontFamily: 'Montserrat',
                                   fontWeight: FontWeight.w600,
                                 ),
                               ),
                               TextSpan(
                                 text: 'Movies and TV shows ',
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 14.40 * h,
                                   fontFamily: 'Montserrat',
                                   fontWeight: FontWeight.w600,
                                 ),
                               ),
                             ],
                           ),
                         ),
                         SizedBox(height: 8 * h,),
                         Text("Out there.",style: TextStyle(
                           color: Colors.white,
                           fontSize: 14.40 * h,
                           fontFamily: 'Montserrat',
                           fontWeight: FontWeight.w600,
                         ),),
                         SizedBox(height: 20 * h,),
                         SizedBox(
                           width: 267 * w,
                           height: 28 * h,
                           child: Text("Watch full seasons of exclusive streaming series,episodes,hitmovies, Hulu Originals, kids shows, and more...",textAlign: TextAlign.center,style: TextStyle(
                             color: Colors.grey,
                             fontSize: 9 * h,
                             fontFamily: 'Montserrat',
                             fontWeight: FontWeight.w600,
                           ),),
                         ),
                         SizedBox(height: 20 * h,),
                         ButtonWidget(ontap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return MainScreen();
                           }));
                         }, text: "Get started "),
                         SizedBox(height: 5 * h,),
                         TextButton(onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return LoginScreen();
                           }));
                         }, child: Text("Login",style: AppStyle.fifteen(Theme.of(context).iconTheme.color),))
                       ],
                     ),
                   ),
                 ),
               )
             ],
           ),
         );
       } else{
         return Shimmer.fromColors(
             child: Container(
               color: Colors.grey,
               height: MediaQuery.of(context).size.height,
               width: MediaQuery.of(context).size.width,
             ),
             baseColor: Colors.grey,
             highlightColor: Colors.white10);
       }
      }
    );
  }
}
