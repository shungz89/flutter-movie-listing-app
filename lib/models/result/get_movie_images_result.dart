import '../backdrop.dart';

class GetMovieImagesResult {
  List<Backdrop>? backdrops;

  GetMovieImagesResult({
    this.backdrops,
  });

  factory GetMovieImagesResult.fromJson(Map<String, dynamic> json) {
    return GetMovieImagesResult(
      backdrops: json['backdrops'] != null
          ? List<Backdrop>.from(
              json['backdrops'].map((v) => Backdrop.fromJson(v)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrops': backdrops?.map((e) => e.toJson()).toList(),
    };
  }
}
