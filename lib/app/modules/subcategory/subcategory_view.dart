import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'widgets/subcategory_grid_item_widget.dart';
import 'widgets/subcategory_list_item_widget.dart';
import '../../global_widgets/circular_loading_widget.dart';
import '../category/categories_controller.dart';
import '../category/widgets/category_grid_item_widget.dart';
import '../category/widgets/category_list_item_widget.dart';
import '../home/widgets/home_search_bar_widget.dart';
import '../../providers/laravel_provider.dart';

import 'subcategory_logic.dart';

class SubcategoryPage extends GetView<SubcategoryLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Subcategories".tr,
            style: Get.textTheme.headline6,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
            onPressed: () => {Get.back()},
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<LaravelApiClient>().forceRefresh();
            controller.refreshSubcategories(showMessage: true);
            Get.find<LaravelApiClient>().unForceRefresh();
          },
          child: ListView(
            primary: true,
            children: [
              HomeSearchBarWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Row(children: [
                  Expanded(
                    child: Text(
                      "Subcategories of services".tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          controller.layout.value = SubcategoriesLayout.LIST;
                        },
                        icon: Obx(() {
                          return Icon(
                            Icons.format_list_bulleted,
                            color: controller.layout.value == SubcategoriesLayout.LIST ? Get.theme.colorScheme.secondary : Get.theme.focusColor,
                          );
                        }),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.layout.value = SubcategoriesLayout.GRID;
                        },
                        icon: Obx(() {
                          return Icon(
                            Icons.apps,
                            color: controller.layout.value == SubcategoriesLayout.GRID ? Get.theme.colorScheme.secondary : Get.theme.focusColor,
                          );
                        }),
                      )
                    ],
                  ),
                ]),
              ),
              Obx(() {
                return Offstage(
                  offstage: controller.layout.value != SubcategoriesLayout.GRID,
                  child: controller.subCategories.isEmpty
                      ? CircularLoadingWidget(height: 400)
                      : StaggeredGridView.countBuilder(
                    primary: false,
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: controller.subCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SubcategoryGridItemWidget(category: controller.subCategories.elementAt(index), heroTag: "heroTag");
                    },
                    staggeredTileBuilder: (int index) => new StaggeredTile.fit(Get.mediaQuery.orientation == Orientation.portrait ? 2 : 4),
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                  ),
                );
              }),
              Obx(() {
                return Offstage(
                  offstage: controller.layout.value != SubcategoriesLayout.LIST,
                  child: controller.subCategories.isEmpty
                      ? CircularLoadingWidget(height: 400)
                      : ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: controller.subCategories.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemBuilder: (context, index) {
                      return SubcategoryListItemWidget(
                        heroTag: 'category_list',
                        expanded: index == 0,
                        category: controller.subCategories.elementAt(index),
                      );
                    },
                  ),
                );
              }),
              // Container(
              //   child: ListView(
              //       primary: false,
              //       shrinkWrap: true,
              //       children: List.generate(controller.categories.length, (index) {
              //         return Obx(() {
              //           var _category = controller.categories.elementAt(index);
              //           return Padding(
              //             padding: const EdgeInsetsDirectional.only(start: 20),
              //             child: Text(_category.name),
              //           );
              //         });
              //       })),
              // ),
            ],
          ),
        ));
  }
}
