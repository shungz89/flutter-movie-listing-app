import 'dart:async';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../api/api_repository.dart';
import '../../models/backdrop.dart';
import '../../models/result/get_movie_details_result.dart';

class DetailsPageController extends GetxController
    with GetTickerProviderStateMixin {
  DetailsPageController({required this.apiRepository});

  final ApiRepository apiRepository;
  final RxString movieId = '-1'.obs;
  final RxString movieLink = ''.obs;

  Rx<GetMovieDetailsResult> movieDetails = GetMovieDetailsResult().obs;
  YoutubePlayerController? youtubeController;

  RxList<Backdrop> backdropList = <Backdrop>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    if (Get.arguments != null &&
        Get.arguments['movie_id'] != null &&
        Get.arguments['movie_id'].isNotEmpty) {
      movieId.value = Get.arguments['movie_id'];
      print("movieId is ${movieId.value}");
      await getMovieImages();
      await getMovieDetails();
      youtubeController = YoutubePlayerController(
        initialVideoId: "${movieLink.value}",
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );

      await getMovieVideos();
    }
  }

  Future<void> getMovieDetails() async {
    if (movieId.value == '-1') {
      return;
    }
    final res = await apiRepository.getMovieDetails(movieId.value);
    if (res != null) {
      movieDetails.value = res;
      print("movieDetails is ${movieDetails.value.toJson()}");
    }
  }

  Future<void> getMovieVideos() async {
    if (movieId.value == '-1') {
      return;
    }
    final res = await apiRepository.getMovieVideos(movieId.value);
    if (res != null && res.results != null && res.results!.isNotEmpty) {
      movieLink.value = res.results![0]?.key ?? '';
      movieLink.refresh();
      print("movieLink is ${movieLink.value}");
      youtubeController?.dispose();
      youtubeController = YoutubePlayerController(
        initialVideoId: "${movieLink.value}",
        flags: YoutubePlayerFlags(
            autoPlay: false, mute: false, hideControls: true),
      );
    }
  }

  Future<void> getMovieImages() async {
    if (movieId.value == '-1') {
      return;
    }
    final res = await apiRepository.getMovieImages(movieId.value);
    if (res != null && res.backdrops != null && res.backdrops!.isNotEmpty) {
      backdropList.value = res.backdrops ?? [];
      print("backdropList is ${backdropList.length}");
    }
  }

  @override
  void dispose() {
    super.dispose();
    youtubeController?.dispose();
    print("DetailsPageController dispose");
  }
}
