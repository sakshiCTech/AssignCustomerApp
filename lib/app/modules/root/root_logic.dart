import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/app/modules/home/home_view.dart';

class RootLogic extends GetxController {
  final currentIndex = 0.obs;
  final notificationsCount = 0.obs;
  // final customPages = <CustomPage>[].obs;
  // NotificationRepository _notificationRepository;
  // CustomPageRepository _customPageRepository;

  RootController() {
    // _notificationRepository = new NotificationRepository();
    // _customPageRepository = new CustomPageRepository();
  }

  @override
  void onInit() async {
    super.onInit();
    await getCustomPages();
  }

  List<Widget> pages = [
    HomePage(),
    // BookingsView(),
    // MessagesView(),
    // AccountView(),
  ];

  Widget get currentPage => pages[currentIndex.value];

  /**
   * change page in route
   * */
  Future<void> changePageInRoot(int _index) async {
    // if (!Get.find<AuthService>().isAuth && _index > 0) {
    //   await Get.toNamed(Routes.LOGIN);
    // } else {
    //   currentIndex.value = _index;
    //   await refreshPage(_index);
    // }
  }

  Future<void> changePageOutRoot(int _index) async {
    // if (!Get.find<AuthService>().isAuth && _index > 0) {
    //   await Get.toNamed(Routes.LOGIN);
    // }
    // currentIndex.value = _index;
    // await refreshPage(_index);
    // await Get.offNamedUntil(Routes.ROOT, (Route route) {
    //   if (route.settings.name == Routes.ROOT) {
    //     return true;
    //   }
    //   return false;
    // }, arguments: _index);
  }

  Future<void> changePage(int _index) async {
    // if (Get.currentRoute == Routes.ROOT) {
    //   await changePageInRoot(_index);
    // } else {
    //   await changePageOutRoot(_index);
    // }
  }

  Future<void> refreshPage(int _index) async {
    // switch (_index) {
    //   case 0:
    //     {
    //       await Get.find<HomeController>().refreshHome();
    //       break;
    //     }
    //   case 1:
    //     {
    //       await Get.find<BookingsController>().refreshBookings();
    //       break;
    //     }
    //   case 2:
    //     {
    //       await Get.find<MessagesController>().refreshMessages();
    //       break;
    //     }
    // }
  }

  void getNotificationsCount() async {
    // notificationsCount.value = await _notificationRepository.getCount();
  }

  Future<void> getCustomPages() async {
    // customPages.assignAll(await _customPageRepository.all());
  }
}
