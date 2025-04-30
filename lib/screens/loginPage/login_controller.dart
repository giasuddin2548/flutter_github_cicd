import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../datalayer/dataProviders/dio_service.dart';
import '../../datalayer/models/ChildLoginData.dart';
import '../../datalayer/models/login/LoginData.dart';
import '../../utils/api.dart';
import '../../utils/app_constent.dart';
import '../../utils/secure_service.dart';
import '../homePage/home_page.dart';
import 'login_page.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  DioService dataProvider;
  LoginController(this.dataProvider);
  var textFieldEmail = TextEditingController();
  var textFieldPassword = TextEditingController();

  var scrollController = ScrollController();
  var checkRemember = false.obs;
  var isPasswordShow = false.obs;
  var rememberMe = false.obs;
  var childLogin = <ChildLoginData>[].obs;

  RxObjectMixin<ChildLoginData> selectedChild = ChildLoginData().obs;

  @override
  void onInit() {
    textFieldEmail.text = '01313002662';
    textFieldPassword.text = 'A12345';
    super.onInit();
  }

  void login() async {
    var userId = textFieldEmail.text;
    var pass = textFieldPassword.text;
    String url = Api.loginUrl;
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');
          var d = {'phone': userId, 'password': pass};
          var response = await dataProvider.tokenGenerate(
            urlEndPoint: url,
            data: d,
          );
          if (response.statusCode == 200) {
            Map<String, dynamic> resultData = jsonDecode(
              response.data['result'],
            );

            // Convert the refined result into the model
            LoginData loginData = LoginData.fromJson(resultData);

            if (loginData.message == 'User has been logged in successfully') {
              AppConstant.showMyToast("${loginData.message}");

              await SecureService().setStringSessionData(
                myValue: loginData.accessToken ?? '',
                myKey: AppConstant.token,
              );
              await SecureService().setStringSessionData(
                myValue: "${loginData.user?.userId ?? ''}",
                myKey: AppConstant.userId,
              );
              await SecureService().setStringSessionData(
                myValue: "${loginData.user?.employeeId ?? ''}",
                myKey: AppConstant.userEmployee_id,
              );
              await SecureService().setStringSessionData(
                myValue: loginData.user?.name ?? '',
                myKey: AppConstant.userName,
              );
              await SecureService().setStringSessionData(
                myValue: loginData.user?.phone ?? '',
                myKey: AppConstant.userPhone,
              );
              await SecureService().setStringSessionData(
                myValue: loginData.user?.profileImage ?? '',
                myKey: AppConstant.userProfile_image,
              );

              Get.offAll(() => HomePage());
            } else {
              AppConstant.showMyToast('Failed to Login');
            }
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
          debugPrint('No Internet Connection');
        }
      });
    } catch (e, l) {
      print(e);
      print(l);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void childLogout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(() => LoginPage(""));
  }
}
