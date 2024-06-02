import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> authInterceptor(request) async {
  // final token = StorageService.box.pull(StorageItems.accessToken);

  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NTU2YWUyYTU0YmU5MTc4YjI1ZTBkNTc0MGMwN2ViOCIsInN1YiI6IjY2NWMyN2Y2NzhiNDkzYTdlYjg4MTM5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.z7KIiW_YPFa5UivElv6wi9sIPd6rEwMGcXI_KXMOrBM';

  return request;
}
