import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../services/firebase_messaging_service.dart';
import '../../../common/ui.dart';
import '../../models/user_model.dart';
import '../../repositories/user_repository.dart';
import '../../services/auth_service.dart';

class RegisterLogic extends GetxController {
  var registerFormKey = new GlobalKey<FormState>();
  var loading = false.obs;
  var hidePassword = true.obs;

  String name;
  String email;
  String password;
  String phoneNumber;
  RxString verificationId = RxString('');
  String otp;

  UserRepository _userRepository;

  final Rx<User> currentUser = Get.find<AuthService>().user;

  RegisterLogic() {
    _userRepository = UserRepository();
  }

  void register() async {
    Get.focusScope.unfocus();
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      loading.value = true;
      try {
      await _userRepository.sendCodeToPhone(phoneNumber, verificationId);
      loading.value = false;
      await Get.toNamed(Routes.PHONE_VERIFICATION);
      } catch (e) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
      } finally {
        loading.value = false;
      }
    }
  }

  Future<void> verifyPhone() async {
    try {
      loading.value = true;
      await _userRepository.verifyPhone(verificationId.value, otp);

      var data = {
        "first_name": name.split(' ').first,
        "last_name": name.split(' ').last,
        "email": email,
        "password": password,
        "password_confirmation": password,
        "device_token":
            await Get.find<FireBaseMessagingService>().getDeviceToken(),
        "device_id": "device_id",
        "mobile": phoneNumber.substring(3, 12),
        "country_code": phoneNumber.substring(0, 3),
        "device_type": "android",
        "login_by": "manual"
      };
      User user = await _userRepository.register(data);
      await _userRepository.signUpWithEmailAndPassword(email, password);
      // await Get.find<RootController>().changePage(0);
      currentUser.value = user;
      Get.offAllNamed(Routes.ROOT);
    } catch (e) {
      Get.back();
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    } finally {
      loading.value = false;
    }
  }

  Future<void> resendOTPCode() async {
    await _userRepository.sendCodeToPhone(phoneNumber, verificationId);
  }
}
