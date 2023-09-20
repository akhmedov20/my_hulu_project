import 'dart:convert';
import 'package:hulu/src/apimodels/actors_model/actors_model.dart';
import 'package:hulu/src/apimodels/trendingModels/trending_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../httpResult/http_result.dart';
import '../../repository/repository.dart';



class TvActorsBloc{
  final Repository _repository = Repository();
  final _fetchTvActors = PublishSubject<TvActorsModel>();
  Stream<TvActorsModel> get getTvActors => _fetchTvActors.stream;

  getTrending(int id) async{
    HttpResult response = await _repository.getTvActorsList(id);
    if(response.isSuccess){
      var data = TvActorsModel.fromJson(response.result);
      _fetchTvActors.sink.add(data);
    }
  }
}
final tvActorsBloc = TvActorsBloc();