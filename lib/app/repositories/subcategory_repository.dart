

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:home_services/app/models/service_model.dart';
import '../models/subcategory_model.dart';
import '../providers/laravel_provider.dart';


class SubCategoryRepository {
  LaravelApiClient _laravelApiClient;

  SubCategoryRepository() {
    this._laravelApiClient = Get.find<LaravelApiClient>();
  }


  Future<List<SubCategory>>getAllSubCategories(int categoryId) {
    return Get.find<LaravelApiClient>().getAllSubCategories(categoryId);
  }

 Future<List<Service>> getALLServices(int subcategoryId) {
   return Get.find<LaravelApiClient>().getALLServices(subcategoryId);
 }

}