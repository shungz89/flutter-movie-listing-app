import 'package:get/get.dart';
import '../models/request/get_movie_list_request.dart';
import 'base_provider.dart';

class ApiProvider extends BaseProvider {

  Future<Response> getMovieList(
      String path, GetMovieListRequest data) {
    return getWrapper(path, query: data.toJson());
  }
}
