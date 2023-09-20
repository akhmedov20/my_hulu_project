import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/apimodels/tvDetail/tv_detail_model.dart';
import 'package:hulu/src/bloc/tvDetail/tvDetail_bloc.dart';
import 'package:hulu/src/ui/detail/actors_list/actors_list.dart';
import 'package:hulu/src/ui/detail/episodes_screen/episodes_screen.dart';
import 'package:hulu/src/ui/detail/trailer_screen/trailer_screen.dart';
import 'package:hulu/src/widgets/buttons/second_button_widget.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/utils.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String img;
  const DetailScreen({Key? key, required this.id, required this.img}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin{
  @override
  void initState() {
    tvDetailbloc.getTrending(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3,vsync: this);
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      body: StreamBuilder<TvDetailModel>(
        stream: tvDetailbloc.getTvDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            var data = snapshot.data;
            return ListView(
              children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 490 * h,
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 0.75,
                            child: Image.network("https://image.tmdb.org/t/p/w500/${data!.backdropPath}",
                              height: 450 * h,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Positioned(
                            top: 30 * h,
                            left:14 * w,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 53 * w,
                                height: 48 * h,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Icon(CupertinoIcons.left_chevron,size: 22 * h,color: Colors.green[700]),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 250 * w,
                              height: 260 * h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(data!.type.toString() + ' .',style: GoogleFonts.montserrat(
                                          textStyle: AppStyle.fourteen(Colors.white)
                                      ),),
                                      Text("SEASON "+ data.numberOfSeasons.toString(),style: GoogleFonts.montserrat(
                                          textStyle: AppStyle.fourteen(Colors.white)
                                      ),),
                                    ],
                                  ),
                                  SizedBox(height: 8 * h,),
                                  Text(data.name.toString(),style: GoogleFonts.montserrat(
                                      textStyle: AppStyle.thirty(Colors.white)
                                  ),),
                                  SizedBox(height: 8 * h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 120 * w,
                                        height: 25 * h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(3),
                                            color: Colors.white,
                                            border: Border.all(color: Colors.grey)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("POPULAR NOW  🔥",style: GoogleFonts.montserrat(
                                                textStyle: AppStyle.ten(Colors.black)
                                            ),),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 5 * w,),
                                      Container(
                                        width: 29 * w,
                                        height: 25 * h,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(3),
                                            border: Border.all(color: Colors.grey)
                                        ),
                                        child: Center(
                                          child: Text(data.numberOfSeasons.toString()+ "+",style: GoogleFonts.montserrat(
                                              textStyle: AppStyle.ten(Colors.black)
                                          ),),
                                        ),
                                      ),
                                      SizedBox(width: 7 * w,),
                                      Image.asset("assets/images/imdb.png"),
                                      SizedBox(width: 5 * w,),
                                      Container(
                                        width: 29 * w,
                                        height: 27 * h,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.circular(3),
                                            border: Border.all(color: Colors.grey)
                                        ),
                                        child: Center(
                                          child: Text(data.voteAverage!.toStringAsPrecision(2),style: GoogleFonts.montserrat(
                                              textStyle: AppStyle.ten(Colors.black)
                                          ),),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15 * h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(data.firstAirDate!.year.toString() + " . ",style: GoogleFonts.montserrat(
                                          textStyle: AppStyle.ten(Colors.white)
                                      ),),
                                      Text(data.genres![0].name.toString()+"  ",style: GoogleFonts.montserrat(
                                          textStyle: AppStyle.ten(Colors.white)
                                      ),),
                                      Text(data.type.toString(),style: GoogleFonts.montserrat(
                                          textStyle: AppStyle.ten(Colors.white)
                                      ),),
                                    ],
                                  ),
                                  SizedBox(height: 18 * h,),
                                  SecondButtonWidget(press: (){}, width: 122 * w, height: 30 * h, color: Color(0xff00CF71),
                                      icon: Icons.play_arrow, text: "Watch Now", iconsize: 12, circular: 1)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25 * w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15 * h,),
                          Row(
                            children: [
                              Text("Season " + data.seasons![0].seasonNumber.toString(),style: GoogleFonts.montserrat(
                                  textStyle: AppStyle.twenty(Colors.white)
                              ),),
                              IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.chevron_down,size: 15 * h,))
                            ],
                          ),
                          SizedBox(height: 9 * h,),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: TabBar(
                                onTap: (i){
                                  switch(i){
                                    case 1:
                                      tvDetailbloc.getTrending(widget.id);
                                  }
                                },
                                indicatorColor: Color(0xff00CF71),
                                indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(width: 3.0 * w,color: Color(0xff00CF71))
                                ),
                                indicatorSize: TabBarIndicatorSize.label,
                                isScrollable: true,
                                unselectedLabelColor: Colors.grey,
                                labelColor: Colors.white,
                                controller: _tabController,
                                tabs: [
                                  Tab(
                                    child: Text("EPISODES",style: TextStyle(
                                      fontSize: 16 * h,
                                    ),),
                                  ),
                                  Tab(
                                    child: Text("TRAILERS",style: TextStyle(
                                      fontSize: 16 * h,
                                    ),),
                                  ),
                                  Tab(
                                    child: Text("CASTS",style: TextStyle(
                                      fontSize: 16 * h,
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 400 * h,
                            child: TabBarView(
                                controller: _tabController,
                                children: [
                                  EpisodesScreen(id: widget.id,),
                                  TrailerScreen(id: widget.id, img: widget.img,),
                                  ActorsList(id: widget.id)
                                ]),
                          ),

                        ],
                      ),
                    )
              ],
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
