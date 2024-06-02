import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../api/api_constants.dart';
import '../../constants/colors.dart';
import '../../routes/app_pages.dart';
import '../../routes/app_routes.dart';
import 'details_page_controller.dart';

class DetailsPage extends GetWidget<DetailsPageController> {
  DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Obx(() => Text("${controller.movieDetails.value.title ?? ""}")),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: Get.height,
                child: CachedNetworkImage(
                  imageUrl: ApiConstants.imgUrl +
                      "" +
                      (controller.movieDetails.value.backdropPath ?? ""),
                  width: Get.width,
                  fit: BoxFit.fitHeight,
                  height: Get.height,
                  placeholder: (context, url) => Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    child: Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                  color: AppColors.transparentWhite80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width,
                        height: 260,
                        child: CachedNetworkImage(
                          imageUrl: ApiConstants.imgUrl +
                              "" +
                              (controller.movieDetails.value.posterPath ?? ""),
                          width: Get.width,
                          fit: BoxFit.fill,
                          height: 320,
                          placeholder: (context, url) => Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            child: Icon(
                              Icons.error,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Overview: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("${controller.movieDetails.value.overview}"),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Release date: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                                "${controller.movieDetails.value.releaseDate}"),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Trailer: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            controller.youtubeController != null &&
                                    controller.movieLink.value.isNotEmpty
                                ? GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.VIDEO_DETAILS,
                                          arguments: {
                                            'youtube_id':
                                                controller.movieLink.value
                                          });
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                      YoutubePlayerBuilder(
                                        player: YoutubePlayer(
                                          controller:
                                          controller.youtubeController!,
                                          showVideoProgressIndicator: false,
                                          progressIndicatorColor: Colors.amber,
                                          progressColors: const ProgressBarColors(
                                            playedColor: Colors.amber,
                                            handleColor: Colors.amberAccent,
                                          ),
                                          onReady: () {
                                            controller.youtubeController!
                                                .addListener(() {
                                              print(
                                                  "YoutubePlayer is ready to play.");
                                            });
                                          },
                                        ),
                                        builder: (context, player) {
                                          return player;
                                        },
                                      ),
                                      Center(
                                        child: Icon(
                                          Icons.play_circle_fill,
                                          color: Colors.white,
                                          size: 48,
                                        ),
                                      ),
                                    ],),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
