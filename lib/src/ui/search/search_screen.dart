import 'package:flutter/material.dart';
import 'package:hulu/src/apimodels/trendingModels/trending_model.dart';
import 'package:hulu/src/bloc/searchBloc/search_bloc.dart';
import 'package:hulu/src/bloc/trendingBloc/trending_bloc.dart';
import 'package:hulu/src/ui/detail/movie_detail_screen.dart';
import 'package:hulu/src/widgets/movieWidgets/fifth_movies_widget.dart';
import 'package:hulu/src/widgets/movieWidgets/movies_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../apimodels/searchModel/search_model.dart';
import '../../utils/utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    trendingBloc.getTrending();
    _controller.addListener(() {
      searchBloc.getSearchList(_controller.text);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      backgroundColor: Theme.of(context).iconTheme.color,
      appBar: AppBar(
        backgroundColor: Color(0xff424242),
        title: Row(
          children: [
            Icon(Icons.search,size: 25 * h,color: Colors.white,),
            SizedBox(width: 10 * w,),
            Expanded(
              child: TextFormField(
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
                controller: _controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search for a show, movie, genre, e.t.c.",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xffBBBBBB)
                    )
                ),
              ),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_voice,size: 25 * h,color: Colors.white,))
          ],
        )
      ),
      body: StreamBuilder<SearchModel>(
          stream: searchBloc.getSearch,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              var data = snapshot.data!.results;
              return Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2.4 / 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: data.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return FifthMoviesWidget(img: "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[index].backdropPath}",
                        title: snapshot.data!.results[index].title, Tap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return MovieDetailScreen(img: "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[index].backdropPath}",
                              name: snapshot.data!.results[index].originalTitle,
                              aboutMovie: snapshot.data!.results[index].overview,
                              rating: snapshot.data!.results[index].voteAverage,
                              id: snapshot.data!.results[index].id,
                              data: snapshot.data!.results[index].voteAverage);
                        }));
                          },
                        rating: snapshot.data!.results[index].voteAverage,
                        genre: "Drama",
                        type: "Movie");
                    }),
              );
            }else{
              return Container(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder<TrendingModel>(
                  stream: trendingBloc.getTrendingMovies,
                  builder: (context, snapshot) {
                    var data = snapshot.data!.results;
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2.4 / 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: data.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return FifthMoviesWidget(img: "https://image.tmdb.org/t/p/w500/${data[index].backdropPath}",
                              title: data[index].title, Tap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return MovieDetailScreen(img: "https://image.tmdb.org/t/p/w500/${data[index].posterPath}",
                                      name: data[index].title, aboutMovie: data[index].overview,
                                      minute: data[index].releaseDate.minute.toString(),
                                      rating: data[index].voteAverage, id: data[index].id, data: data[index].releaseDate.year.toString());
                                }));
                              },
                              rating: data[index].voteAverage,
                              genre: "Drama",
                              type: "Movie");
                        });
                  }
                ),
              );
            }
          }
      ),
    );
  }
}
