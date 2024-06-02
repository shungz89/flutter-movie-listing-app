import 'package:get/get.dart';

class ApiWrapper extends GetConnect {
  Future<Response<dynamic>> getWrapper(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<dynamic>? decoder,
    bool? shouldAddDefaultParams = true,
  }) async {
    return await get(url,
        headers: headers,
        contentType: contentType,
        query: query,
        decoder: decoder);
  }

  Future<Response<dynamic>> postWrapper(
    String url,
    dynamic body, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<dynamic>? decoder,
    dynamic Function(double)? uploadProgress,
    bool? shouldAddDefaultParams = true,
  }) async {
    return await post(
      url,
      body,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
      uploadProgress: uploadProgress,
    );
  }
}
