import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/utils/api.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';
import '../../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../loginPage/login_page.dart';

class ChangePassController extends GetxController {
  DioService dataProvider;
  ChangePassController(this.dataProvider);

  var forgotFormKey = GlobalKey<FormState>();
  var scrollController = ScrollController();

  var tEControllerCurrentPass = TextEditingController();
  var tEControllerNewPass = TextEditingController();
  var tEControllerConfirmPass = TextEditingController();

  var isPasswordShow = false.obs;
  var isCurrentPasswordShow = false.obs;
  var isNewPasswordShow = false.obs;
  var isConfirmPasswordShow = false.obs;

  // user_id:2147
  // currentPass:12345678
  // newPassword:12345678
  // confirmPassword:12345678

  void changePassword() async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');

          var response = await dataProvider.postData(
            urlEndPoint: Api.changePassword,
            data: {
              'current_password': tEControllerCurrentPass.text,
              'new_password': tEControllerNewPass.text,
              'new_password_confirmation': tEControllerConfirmPass.text,
            },
          );

          if (response.statusCode == 200) {
            if (response.data['status'] == 'success') {
              EasyLoading.dismiss();
              AppConstant.showMyToast(response.data['message']);
              print('check: ${response.data['message']}');
              clear();
              Get.toNamed(LoginPage.routeName);
            } else {
              AppConstant.showMyToast(response.data['message']);
            }
          } else {
            AppConstant.showMyToast(response.data['errors']['new_password']);
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e, l) {
      print('fffffff: $e');
      print('fffffff: $l');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void clear() {
    tEControllerCurrentPass.clear();
    tEControllerNewPass.clear();
    tEControllerConfirmPass.clear();
  }
}
