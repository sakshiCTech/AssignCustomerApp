import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class OnBoardingLogic extends GetxController {
  completeOnBoarding() async {
    var storage = GetStorage();
    await storage.write('on_boarding', true);
    Get.offAllNamed(Routes.ROOT);
  }
}
