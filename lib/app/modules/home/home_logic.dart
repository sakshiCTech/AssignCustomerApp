import 'package:get/get.dart';
import 'models/slide_model.dart';
import 'repositories/home_repo.dart';
import '../../../common/ui.dart';

import 'models/category_model.dart';

class HomeLogic extends GetxController {
  final slider = <Slide>[].obs;
  final categories = <Category>[].obs;

  final currentSlide = 0.obs;

  HomeRepository _homeRepository;

  HomeLogic() {
    _homeRepository = HomeRepository();
  }

  @override
  void onInit() async {
    await refreshHome();
    super.onInit();
  }

  Future refreshHome({bool showMessage = false}) async {
    await getSlider();
    await getCategories();
    // await getFeatured();
    // await getRecommendedEServices();
    // Get.find<RootController>().getNotificationsCount();
    // if (showMessage) {
    //   Get.showSnackbar(Ui.SuccessSnackBar(message: "Home page refreshed successfully".tr));
    // }
  }

  Future getSlider() async {
    try {
      slider.assignAll(await _homeRepository.getSlides());
    } catch (e) {
      Get.log("error: ============${e.toString()}");
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future getCategories() async {
    try {
      categories.assignAll(await _homeRepository.getAllParents());
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }
}
