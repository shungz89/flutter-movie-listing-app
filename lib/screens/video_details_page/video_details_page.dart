import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../api/api_constants.dart';
import '../../constants/colors.dart';
import 'video_details_page_controller.dart';

class VideoDetailsPage extends GetWidget<VideoDetailsPageController> {
  VideoDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text("Video")),
      backgroundColor: AppColors.black,
      body: Obx(
        () => controller.youtubeController != null &&
                controller.youtubeLink.value.isNotEmpty
            ? Center(
              child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: controller.youtubeController!,
                    showVideoProgressIndicator: false,
                    progressIndicatorColor: Colors.amber,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                    onReady: () {
                      controller.youtubeController!.addListener(() {
                        print("YoutubePlayer is ready to play.");
                      });
                    },
                  ),
                  builder: (context, player) {
                    return player;
                  },
                ),
            )
            : SizedBox.shrink(),
      ),
    );
  }
}
