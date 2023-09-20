import 'package:flutter/material.dart';
import 'package:hulu/src/bloc/movies_video_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../apimodels/movies_video_model/movies_video_model.dart';

class PlayerScreen extends StatefulWidget {
  final int id;
  const PlayerScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {

  @override
  void initState() {
    movieVideoBloc.getTrailerList(widget.id);
    print(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<VideoModel>(
        stream: movieVideoBloc.getTrailer,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var data = snapshot.data!.results;
            return YoutubePlayer (
              controller:  YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(data[0].key)!,
                  flags: YoutubePlayerFlags(
                      autoPlay: true
                  )
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        }
    );
  }
}
