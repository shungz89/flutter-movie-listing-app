import 'dart:async';
import 'dart:convert';

import '../models/base_response.dart';
import '../models/request/get_movie_list_request.dart';
import '../models/result/get_movie_result.dart';
import 'api_provider.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<BaseResponse<List<GetMovieResult?>>?> getMovieList(
      GetMovieListRequest data) async {
    try {
      final res = await apiProvider.getUserList('discover/movie', data);
      //Convert res to a json object
      print("res is ${res}");
      if (res.statusCode == 200) {
        return BaseResponse.fromJson(
            res.body,
            (json) => (json as List<dynamic>)
                .map((e) => GetMovieResult.fromJson(e as Map<String, dynamic>))
                .toList());
      } else {
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
