import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hulu/src/apimodels/trendingModels/trending_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/trendingBloc/trending_bloc.dart';
import '../../utils/utils.dart';

class FirstOnBoardWidget extends StatefulWidget {
  const FirstOnBoardWidget({Key? key}) : super(key: key);

  @override
  State<FirstOnBoardWidget> createState() => _FirstOnBoardWidgetState();
}

class _FirstOnBoardWidgetState extends State<FirstOnBoardWidget> {
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
            child: Column(
              children: [
                SizedBox(height: 24 * h),
                Image.asset("assets/images/logohulu.png",fit: BoxFit.cover,width: 81 * w,height: 54 * h,),
                SizedBox(height: 24 * h),
                SizedBox(
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                        height: 400 * h,
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        enlargeCenterPage: true,
                    ),
                    itemCount: snapshot.data!.results.length,
                    itemBuilder: (context,index,realIndex){
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Image.network("https://image.tmdb.org/t/p/w500/${snapshot.data!.results[index].posterPath}",fit: BoxFit.fill,),
                      );
                    },
                  ),
                ),
                SizedBox(height: 50 * h,),
                Text(
                  'Unlimited ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1CE783),
                    fontSize: 33.01,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.57,
                  ),
                ),
                SizedBox(
                  width: 276,
                  height: 41,
                  child: Opacity(
                    opacity: 0.95,
                    child: Text(
                      '\nmovies ,TV shows & More...\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontSize: 18.29,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.31,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15 * h,),
                Opacity(
                  opacity: 0.80,
                  child: Text(
                    'Watch anywhere , cancel \nanytime.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: 13.30,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.23,
                    ),
                  ),
                ),
              ],
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
    );
  }
}

