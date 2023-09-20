import 'package:flutter/material.dart';
import 'package:hulu/src/apimodels/popularTvModel/popular_tv_model.dart';
import 'package:hulu/src/apimodels/tv_video_model/tv_video_model.dart';
import 'package:hulu/src/bloc/tv_video_bloc/tv_video_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPlayerScreen extends StatefulWidget {
  final int id;
  const TrailerPlayerScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<TrailerPlayerScreen> createState() => _TrailerPlayerScreenState();
}

class _TrailerPlayerScreenState extends State<TrailerPlayerScreen> {
  @override
  void initState() {
    popularTvVideoBloc.getMovieVideoList(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PopularTvVideoModel>(
      stream: popularTvVideoBloc.getMovieVideo,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          var data = snapshot.data!.results;
          return YoutubePlayer(
            controller:  YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(data![2].key!)!,
                flags: YoutubePlayerFlags(
                    autoPlay: true
                )
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
