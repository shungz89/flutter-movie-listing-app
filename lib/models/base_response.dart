class BaseResponse<T> {
  T? results;

  BaseResponse({this.results});

  //Take note, Function(Object) create is Object instead of Map<String,dynamic>
  //That is why when we retrieve it at caller, we need to Map it back to
  //Map<String, dynamic> or List<dynamic>
  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(Object) create) {
    //Check for Object Type:
    // print('Object Created Type is: '+
    //     create(json['result']).runtimeType.toString());

    return BaseResponse<T>(
      results: json['results'] != null ? create(json['results']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'results': results,
      };
}
