import 'package:cached_network_image/cached_network_image.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_listing_app/screens/main_page/widgets/movie_filter_widget.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/enums.dart';
import 'main_page_binding.dart';
import 'main_page_controller.dart';
import 'widgets/movie_listing_widget.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainPageBinding().dependencies();
    return GetBuilder<MainPageController>(
      builder: (controller) {
        ///TODO: Remove + 20 after HK7S Ends
        double bottomSafeAreaPaddingHeight = 20;

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            extendBody: true,
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text("Movie Listing App"),
            ),
            body: ColorfulSafeArea(
              color: AppColors.transparent,
              overflowRules: OverflowRules.only(bottom: true),
              // filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: Get.width,
                color: AppColors.white,
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Obx(() => MovieFilterWidget(
                          selectedGenre: controller.selectedGenre.value,
                          genreList: controller.genreList,
                          onGenreChanged: controller.onGenreChanged)),
                    ),
                    Expanded(child: MovieListingWidget()),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
