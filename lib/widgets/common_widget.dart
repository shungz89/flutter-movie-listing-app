import 'package:fluttertoast/fluttertoast.dart';

import '../constants/colors.dart';

class CommonWidget {
  static void toast(String error) async {
    await Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColors.white,
        textColor: AppColors.black,
        fontSize: 16.0);
  }
}