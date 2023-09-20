import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/apimodels/popularTvModel/popular_tv_model.dart';
import 'package:hulu/src/apimodels/tvDetail/tv_detail_model.dart';
import 'package:hulu/src/bloc/popular_tv_bloc/popular_tv_bloc.dart';
import 'package:hulu/src/bloc/tvDetail/tvDetail_bloc.dart';
import 'package:hulu/src/ui/video_player/trailer_player_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/utils.dart';
import '../../../widgets/textstyle/textstyle_widget.dart';

class TrailerScreen extends StatefulWidget {
  final String img;
  final int id;
  const TrailerScreen({Key? key, required this.id, required this.img}) : super(key: key);

  @override
  State<TrailerScreen> createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  bool isPlay = true;
  @override
  void initState() {
    tvDetailbloc.getTrending(widget.id);
    popularTvBloc.getTvTrending();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      body: StreamBuilder<TvDetailModel>(
        stream: tvDetailbloc.getTvDetail,
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (snapshot.hasData){
            return Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 25 * w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15 * h,),
                      Text(data!.name!,style: GoogleFonts.montserrat(
                          textStyle: AppStyle.thirtythree(Theme.of(context).iconTheme.color)
                      ),),
                      SizedBox(height: 25 * h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/imdb.png",height: 37 * h,fit: BoxFit.cover,),
                          SizedBox(
                            width: 15 * w,
                          ),
                          Container(
                            width: 39 * w,
                            height: 37 * h,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                              child: Text(
                                data!.voteAverage!.toStringAsPrecision(2),
                                style: GoogleFonts.montserrat(
                                    textStyle: AppStyle.ten(Colors.black)),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 20 * h,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15 * w),
                        child: Text(data!.overview!,style: GoogleFonts.montserrat(
                          textStyle: AppStyle.twelve(Theme.of(context).iconTheme.color)
                        ),),
                      ),
                      SizedBox(height: 15 * h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(data.firstAirDate!.year.toString() + " . ",style: GoogleFonts.montserrat(
                              textStyle: AppStyle.twelve(Colors.white)
                          ),),
                          Text(data.genres![0].name.toString()+"  ",style: GoogleFonts.montserrat(
                              textStyle: AppStyle.twelve(Colors.white)
                          ),),
                          Text(data.type.toString(),style: GoogleFonts.montserrat(
                              textStyle: AppStyle.twelve(Colors.white)
                          ),),
                        ],
                      ),
                      SizedBox(height: 15 * h,),
                      SizedBox(
                        height: 250 * h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15 * w),
                              width: MediaQuery.of(context).size.width,
                              height: 375 * h,
                              child: isPlay? Stack(
                                children: [
                                  ClipRRect(
                                    child: Image.network(
                                      widget.img,
                                      fit: BoxFit.cover,
                                      height: 375 * h,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                  Center(
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isPlay = false;
                                          });
                                        },
                                        icon: Icon(Icons.play_arrow_rounded),
                                        iconSize: 50,
                                        color: Colors.deepOrange,
                                      )),
                                ],
                              ):TrailerPlayerScreen(id: widget.id),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15 * w),
                              width: MediaQuery.of(context).size.width,
                              height: 375 * h,
                              child: isPlay? Stack(
                                children: [
                                  ClipRRect(
                                    child: Image.network(
                                      widget.img,
                                      fit: BoxFit.cover,
                                      height: 375 * h,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                  Center(
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isPlay = false;
                                          });
                                        },
                                        icon: Icon(Icons.play_arrow_rounded),
                                        iconSize: 50,
                                        color: Colors.deepOrange,
                                      )),
                                ],
                              ):TrailerPlayerScreen(id: widget.id),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 42 * h,),
                      Row(
                        children: [
                          Text("Director",style: GoogleFonts.montserrat(
                              textStyle: AppStyle.fourteen(Colors.grey)
                          ),),
                          Spacer(),
                          Text("Production Company",style: GoogleFonts.montserrat(
                              textStyle: AppStyle.fourteen(Colors.grey)
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          Text(data.createdBy![0].name.toString(),style: GoogleFonts.montserrat(
                              textStyle: AppStyle.fourteen(Colors.white)
                          ),),
                          Spacer(),
                          Text(data.productionCompanies![0].name.toString(),style: GoogleFonts.montserrat(
                              textStyle: AppStyle.fourteen(Colors.white)
                          ),),
                        ],
                      ),
                      SizedBox(height: 8 * h,),
                      Text("Release Date  ",style: GoogleFonts.montserrat(
                          textStyle: AppStyle.fourteen(Colors.grey)
                      ),),
                      Row(
                        children: [
                          Text(data.firstAirDate!.month.toString() + '. ',style: GoogleFonts.montserrat(
                              textStyle: AppStyle.fourteen(Colors.white)
                          ),),
                          Text(data.firstAirDate!.day.toString()+ '. ',style: GoogleFonts.montserrat(
                              textStyle: AppStyle.fourteen(Colors.white)
                          ),),
                          Text(data.firstAirDate!.year.toString(),style: GoogleFonts.montserrat(
                              textStyle: AppStyle.fourteen(Colors.white)
                          ),),
                        ],
                      ),
                      Text("Stars",style: GoogleFonts.montserrat(
                          textStyle: AppStyle.fourteen(Colors.grey)
                      ),),
                      Text(data.createdBy![0].name.toString(),style: GoogleFonts.montserrat(
                          textStyle: AppStyle.fourteen(Colors.white)
                      ),),
                      Text(data.createdBy![0].name.toString(),style: GoogleFonts.montserrat(
                          textStyle: AppStyle.fourteen(Colors.white)
                      ),),
                      SizedBox(height: 50 * h,),
                      Center(child: Text("More Like This ",style: GoogleFonts.montserrat(
                          textStyle: AppStyle.twenty(Theme.of(context).iconTheme.color)
                      ),),),
                      SizedBox(height: 40 * h,),
                      StreamBuilder<PopularTvModel>(
                        stream: popularTvBloc.getTvPopular,
                        builder: (context, snapshot) {
                          if(snapshot.hasData){
                            var data = snapshot.data!.results;
                            return Container(
                              height: 300 * h,
                              child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 2.4 / 3,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                                  itemCount: data!.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return CachedNetworkImage(
                                      imageUrl:"https://image.tmdb.org/t/p/w500/${snapshot.data!.results![index].backdropPath}",
                                      fit: BoxFit.cover,
                                      width: 133 * w,
                                      height: 190 * h,
                                      errorWidget: (context,url,error) =>
                                        Image.network(
                                            "https://img.freepik.com/free-vector/thoughtful-woman-with-laptop-looking-big-question-mark_1150-39362.jpg?w=2000"
                                        ),
                                    );
                                  }),
                            );
                          }
                          else{
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
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          else{
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
      ),
    );
  }
}
