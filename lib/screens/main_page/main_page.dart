import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
                    Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: // Auto complete widget
                                RawAutocomplete<String>(
                              focusNode: controller.focusNode,
                              key: controller.autoCompleteKey,
                              textEditingController:
                                  controller.textEditingController,
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                return controller.searchHistoryList
                                    .where((String option) {
                                  return option.contains(
                                      textEditingValue.text.toLowerCase());
                                });
                              },
                              fieldViewBuilder: (
                                BuildContext context,
                                TextEditingController textEditingController,
                                FocusNode focusNode,
                                VoidCallback onFieldSubmitted,
                              ) {
                                return TextFormField(
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onFieldSubmitted: (String value) {
                                    controller.onSearchSubmitted(value);
                                  },
                                  onChanged: (String value) {
                                    controller.onSearchBarTextChange(value);
                                  },
                                );
                              },
                              optionsViewBuilder: (
                                BuildContext context,
                                AutocompleteOnSelected<String> onSelected,
                                Iterable<String> options,
                              ) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Material(
                                    elevation: 4.0,
                                    child: SizedBox(
                                      height: options.length * 56.0,
                                      child: ListView.builder(
                                        padding: const EdgeInsets.all(8.0),
                                        itemCount: options.length,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final String option =
                                              options.elementAt(index);
                                          return GestureDetector(
                                            onTap: () {
                                              onSelected(option);
                                              controller.onSearchSubmitted(
                                                  controller
                                                      .textEditingController
                                                      .text);
                                            },
                                            child: ListTile(
                                              title: Text(option),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.onSearchSubmitted(
                                controller.textEditingController.text);
                            controller.focusNode.unfocus();
                          },
                          child: Icon(Icons.search),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Obx(() => MovieFilterWidget(
                          selectedGenre: controller.selectedGenre.value,
                          genreList: controller.genreList.toList(),
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
