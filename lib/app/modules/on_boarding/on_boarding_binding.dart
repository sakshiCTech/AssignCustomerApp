import 'package:get/get.dart';

import 'on_boarding_logic.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingLogic());
  }
}
