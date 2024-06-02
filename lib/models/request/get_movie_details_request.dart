class GetMovieListRequest {
  String? movie_id;

  GetMovieListRequest({
    this.movie_id,
  });

  factory GetMovieListRequest.fromJson(Map<String, dynamic> json) =>
      GetMovieListRequest(
        movie_id: json['movie_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'movieId': movie_id,
      };
}
