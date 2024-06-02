import 'dart:async';
import 'dart:convert';

import 'package:flutter_movie_listing_app/models/result/get_movie_details_result.dart';

import '../models/base_response.dart';
import '../models/request/get_movie_list_request.dart';
import '../models/result/get_movie_result.dart';
import '../models/result/get_movie_trailer_videos_result.dart';
import 'api_provider.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<BaseResponse<List<GetMovieResult?>>?> getMovieList(
      GetMovieListRequest data) async {
    try {
      final res = await apiProvider.getMovieList('discover/movie', data);
      if (res.statusCode == 200) {
        return BaseResponse.fromJson(
            res.body,
            (json) => (json as List<dynamic>)
                .map((e) => GetMovieResult.fromJson(e as Map<String, dynamic>))
                .toList());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<GetMovieDetailsResult?> getMovieDetails(String movieId) async {
    try {
      final res = await apiProvider.getMovieDetails('movie/$movieId');
      //Convert res to a json object
      print("res is ${res}");
      if (res.statusCode == 200) {
        return GetMovieDetailsResult.fromJson(res.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<BaseResponse<List<GetMovieTrailerVideosResult?>>?> getMovieVideos(
      String movieId) async {
    try {
      final res = await apiProvider.getMovieVideos('movie/${movieId}/videos');
      if (res.statusCode == 200) {
        return BaseResponse.fromJson(
            res.body,
            (json) => (json as List<dynamic>)
                .map((e) => GetMovieTrailerVideosResult.fromJson(
                    e as Map<String, dynamic>))
                .toList());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
