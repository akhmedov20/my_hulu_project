import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../httpResult/http_result.dart';

class AppProvider {
  static Duration duration = const Duration(seconds: 30);
  final String _baseUrl = "https://api.themoviedb.org/";
  getRequest(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url),
        headers: {
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZDI5ZGE0ZDVmMmNiNTA3NGRkOTA5NzlkMjIzNWNjZCIsInN1YiI6IjYzNGZlZGM5YmU0YjM2MDA4NGU0OGNjZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ip8Nk-uIKu4Wfz4mFFFd1ohboe_s9Fd6OGlH6B0Nstk",
          "Content-Type": "application/json"
        },).timeout(duration);
      return _result(response);
    } on TimeoutException catch(e){
      print(e.message);
      return HttpResult(
          statusCode: -1,
          isSuccess: false,
          result: "Internetini yangila"
      );
    } on SocketException catch(_){
      return HttpResult(
          statusCode: -1,
          isSuccess: false,
          result: "Internetini yangila");
    }

  }

  HttpResult _result (http.Response response){
    print(response.body);
    print(response.statusCode);
    if(response.statusCode >= 200 && response.statusCode <300) {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: true,
        result: json.decode(utf8.decode(response.bodyBytes)),
      );
    }
    else{
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: false,
        result: response.body,
      );
    }
  }

  Future<HttpResult> getTrending()async{
    String url = "https://api.themoviedb.org/3/trending/movie/day?language=en-US";
    return await getRequest(url);
  }
  Future<HttpResult> getTrendingTv()async{
    String url = "https://api.themoviedb.org/3/tv/popular?language=en-US&page=1";
    return await getRequest(url);
  }
  Future<HttpResult> getTvDetail(int id)async{
    String url = "${_baseUrl}3/tv/$id?language=en-US";
    return await getRequest(url);
  }
  Future<HttpResult> getTvVideo(int id)async{
    String url = "${_baseUrl}3/tv/$id/season/1/videos?language=en-US";
    return await getRequest(url);
  }
  Future<HttpResult> getSearch(String query)async{
    String url = "${_baseUrl}3/search/movie?query=$query&include_adult=false&language=en-US&page=1";
    return await getRequest(url);
  }
  Future<HttpResult> getMovieDetail(int id)async{
    String url = "${_baseUrl}3/movie/$id?language=en-US";
    return await getRequest(url);
  }
  Future<HttpResult> getTvActors(int id)async{
    String url = 'https://api.themoviedb.org/3/tv/$id/season/1/credits?language=en-US';
    return await getRequest(url);
  }
  Future<HttpResult> getMovieVideo(int id)async{
    String url = "https://api.themoviedb.org/3/movie/$id/videos?language=en-US";
    return await getRequest(url);
  }
}