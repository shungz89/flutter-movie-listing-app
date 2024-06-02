import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> requestInterceptor(request) async {
  // final token = StorageService.box.pull(StorageItems.accessToken);

  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  request.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NTU2YWUyYTU0YmU5MTc4YjI1ZTBkNTc0MGMwN2ViOCIsInN1YiI6IjY2NWMyN2Y2NzhiNDkzYTdlYjg4MTM5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.z7KIiW_YPFa5UivElv6wi9sIPd6rEwMGcXI_KXMOrBM';

   // request.headers['User-Agent'] = await StorageService().getUserAgent();

  // EasyLoading.show(status: '');
  try {
    print("Http Request: ${request.url}");

    ///OLD WAY to be deleted soon if print("Http Request: ${request.url}"); works as expected
    // print("Http Request: " +
    //     request.url.origin +
    //     request.url.path +
    //     (request.url.query != null && request.url.query.toString().isNotEmpty
    //         ? "/?" + request.url.query
    //         : ""));
  } catch (e) {
    print("Http Request Error: " + e.toString());
  }
  return request;
}
