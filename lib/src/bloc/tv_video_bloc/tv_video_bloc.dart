
import 'package:hulu/src/apimodels/tv_video_model/tv_video_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../httpResult/http_result.dart';
import '../../repository/repository.dart';



class TvVideoBloc{
  final Repository _repository = Repository();
  final _fetchTvVideo = PublishSubject<PopularTvVideoModel>();
  Stream<PopularTvVideoModel> get getMovieVideo => _fetchTvVideo.stream;

  getMovieVideoList(int id) async{
    HttpResult response = await _repository.getMovieVideo(id);
    if(response.isSuccess){
      var data = PopularTvVideoModel.fromJson(response.result);
      _fetchTvVideo.sink.add(data);
    }
  }
}
final popularTvVideoBloc = TvVideoBloc();