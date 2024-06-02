import 'package:flutter/material.dart';
import 'package:flutter_movie_listing_app/routes/app_routes.dart';
import 'package:flutter_movie_listing_app/screens/main_page/main_page_controller.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../widgets/movie_item_widget.dart';
import '../../../models/result/get_movie_result.dart';

class MovieListingWidget extends GetWidget<MainPageController> {
  const MovieListingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int pixel = Get.pixelRatio.toInt();
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx(
        () => !controller.filteredMovieList.isBlank!
            ? ListView.builder(
                shrinkWrap: true,

                ///change here
                itemCount: controller.filteredMovieList.length,
                itemBuilder: (context, index) {
                  return UserItemWidget(
                      controller.filteredMovieList[index] != null
                          ? controller.filteredMovieList[index]!
                          : GetMovieResult(), onTap: () {
                    Get.toNamed(AppRoutes.DETAILS, arguments: {
                      'movie_id': "${controller.filteredMovieList[index]!.id}"
                    });
                  });
                },
              )
            : SizedBox.shrink(),
      ),
      // floatingActionButton: _floatingActionButton(),
    );
  }
}
