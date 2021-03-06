import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:get/get.dart';

import '../services/auth_service.dart';

class FirebaseProvider extends GetxService {
  fba.FirebaseAuth _auth = fba.FirebaseAuth.instance;

  Future<FirebaseProvider> init() async {
    return this;
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      fba.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return await signUpWithEmailAndPassword(email, password);
    }
  }

  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    // fba.UserCredential result = await _auth.createUserWithEmailAndPassword(
    //     email: email, password: password);
    fba.AuthCredential credential =
        fba.EmailAuthProvider.credential(email: email, password: password);
    fba.UserCredential result =
        await _auth.currentUser.linkWithCredential(credential);
    if (result.user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> verifyPhone(String verificationId, String smsCode) async {
    try {
      final fba.AuthCredential credential = fba.PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await fba.FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> sendCodeToPhone(
      String phoneNumber, RxString verificationId) async {
    final fba.PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {};
    final fba.PhoneCodeSent smsCodeSent =
        (String verId, [int forceCodeResent]) {
      verificationId.value = verId;
    };
    final fba.PhoneVerificationCompleted _verifiedSuccess =
        (fba.AuthCredential auth) async {};
    final fba.PhoneVerificationFailed _verifyFailed =
        (fba.FirebaseAuthException e) {
      throw Exception(e.message);
    };
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 30),
      verificationCompleted: _verifiedSuccess,
      verificationFailed: _verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,
    );
  }

  Future signOut() async {
    return await _auth.signOut();
  }
}
