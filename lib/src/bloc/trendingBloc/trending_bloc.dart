import 'package:hulu/src/apimodels/trendingModels/trending_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../httpResult/http_result.dart';
import '../../repository/repository.dart';



class TrendingBloc{
  final Repository _repository = Repository();
  final _fetchTrending = PublishSubject<TrendingModel>();
  Stream<TrendingModel> get getTrendingMovies => _fetchTrending.stream;

  getTrending() async{
    HttpResult response = await _repository.getTrendingList();
    if(response.isSuccess){
      var data = TrendingModel.fromJson(response.result);
      _fetchTrending.sink.add(data);
    }
  }
}
final trendingBloc = TrendingBloc();