import 'api.dart';
import 'api_wrapper.dart';

//This is use to cater two baseUrl
class BaseProvider extends ApiWrapper {
  @override
  void onInit() async {
    httpClient.baseUrl = ApiConstants.baseURL;
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
    httpClient.timeout = Duration(seconds: 15);
  }
}
