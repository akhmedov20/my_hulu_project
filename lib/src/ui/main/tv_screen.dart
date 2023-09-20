import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/apimodels/popularTvModel/popular_tv_model.dart';
import 'package:hulu/src/bloc/popular_tv_bloc/popular_tv_bloc.dart';
import 'package:hulu/src/ui/detail/detail_screen.dart';
import 'package:hulu/src/ui/profile/profile_screen.dart';
import 'package:hulu/src/ui/search/search_screen.dart';
import 'package:hulu/src/utils/bus.dart';
import 'package:hulu/src/widgets/buttons/second_button_widget.dart';
import 'package:hulu/src/widgets/buttons/short_button_widget.dart';
import 'package:hulu/src/widgets/movieWidgets/continue_movies_widget.dart';
import 'package:hulu/src/widgets/movieWidgets/latest_movies_widget.dart';
import 'package:hulu/src/widgets/movieWidgets/movies_widget.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../provider/theme_provider.dart';
import '../../utils/utils.dart';

class TvScreen extends StatefulWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  State<TvScreen> createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  @override
  void initState() {
    _initBus();
    popularTvBloc.getTvTrending();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: StreamBuilder<PopularTvModel>(
        stream: popularTvBloc.getTvPopular,
        builder: (context,snapshot){
          if (snapshot.hasData){
            var data = snapshot.data!.results;
            return ListView(
              children: [
                SizedBox(
                  height: 500 * h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10 * w),
                            width: MediaQuery.of(context).size.width,
                            height: 550 * h,
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                  "https://image.tmdb.org/t/p/w500/${snapshot.data!.results![index].posterPath}",
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: 550 * h,
                                  errorWidget: (context, url, error) =>
                                      Image.network(
                                          "https://img.freepik.com/free-vector/thoughtful-woman-with-laptop-looking-big-question-mark_1150-39362.jpg?w=2000"),
                                ),
                                Positioned(
                                  top: 15 * h,
                                  right: 18 * w,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) {
                                                return ProfileScreen();
                                              }));
                                    },
                                    child: Container(
                                      width: 43 * w,
                                      height: 43 * h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(33),
                                          color: Color(0xff7B61FF)),
                                      child: Center(
                                        child: Image.asset(
                                            "assets/images/huluprofile.png"),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    left: 97 * w,
                                    bottom: 80 * h,
                                    child: Text("NEW .",
                                        style: GoogleFonts.montserrat(
                                          textStyle:
                                          AppStyle.fourteen(Colors.white),
                                        ))),
                                Positioned(
                                    left: 147 * w,
                                    bottom: 80 * h,
                                    child: Text("Horror .",
                                        style: GoogleFonts.montserrat(
                                          textStyle:
                                          AppStyle.fourteen(Colors.white),
                                        ))),
                                Positioned(
                                  right: 123 * w,
                                  bottom: 80 * h,
                                  child: Text(
                                      snapshot.data!.results![0].firstAirDate!
                                          .year
                                          .toString() +
                                          ' .',
                                      style: GoogleFonts.montserrat(
                                        textStyle:
                                        AppStyle.fourteen(Colors.white),
                                      )),
                                ),
                                Positioned(
                                    right: 73 * w,
                                    bottom: 80 * h,
                                    child: Text("Movie",
                                        style: GoogleFonts.montserrat(
                                          textStyle:
                                          AppStyle.fourteen(Colors.white),
                                        ))),
                                Positioned(
                                    bottom: 20 * h,
                                    left: 75 * w,
                                    child: ShortButtonWidget(
                                      icon: CupertinoIcons.plus,
                                      press: () {},
                                    )),
                                Positioned(
                                  bottom: 20 * h,
                                  left: 133 * w,
                                  child: SecondButtonWidget(
                                      press: () {},
                                      width: 111 * w,
                                      height: 41 * h,
                                      color: Colors.white,
                                      icon: Icons.play_arrow,
                                      text: 'Play',
                                      iconsize: 13,
                                      circular: 36.9),
                                ),
                                Positioned(
                                    bottom: 20 * h,
                                    right: 75 * w,
                                    child: ShortButtonWidget(
                                      icon: CupertinoIcons.info_circle,
                                      press: () {},
                                    )),
                              ],
                            ));
                      }),
                ),
                SizedBox(
                  height: 20 * h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20 * w,
                    ),
                    Text(
                      "Trending now",
                      style: GoogleFonts.montserrat(
                          textStyle:
                          AppStyle.twenty(Theme.of(context).iconTheme.color)),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.chevron_down,
                          size: 15,
                          color: Colors.white,
                        )),
                    Spacer(),
                    ShortButtonWidget(
                        icon: Icons.search,
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return SearchScreen();
                              }));
                        }),
                    SizedBox(
                      width: 10 * w,
                    ),
                    ShortButtonWidget(icon: Icons.file_download, press: () {}),
                    SizedBox(
                      width: 15 * w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16 * h,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 320 * w),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "see all",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                            textStyle:
                            AppStyle.twelve(Theme.of(context).iconTheme.color)),
                      ),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 330 * h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.results!.length,
                      itemBuilder: (context, index) {
                        return MoviesWidget(
                          Tap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return DetailScreen(
                                      id: snapshot.data!.results![index].id!,
                                      img:
                                      "https://image.tmdb.org/t/p/w500/${snapshot.data!.results![index].posterPath}");
                                }));
                          },
                          img:
                          "https://image.tmdb.org/t/p/w500/${snapshot.data!.results![index].posterPath}",
                          title: snapshot.data!.results![index].originalName!,
                          rating: snapshot.data!.results![index].voteAverage!,
                          genre: 'Action',
                          type: 'Movie',
                        );
                      }),
                ),
                SizedBox(
                  height: 25 * h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20 * w, right: 182 * w),
                  child: SecondButtonWidget(
                      press: () {},
                      width: 157 * w,
                      height: 43 * h,
                      color: Color(0xff00925D),
                      icon: CupertinoIcons.play_circle_fill,
                      text: "Continue Watching",
                      iconsize: 18 * h,
                      circular: 8),
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "see all",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                            textStyle:
                            AppStyle.twelve(Theme.of(context).iconTheme.color)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 27 * h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200 * h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return ContinueMoviesWidget(
                            press: () {},
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return DetailScreen(
                                        id: snapshot.data!.results![index].id!,
                                        img:
                                        "https://image.tmdb.org/t/p/w500/${snapshot.data!.results![index].posterPath}");
                                  }));
                            },
                            img: "https://image.tmdb.org/t/p/w500/${data[index].posterPath}");
                      }),
                ),
                SizedBox(
                  height: 28 * h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15 * w,
                    ),
                    Text(
                      "Latest Movies",
                      style: GoogleFonts.montserrat(
                          textStyle:
                          AppStyle.twenty(Theme.of(context).iconTheme.color)),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "see all",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.montserrat(
                            textStyle:
                            AppStyle.twelve(Theme.of(context).iconTheme.color)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10 * h,
                ),
                SizedBox(
                  height: 300 * h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return LatestMoviesWidget(
                          img: "https://image.tmdb.org/t/p/w500/${data[index].posterPath}",
                          title: data[index].originalName.toString(),
                          time: data[index].firstAirDate!.year,
                          bos: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return DetailScreen(
                                      id: snapshot.data!.results![index].id!,
                                      img:
                                      "https://image.tmdb.org/t/p/w500/${snapshot.data!.results![index].posterPath}");
                                }));
                          },
                        );
                      }),
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
        },
      )
    );
  }
  void _initBus(){
    RxBus.register<String>(tag: 'internet error').listen((event) {
      showDialog(context: context, builder: (BuildContext context){
        return CupertinoAlertDialog(
          content: Text("Bor internetga pul solib ke",style: TextStyle(color: Colors.white),),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Orqaga")),
            TextButton(onPressed: (){}, child: Text("Qayta yuklash")),
          ],
        );
      });
    });
  }
}
