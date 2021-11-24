import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class OnBoardingMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String route) {
    var box = GetStorage();
    var onBoarding = box.read('on_boarding') ?? false;
    if (onBoarding) {
      return RouteSettings(name: Routes.ROOT);
    }
    return null;
  }
}
