import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../api/api_repository.dart';
import '../../constants/enums.dart';
import '../../models/request/get_movie_list_request.dart';
import '../../models/result/get_movie_result.dart';

class MainPageController extends GetxController
    with WidgetsBindingObserver, GetTickerProviderStateMixin {
  ///We no longer use this because to prevent the blinking of the Tab
  // var tabIndex = 0;
  String localeString = '';

  ScrollController customScrollController = ScrollController();
  RxList<Genre> genreList = <Genre>[].obs;
  Rx<Genre> selectedGenre = Genre.All.obs;

  RxList<GetMovieResult?> mainMovieList = <GetMovieResult?>[].obs;
  RxList<GetMovieResult?> filteredMovieList = <GetMovieResult?>[].obs;

  final ApiRepository apiRepository;
  RxString sysLang = ''.obs;

  MainPageController({required this.apiRepository});

  @override
  Future<void> onInit() async {
    super.onInit();
    initGenreList();
    await initializeMovieList();
  }

  void initGenreList() {
    genreList.addAll(Genre.values);
  }

  @override
  void dispose() {
    super.dispose();
    print("MainPageController dispose");
    WidgetsBinding.instance.removeObserver(this);
  }

  //This is to auto refresh the page each time if user goes out the app and then come back in
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
  }

  @override
  void didChangeLocales(List<Locale>? locales) async {
    // TODO: implement didChangeLocales
    super.didChangeLocales(locales);
    await Get.asap(() async {
      //Solution 1:
      // await setLangBasedOnConditionAtMainPageController();
      // await updateAllTabsControllerExceptEvent();

      //We use solution 2 because we want to make user restart the App otherwise
      //we will add on more test scenario.
      //Solution 2:
      await SystemNavigator.pop();
    });
  }

  Future<void> initializeMovieList() async {
    var userListFromApi = await apiRepository.getMovieList(GetMovieListRequest(
        includeAdult: "false",
        language: 'en-US',
        page: "1",
        sortBy: 'popularity.desc'));
    print("Result is ${userListFromApi?.results}");
    if (userListFromApi != null && userListFromApi.results != null) {
      mainMovieList.value = userListFromApi.results!;
    }
    filteredMovieList.value = List.from(mainMovieList);
    filteredMovieList.refresh();
  }

  Future<void> getMovieList() async {
    var userListFromApi = await apiRepository.getMovieList(GetMovieListRequest(
        includeAdult: "false",
        language: 'en-US',
        page: "1",
        sortBy: 'popularity.desc'));
    print("Result is ${userListFromApi?.results}");
    if (userListFromApi != null && userListFromApi.results != null) {
      filteredMovieList.value = userListFromApi.results ?? [];
    }
  }

  void onGenreChanged(Genre? genre) {
    selectedGenre.value = genre ?? Genre.All;
    print("Genre is ${genre?.name}");

    if (genre == Genre.All) {
      getMovieList();
    } else {
      filteredMovieList.clear();
      mainMovieList
          .where((element) => element != null && element.genreIds != null
              ? element.genreIds!.contains(genre?.id ?? -1)
              : false)
          .toList();
      print("Main Movie List is ${mainMovieList.length}");
      filteredMovieList.addAll(mainMovieList
          .where((element) => element != null && element.genreIds != null
              ? element.genreIds!.contains(genre?.id ?? -1)
              : false)
          .toList());
      filteredMovieList.refresh();
    }
  }
}
