import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/app/models/service_model.dart';
import 'package:home_services/app/models/subcategory_model.dart';
import 'package:home_services/app/repositories/subcategory_repository.dart';

import '../../../common/ui.dart';
import '../../models/category_model.dart';


enum CategoryFilter { ALL, AVAILABILITY, RATING, FEATURED, POPULAR }

class ServiceLogic extends GetxController {
  final subcategory = new SubCategory().obs;
  final selected = Rx<CategoryFilter>(CategoryFilter.ALL);
  final eServices = <Service>[].obs;
  final page = 0.obs;
  final isLoading = true.obs;
  final isDone = false.obs;
  // EServiceRepository _eServiceRepository;
  ScrollController scrollController = ScrollController();

  SubCategoryRepository _subCategoryRepository;

  ServiceLogic() {
    // _eServiceRepository = new EServiceRepository();
    _subCategoryRepository = SubCategoryRepository();
  }

  @override
  Future<void> onInit() async {
    subcategory.value = Get.arguments as SubCategory;
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !isDone.value) {
    //     loadEServicesOfCategory(category.value.id, filter: selected.value);
    //   }
    // });
    await refreshEServices();
    super.onInit();
  }

  @override
  void onClose() {
    // scrollController.dispose();
  }

  Future refreshEServices({bool showMessage}) async {
    await loadEServicesOfCategory(subcategory.value.id, filter: selected.value);
    // if (showMessage == true) {
    //   Get.showSnackbar(Ui.SuccessSnackBar(message: "List of services refreshed successfully".tr));
    // }
  }

  bool isSelected(CategoryFilter filter) => selected == filter;

  void toggleSelected(CategoryFilter filter) {
    this.eServices.clear();
    this.page.value = 0;
    if (isSelected(filter)) {
      selected.value = CategoryFilter.ALL;
    } else {
      selected.value = filter;
    }
  }

  Future loadEServicesOfCategory(int subcategoryId, {CategoryFilter filter}) async {
    eServices.assignAll(await _subCategoryRepository.getALLServices(subcategoryId));

    // try {
    //   isLoading.value = true;
    //   isDone.value = false;
    //   this.page.value++;
    //   List<EService> _eServices = [];
    //   switch (filter) {
    //     case CategoryFilter.ALL:
    //       _eServices = await _eServiceRepository.getAllWithPagination(categoryId, page: this.page.value);
    //       break;
    //     case CategoryFilter.FEATURED:
    //       _eServices = await _eServiceRepository.getFeatured(categoryId, page: this.page.value);
    //       break;
    //     case CategoryFilter.POPULAR:
    //       _eServices = await _eServiceRepository.getPopular(categoryId, page: this.page.value);
    //       break;
    //     case CategoryFilter.RATING:
    //       _eServices = await _eServiceRepository.getMostRated(categoryId, page: this.page.value);
    //       break;
    //     case CategoryFilter.AVAILABILITY:
    //       _eServices = await _eServiceRepository.getAvailable(categoryId, page: this.page.value);
    //       break;
    //     default:
    //       _eServices = await _eServiceRepository.getAllWithPagination(categoryId, page: this.page.value);
    //   }
    //   if (_eServices.isNotEmpty) {
    //     this.eServices.addAll(_eServices);
    //   } else {
    //     isDone.value = true;
    //   }
    // } catch (e) {
    //   this.isDone.value = true;
    //   Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    // } finally {
    //   isLoading.value = false;
    // }
  }
}
