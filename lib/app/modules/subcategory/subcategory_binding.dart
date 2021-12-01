import 'package:get/get.dart';

import 'subcategory_logic.dart';

class SubcategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubcategoryLogic());
  }
}
