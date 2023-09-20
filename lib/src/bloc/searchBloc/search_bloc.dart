import 'dart:convert';
import 'package:rxdart/rxdart.dart';

import '../../apimodels/searchModel/search_model.dart';
import '../../httpResult/http_result.dart';
import '../../repository/repository.dart';



class SearchBloc{
  final Repository _repository = Repository();
  final _fetchSearch = PublishSubject<SearchModel>();
  Stream<SearchModel> get getSearch => _fetchSearch.stream;

  getSearchList(String query) async{
    HttpResult response = await _repository.getSearch(query);
    if(response.isSuccess){
      var data = SearchModel.fromJson(response.result);
      _fetchSearch.sink.add(data);
    }
  }
}
final searchBloc = SearchBloc();