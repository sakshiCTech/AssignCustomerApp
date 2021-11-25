

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../models/category_model.dart';
import '../models/slide_model.dart';
import '../../../providers/laravel_provider.dart';

class HomeRepository {
  LaravelApiClient _laravelApiClient;

  SettingRepository() {
    this._laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future<List<Slide>> getSlides() {
    return Get.find<LaravelApiClient>().getHomeSlider();
  }

  Future<List<Category>>getAllParents() {
    return Get.find<LaravelApiClient>().getAllParentCategories();
  }

}