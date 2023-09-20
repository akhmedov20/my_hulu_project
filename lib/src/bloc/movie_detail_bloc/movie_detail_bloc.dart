import 'dart:convert';
import 'package:hulu/src/apimodels/movieDetail/movie_detail_model.dart';
import 'package:hulu/src/apimodels/tvDetail/tv_detail_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../httpResult/http_result.dart';
import '../../repository/repository.dart';



class MovieDetailBloc{
  final Repository _repository = Repository();
  final _fetchMovieDetail = PublishSubject<MovieDetailModel>();
  Stream<MovieDetailModel> get getMovieDetail => _fetchMovieDetail.stream;

  getDetailMovies(int id) async{
    HttpResult response = await _repository.getMovieDetailList(id);
    if(response.isSuccess){
      var data = MovieDetailModel.fromJson(response.result);
      _fetchMovieDetail.sink.add(data);
    }
  }
}
final movieDetailbloc = MovieDetailBloc();