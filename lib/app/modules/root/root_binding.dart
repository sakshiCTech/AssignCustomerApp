import 'package:get/get.dart';
import '../home/home_logic.dart';

import 'root_logic.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootLogic());
    Get.put(HomeLogic(), permanent: true);
  }
}
