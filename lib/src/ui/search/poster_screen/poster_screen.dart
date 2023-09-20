import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu/src/apimodels/trendingModels/trending_model.dart';
import 'package:hulu/src/bloc/trendingBloc/trending_bloc.dart';
import 'package:hulu/src/ui/search/search_screen.dart';
import 'package:hulu/src/utils/utils.dart';
import 'package:hulu/src/widgets/buttons/third_button_widget.dart';
import 'package:hulu/src/widgets/poster_widget/poster_widget.dart';
import 'package:hulu/src/widgets/textstyle/textstyle_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PosterScreen extends StatefulWidget {
  const PosterScreen({Key? key}) : super(key: key);

  @override
  State<PosterScreen> createState() => _PosterScreenState();
}

class _PosterScreenState extends State<PosterScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _nextPage;
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    trendingBloc.getTrending();
    super.initState();
    _animationController =
    new AnimationController(vsync: this, duration: Duration(seconds: 10));
    _nextPage = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    //Add listener to AnimationController for know when end the count and change to the next page
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reset(); //Reset the controller
        final int page = 4; //Number of pages in your PageView
        if (_currentPage < page) {
          _currentPage++;
          _pageController.animateToPage(_currentPage,
              duration: Duration(milliseconds: 300), curve: Curves.easeInSine);
        } else {
          _currentPage = 0;
        }
      }
    });
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _animationController.forward(); //Start controller with widget
    print(_nextPage.value);
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Hulu",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
                fontSize: 30 * h,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        leading: SvgPicture.asset(
          "assets/icons/hulumenu.svg",
          width: 21 * h,
          height: 21 * h,
        ),
        actions: [
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SearchScreen();
                }));
              },
              child: SvgPicture.asset("assets/icons/hulusearch.svg")),
          SizedBox(width: 25 * w,)
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<TrendingModel>(
          stream: trendingBloc.getTrendingMovies,
          builder: (context, snapshot) {
            if (snapshot.hasData){
              return PageView.builder(
                itemCount: snapshot.data!.results.length,
                controller: _pageController,
                onPageChanged: (value){
                  _animationController.forward();
                },
                physics: ScrollPhysics(),
                  itemBuilder: (context,index){
                return PosterWidget(img: "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[index].backdropPath}",
                    title: snapshot.data!.results[index].title,
                    about: snapshot.data!.results[index].overview,
                    date: snapshot.data!.results[index].releaseDate.year);
              });
            }
            else {
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
      ),
    );
  }
}
