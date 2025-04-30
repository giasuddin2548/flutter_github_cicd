import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/screens/signup_screen/password_setup.dart';
import 'package:flutter_github_cicd/utils/api.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';
import '../../datalayer/dataProviders/dio_service.dart';
import '../../utils/secure_service.dart';
import '../loginPage/login_page.dart';

class SignUpController extends GetxController {
  DioService dataProvider;
  SignUpController(this.dataProvider);

  var fullNameController = TextEditingController();
  var companyNameController = TextEditingController();
  var otpController = TextEditingController();
  var passwordController = TextEditingController();
  var confPasswordController = TextEditingController();
  var mobileNoController = TextEditingController();
  var dobController = TextEditingController();

  // RxObjectMixin<DistrictModel> selectedDistrict = DistrictModel().obs;
  // var districtList = <DistrictModel>[].obs;
  //
  // RxObjectMixin<ThanaModel> selectedThana = ThanaModel().obs;
  // var thanaList = <ThanaModel>[].obs;
  //
  // @override
  // void onInit() {
  //   districtList.add(DistrictModel(name: "Dhaka"));
  //   thanaList.add(ThanaModel(name: "Uttara"));
  //   super.onInit();
  // }

  var activeStepIndex = 0.obs;
  var isPasswordShow = false.obs;
  var isConfPasswordShow = false.obs;

  Future<void> postSignup1() async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          var response = await dataProvider.postDataWithoutToken(
            urlEndPoint: Api.generateOTP,
            data: {'phone_no': mobileNoController.text},
          );

          if (response.statusCode == 200) {
            if (response.data['message'] == 'OTP Creation successful') {
              AppConstant.showMyToast(response.data['message']);

              await SecureService().setStringSessionData(
                myValue: "${mobileNoController.text}",
                myKey: "regtmpdata1",
              );
              await SecureService().setStringSessionData(
                myValue: "${fullNameController.text}",
                myKey: "regtmpdata2",
              );
              await SecureService().setStringSessionData(
                myValue: "${passwordController.text}",
                myKey: "regtmpdata3",
              );
              await SecureService().setStringSessionData(
                myValue: "${companyNameController.text}",
                myKey: "regtmpdata4",
              );

              Get.off(() => PasswordSetup());
            } else {
              AppConstant.showMyToast(response.data['message']);
            }
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

  Future<void> postSignup2() async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');

          print({
            'phone': await SecureService().getStringSessionData("regtmpdata1"),
            'name': await SecureService().getStringSessionData("regtmpdata2"),
            'otp': otpController.text,
            'password': await SecureService().getStringSessionData(
              "regtmpdata3",
            ),
            'company_name': await SecureService().getStringSessionData(
              "regtmpdata4",
            ),
          });

          var response = await dataProvider.postDataWithoutToken(
            urlEndPoint: Api.registerNow,
            data: {
              'phone': await SecureService().getStringSessionData(
                "regtmpdata1",
              ),
              'name': await SecureService().getStringSessionData("regtmpdata2"),
              'otp': otpController.text,
              'password': await SecureService().getStringSessionData(
                "regtmpdata3",
              ),
              'company_name': await SecureService().getStringSessionData(
                "regtmpdata4",
              ),
            },
          );

          if (response.statusCode == 200) {
            if (response.data['message'] == 'Registration successful') {
              AppConstant.showMyToast(response.data['message']);
              Get.off(() => LoginPage(''));
            } else {
              AppConstant.showMyToast(response.data['message']);
            }
          } else {
            AppConstant.showMyToast(response.data['message']);
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

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return '';
  }
}
