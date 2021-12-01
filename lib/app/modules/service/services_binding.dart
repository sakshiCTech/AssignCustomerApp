import 'package:get/get.dart';
import 'services_logic.dart';

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceLogic());
  }
}
