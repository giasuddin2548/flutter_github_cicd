import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';

import '../../datalayer/dataProviders/dio_service.dart';
import '../../datalayer/dataProviders/dio_interceptor.dart';
import '../../utils/secure_service.dart';
import '../loginPage/login_controller.dart';
import '../loginPage/login_page.dart';

class SplashController extends GetxController {
  var userIsExits = false.obs;
  var splashScreenName = ''.obs;

  var version = '';
  @override
  void onInit() {
    super.onInit();
    getVersionCheck();
  }

  _nextScreen() async {
    return Timer(const Duration(seconds: 5), _next);
  }

  _next() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var isRememberIsClicked= sharedPreferences.getBool(AppConstant.REMEMBER_ME_CLICKED);
    // var userId= sharedPreferences.getString(AppConstant.REMEMBER_USERID);

    var userId = await SecureService().getStringSessionData(
      AppConstant.REMEMBER_USERID,
    );
    var isRememberIsClicked = await SecureService().getBoolSessionData(
      AppConstant.REMEMBER_ME_CLICKED,
    );

    // await SecureService().setStringSessionData(myValue: userId, myKey: AppConstant.REMEMBER_USERID);
    // await SecureService().setStringSessionData(myValue: responseData.authorization?.token??'', myKey: AppConstant.token);
    // await SecureService().setStringSessionData(myValue: "${rememberMe.value}", myKey: AppConstant.REMEMBER_ME_CLICKED);
    // debugPrint('USER_ID:  $isRememberIsClicked');

    if (isRememberIsClicked == true) {
      // Get.offAll(()=>MainScreen());

      // Get.to(()=>InvestInSip());

      Get.offAll(() => LoginPage(version));
      Get.put(LoginController(DioService(dioInterceptor: DioInterceptor())))
          .textFieldEmail
          .text = userId ?? '';
    } else {
      Get.offAll(() => LoginPage(version));
    }
    //
    // Get.offAll(()=>debugPrintinScreen());
    // //Get.offAll(()=>MainScreen());
  }

  getVersionCheck() async {
    ///Live
    // var response = await Dio().get(Api.getVersionCheck);
    // if (response.statusCode == 200) {
    //   var v=jsonDecode(response.data);
    //   version=v['data']['current_version'];
    //   _nextScreen();
    // }

    ///Temp
    version = '1.0.0';
    _nextScreen();
  }
}
