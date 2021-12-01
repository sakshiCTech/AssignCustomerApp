import 'package:get/get.dart';
import '../../repositories/subcategory_repository.dart';
import '../../models/category_model.dart';
import '../../models/subcategory_model.dart';
import '../../../common/ui.dart';

enum SubcategoriesLayout { GRID, LIST }

class SubcategoryLogic extends GetxController {
  SubCategoryRepository _subcategoryRepository;

  final category = new Category().obs;
  final subCategories = <SubCategory>[].obs;
  final layout = SubcategoriesLayout.LIST.obs;

  SubcategoryLogic() {
    _subcategoryRepository = SubCategoryRepository();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    category.value = Get.arguments as Category;
    await refreshSubcategories();
  }

  Future refreshSubcategories({bool showMessage}) async {
    await getSubcategories();
    // if (showMessage == true) {
    //   Get.showSnackbar(Ui.SuccessSnackBar(
    //       message: "List of categories refreshed successfully".tr));
    // }
  }

  Future getSubcategories() async {
    subCategories.assignAll(
        await _subcategoryRepository.getAllSubCategories(category.value.id));
  }
}
