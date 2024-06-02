import 'dart:async';
import 'dart:io';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../api/api_repository.dart';
import '../../constants/enums.dart';
import '../../models/request/get_movie_list_request.dart';
import '../../models/result/get_movie_details_result.dart';
import '../../models/result/get_movie_result.dart';

class DetailsPageController extends GetxController
    with GetTickerProviderStateMixin {
  DetailsPageController({required this.apiRepository});

  final ApiRepository apiRepository;
  final RxString movieId = '-1'.obs;
  final RxString movieLink = ''.obs;

  Rx<GetMovieDetailsResult> movieDetails = GetMovieDetailsResult().obs;
  YoutubePlayerController? youtubeController;

  @override
  Future<void> onInit() async {
    super.onInit();

    if (Get.arguments != null &&
        Get.arguments['movie_id'] != null &&
        Get.arguments['movie_id'].isNotEmpty) {
      movieId.value = Get.arguments['movie_id'];
      print("movieId is ${movieId.value}");
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
          autoPlay: false,
          mute: false,
          hideControls: true
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    youtubeController?.dispose();
    print("DetailsPageController dispose");
  }
}
