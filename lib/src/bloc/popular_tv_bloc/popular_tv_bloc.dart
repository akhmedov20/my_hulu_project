import 'package:hulu/src/apimodels/popularTvModel/popular_tv_model.dart';
import 'package:hulu/src/utils/bus.dart';
import 'package:rxdart/rxdart.dart';
import '../../httpResult/http_result.dart';
import '../../repository/repository.dart';



class TrendingTvBloc{
  final Repository _repository = Repository();
  final _fetchTvTrending = PublishSubject<PopularTvModel>();
  Stream<PopularTvModel> get getTvPopular => _fetchTvTrending.stream;

  getTvTrending() async{
    HttpResult response = await _repository.getTrendingTvList();
    if(response.isSuccess){
      var data = PopularTvModel.fromJson(response.result);
      _fetchTvTrending.sink.add(data);
    }
    else {
      RxBus.post("Interner ishlamadi",tag: 'internet error');
    }
  }
}
final popularTvBloc = TrendingTvBloc();