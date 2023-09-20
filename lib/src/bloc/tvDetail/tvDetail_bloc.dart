import 'dart:convert';
import 'package:hulu/src/apimodels/tvDetail/tv_detail_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../httpResult/http_result.dart';
import '../../repository/repository.dart';



class TvDetailBloc{
  final Repository _repository = Repository();
  final _fetchTvDetail = PublishSubject<TvDetailModel>();
  Stream<TvDetailModel> get getTvDetail => _fetchTvDetail.stream;

  getTrending(int id) async{
    HttpResult response = await _repository.getTvDetailList(id);
    if(response.isSuccess){
      var data = TvDetailModel.fromJson(response.result);
      _fetchTvDetail.sink.add(data);
    }
  }
}
final tvDetailbloc = TvDetailBloc();