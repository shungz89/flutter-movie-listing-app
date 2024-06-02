import 'package:flutter/material.dart';
import 'package:flutter_movie_listing_app/lang/translation_files/translation_en_US.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.locale ?? const Locale('en_US');
  static final fallbackLocale = Locale('en_US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': Translation_en_US.en_US,
      };
}
