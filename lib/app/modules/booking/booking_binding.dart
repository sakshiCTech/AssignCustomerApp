import 'package:get/get.dart';

import 'booking_logic.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingLogic());
  }
}
