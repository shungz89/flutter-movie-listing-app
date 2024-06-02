import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: Get.width,
                              height: 260,
                              child: CachedNetworkImage(
                                imageUrl: ApiConstants.imgUrl +
                                    "" +
                                    (controller.movieDetails.value.posterPath ??
                                        ""),
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
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Overview: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                                "${controller.movieDetails.value.overview != null && controller.movieDetails.value.overview!.isNotEmpty ? controller.movieDetails.value.overview : "No Overview Available"}"),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Posters: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              child: imageSliders.isNotEmpty
                                  ? CarouselSlider(
                                      options: CarouselOptions(
                                        scrollPhysics: NeverScrollableScrollPhysics(),
                                        aspectRatio: 2.0,
                                        enlargeCenterPage: true,
                                        scrollDirection: Axis.vertical,
                                        autoPlay: true,
                                        autoPlayInterval:
                                            const Duration(seconds: 2),
                                      ),
                                      items: imageSliders,
                                    )
                                  : Container(
                                      height: 200,
                                      color: Colors.grey,
                                      child: Center(child: Text("No Poster"))),
                            ),
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
                                "${controller.movieDetails.value.releaseDate ?? "No Release Date Available"}"),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Video/Trailer: ",
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
                                            progressIndicatorColor:
                                                Colors.amber,
                                            progressColors:
                                                const ProgressBarColors(
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
                                      ],
                                    ),
                                  )
                                : Text("No Trailer Available"),
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

  List<Widget> get imageSliders => controller.backdropList
      .map((item) => Container(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: Get.width,
                        height: 260,
                        child: CachedNetworkImage(
                          imageUrl:
                              ApiConstants.imgUrl + "" + (item.filePath ?? ""),
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
                    ],
                  )),
            ),
          ))
      .toList();
}
