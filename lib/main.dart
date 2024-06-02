import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_movie_listing_app/routes/app_pages.dart';
import 'package:flutter_movie_listing_app/routes/app_routes.dart';
import 'package:flutter_movie_listing_app/themes/app_theme.dart';
import 'package:get/get.dart';

import 'app_binding.dart';
import 'constants/colors.dart';
import 'constants/constant.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'di.dart';
import 'lang/translation_service.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Initialize all reusable dependencies like StorageService and EventBus
  ///Supposed that APIService also may need to inject in here but our boilerplate didn't do it this way
  await DenpendencyInjection.init();

  ///This is to set the App to be in Portrait Mode only when launching it
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  configLoading();
  initializeDateFormatting().then((value) async {
    ///Hardcode to en_US
    String savedLocalString =  "en_US";
    runApp(App(savedLocalString: savedLocalString));
  });
}

class App extends StatelessWidget {
  App({super.key, required this.savedLocalString});

  String savedLocalString;

  @override
  Widget build(BuildContext context) {
    //Todo: This Doesn't seems to work, maybe can remove soon
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: AppColors.black, // transparent status bar
    //     statusBarIconBrightness: Brightness.light // dark text for status bar
    //     ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppRoutes.SPLASH,
      defaultTransition: Transition.rightToLeft,
      getPages: AppPages.list,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: 'Movie Listing App',
      theme: AppTheme.light,
      locale: Locale(savedLocalString),
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      builder: EasyLoading.init(),
    );
  }
}

void configLoading() {
  EasyLoading.instance

  /// Overlay
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.black.withOpacity(0.5)
    ..indicatorWidget = Image.asset(
      AppConstants.IMAGE_ASSET_PATH + 'loading_ball.gif',
      width: 50,
      height: 50,
    )
  // ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
  // ..indicatorSize = 45.0
    ..radius = 10.0
  // ..progressColor = Colors.yellow
    ..backgroundColor = AppColors.transparent
    ..boxShadow = <BoxShadow>[]
    ..indicatorColor = Colors.red
    ..textColor = Colors.green
  // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}


