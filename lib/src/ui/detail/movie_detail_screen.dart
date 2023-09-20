import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/apimodels/trendingModels/trending_model.dart';
import 'package:hulu/src/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:hulu/src/bloc/trendingBloc/trending_bloc.dart';
import 'package:hulu/src/ui/video_player/trailer_player_screen.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/utils.dart';
import '../../widgets/movie_detail_widget/movie_detail_widget.dart';



class MovieDetailScreen extends StatefulWidget {
  final String img;
  final int id;
  final String name;
  final String aboutMovie;
  final double rating;
  final dynamic data;
  final dynamic minute;
  const MovieDetailScreen({super.key, required this.img, required this.name, required this.aboutMovie, required this.rating, required this.id, required this.data, this.minute});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  bool isPlay = true;
  @override
  void initState() {
    trendingBloc.getTrending();
    movieDetailbloc.getDetailMovies(widget.id);
    print('object');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: ListView(
          children: [
            Container(
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
                  Positioned(
                      top: 48 * h,
                      left: 28 * w,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back),color: Colors.white,)),
                  Center(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isPlay = false;
                          });
                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return PlayerScreen(id: widget.id);
                          // }));
                        },
                        icon: Icon(Icons.play_arrow_rounded),
                        iconSize: 50,
                        color: Colors.deepOrange,
                      )),
                ],
              ):TrailerPlayerScreen(id: widget.id),
            ),
                SizedBox(height: 24,),
                Text(widget.name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    )),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(CupertinoIcons.clock,color: Colors.white,size: 20,),
                SizedBox(width: 5,),
                Text(widget.minute.toString(),style: GoogleFonts.montserrat(
                  textStyle: AppStyle.eleven(Colors.white)
                )),
                SizedBox(width: 20,),
                Icon(CupertinoIcons.star_fill,color: Color(0xffBBBBBB),size: 20,),
                SizedBox(width: 5,),
                Text(widget.rating.toStringAsPrecision(2),style: GoogleFonts.montserrat(
                    textStyle: AppStyle.eleven(Colors.white)
                )),
                Spacer(),
                Container(
                    width: 29 * w,
                    height: 22 * h,
                    child: Center(
                      child: Text("4K",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          )),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0x0cffffff))),
                SizedBox(width: 20 * w,),
              ],
            ),
            SizedBox(
              height: 20 * h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 0.5 * h,
              color: Colors.grey,
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Text("Release date",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    )),
                SizedBox(
                  width: 56,
                ),
                Text("Genre",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    )),
              ],
            ),
            SizedBox(height: 15,),
            Text(widget.data.toString(),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                )),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 0.5 * h,
              color: Colors.grey,
            ),
            SizedBox(height: 16,),
            Text("Synopsis",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                )),
            SizedBox(height: 12,),
            Text(
                widget.aboutMovie,
                style: TextStyle(
                    fontSize: 12 * h,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                )),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16 * w, top: 10 * h),
                  child: Text("Read more..",
                      style: TextStyle(
                          fontSize: 13 * h,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      )),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16 * w, top: 10 * h),
                  child: Text("Related Movies",
                      style: TextStyle(
                          fontSize: 16 * h,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      )),
                ),
              ],
            ),
            SizedBox(height: 16,),
            SizedBox(
              height: 150,
              child: StreamBuilder<TrendingModel>(
                  stream: trendingBloc.getTrendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData){
                      var data = snapshot.data!.results;
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.results.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return MovieDetailWidget(img: "https://image.tmdb.org/t/p/w500/${data[index].backdropPath}", name: data[index].title.toString(),);
                          });
                    }return Shimmer.fromColors(
                        child: Container(
                          color: Colors.grey,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                        ),
                        baseColor: Colors.grey,
                        highlightColor: Colors.white10);
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
