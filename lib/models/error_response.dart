class ErrorResponse {
  ErrorResponse({
    required this.error,
  });

  String error;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
      };
}
