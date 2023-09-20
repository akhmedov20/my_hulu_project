import 'dart:convert';

import 'package:rxdart/rxdart.dart';

import '../apimodels/movies_video_model/movies_video_model.dart';
import '../httpResult/http_result.dart';
import '../repository/repository.dart';




class MovieTrailerBloc{
  final Repository _repository = Repository();
  final _fetchTrailer = PublishSubject<VideoModel>();
  Stream<VideoModel> get getTrailer => _fetchTrailer.stream;

  getTrailerList(int id) async{
    HttpResult response = await _repository.getMovieVideo(id);
    if(response.isSuccess){
      var data = VideoModel.fromJson(response.result);
      _fetchTrailer.sink.add(data);
    }
  }
}
final movieVideoBloc = MovieTrailerBloc();