class GetMovieListRequest {
  String? includeAdult;
  String? includeVideo;
  String? language;
  String? page;
  String? sortBy;

  GetMovieListRequest({
    this.includeAdult,
    this.includeVideo,
    this.language,
    this.page,
    this.sortBy,
  });

  factory GetMovieListRequest.fromJson(Map<String, dynamic> json) => GetMovieListRequest(
    includeAdult: json['include_adult'] as String?,
    includeVideo: json['include_video'] as String?,
    language: json['language'] as String?,
    page: json['page'] as String?,
    sortBy: json['sort_by'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'include_adult': includeAdult,
    'include_video': includeVideo,
    'language': language,
    'page': page,
    'sort_by': sortBy,
  };
}
