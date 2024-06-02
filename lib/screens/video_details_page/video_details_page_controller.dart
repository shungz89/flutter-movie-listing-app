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

class VideoDetailsPageController extends GetxController
    with GetTickerProviderStateMixin {
  VideoDetailsPageController({required this.apiRepository});

  final ApiRepository apiRepository;

  YoutubePlayerController? youtubeController;
  RxString youtubeLink = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    if (Get.arguments != null &&
        Get.arguments['youtube_id'] != null &&
        Get.arguments['youtube_id'].isNotEmpty) {
      youtubeLink.value = Get.arguments['youtube_id'];
      print("youtube_id is ${youtubeLink.value}");
      youtubeController = YoutubePlayerController(
        initialVideoId: "${youtubeLink.value}",
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
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
