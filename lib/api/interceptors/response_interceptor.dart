import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../models/base_response.dart';
import '../../models/error_response.dart';
import '../../models/result/generic_result.dart';
import '../../widgets/common_widget.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  try {
    print("Http Response: ${response.bodyString ?? ""}");
  } catch (e) {
    print("Http Response Error: " + e.toString());
  }

  if (response.statusCode != 200) {
    handleErrorStatus(response);
    return;
  }

  return response;
}

void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 400:
      final message = ErrorResponse.fromJson(response.body);
      CommonWidget.toast(message.error);
      break;
    default:
      CommonWidget.toast("Unexpected Error!");
      break;
  }

  return;
}
