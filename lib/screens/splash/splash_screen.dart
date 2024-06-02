import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../utils/size_config.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ///TODO: Need to find out what is this
    SizeConfig().init(context);
    return Container(
      height: Get.height,
      child: Center(child: Text("Splash Screen", style: TextStyle(fontSize: 56),)),
    );
  }
}
