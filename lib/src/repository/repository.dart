import 'package:hulu/src/provider/provider.dart';

import '../httpResult/http_result.dart';

class Repository {
  final AppProvider _provider = AppProvider();
  Future<HttpResult> getTrendingList() => _provider.getTrending();
  Future<HttpResult> getTrendingTvList() => _provider.getTrendingTv();
  Future<HttpResult> getTvDetailList(id) => _provider.getTvDetail(id);
  Future<HttpResult> getTvVideList(id) => _provider.getTvVideo(id);
  Future<HttpResult> getMovieDetailList(id) => _provider.getMovieDetail(id);
  Future<HttpResult> getTvActorsList(id) => _provider.getTvActors(id);
  Future<HttpResult> getSearch(query) => _provider.getSearch(query);
  Future<HttpResult> getMovieVideo(id) => _provider.getMovieVideo(id);

}