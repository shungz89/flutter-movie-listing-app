class GenericResult {
  int? businessCode;
  String? message;

  GenericResult({this.businessCode, this.message});

  factory GenericResult.fromJson(Map<String, dynamic> json) => GenericResult(
        businessCode: json['businessCode'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "businessCode": businessCode,
        "message": message,
      };
}
