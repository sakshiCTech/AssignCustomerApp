import 'dart:io';

import 'package:get/get.dart';

import '../providers/laravel_provider.dart';

class BookingRepository {
  LaravelApiClient _laravelApiClient;

  BookingRepository() {
    this._laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future add(Map<String, dynamic> data) {
    return _laravelApiClient.addBooking(data);
  }
}
