import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:stepper_a/stepper_a.dart';
import 'package:flutter_github_cicd/utils/api.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../datalayer/dataProviders/dio_service.dart';
import '../loginPage/login_page.dart';

class StepController extends GetxController {
  DioService dataProvider;
  StepController(this.dataProvider);
  StepperAController stepperAController = StepperAController();
  var step1FormKey = GlobalKey<FormState>();
  var step2FormKey = GlobalKey<FormState>();
  var step3FormKey = GlobalKey<FormState>();
  var scrollController = ScrollController();

  var forgotPwOtpTextField = TextEditingController();
  var emailController = TextEditingController();
  var otpController = TextEditingController();
  var passwordController = TextEditingController();
  var confPasswordController = TextEditingController();
  var mobileNoController = TextEditingController();
  var confirmForgetClientOtpTextField = TextEditingController();

  var activeStepIndex = 0.obs;
  var isPasswordShow = false.obs;
  var isConfPasswordShow = false.obs;

  Timer? _timer;
  int remainingSeconds = 0;
  final time = '0.00'.obs;

  @override
  void onInit() {
    // emailController.text='AIMS-104';
    super.onInit();
  }

  Future<void> forgotPw1() async {
    final SharedPreferences p = await SharedPreferences.getInstance();
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');

          var response = await dataProvider.postDataWithoutToken(
            urlEndPoint: Api.forgotPw1,
            data: {'email_or_mobile': emailController.text},
          );

          if (response.statusCode == 200) {
            if (response.data['status'] == 'success') {
              EasyLoading.dismiss();
              AppConstant.showMyToast(response.data['message']);
              p.setInt('userId', response.data['user']['id']);
              print('check_id: ${response.data['user']['id']}');
              stepperAController.next(onTap: (v) {});
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

  Future<void> forgotPw2() async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');

          var response = await dataProvider.postDataWithoutToken(
            urlEndPoint: Api.forgotPw2,
            data: {'otp_code': otpController.text},
          );

          if (response.statusCode == 200) {
            if (response.data['status'] == 'success') {
              EasyLoading.dismiss();
              AppConstant.showMyToast(response.data['message']);
              stepperAController.next(onTap: (v) {});
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

  Future<void> forgotPw3() async {
    final SharedPreferences p = await SharedPreferences.getInstance();
    var userId = p.getInt('userId');
    print('check_getUserId: $userId');
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');

          var response = await dataProvider.postDataWithoutToken(
            urlEndPoint: Api.forgotPw3,
            data: {
              'user_id': userId,
              'new_password': passwordController.text,
              'new_password_confirmation': confPasswordController.text,
            },
          );

          if (response.statusCode == 200) {
            if (response.data['status'] == 'success') {
              EasyLoading.dismiss();
              AppConstant.showMyToast(response.data['message']);
              Get.back();
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

  startTime(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value =
            "${minutes.toString().padLeft(1, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingSeconds--;
      }
    });
  }

  void _goToPreviousPage() {
    if (activeStepIndex.value == 0) {
      return;
    }
    activeStepIndex.value -= 1;
    scrollController.animateTo(
      0.0,
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }

  void _goToNextPage() {
    if (activeStepIndex.value == 0) {
      return;
    }
    activeStepIndex.value += 1;
    scrollController.animateTo(
      0.0,
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
    );
    update();
  }

  void forgotPIN() async {
    var text = emailController.text;

    Map<String, dynamic> mapData = {
      'grant_type': 'password',
      'client_id': '2',
      'client_secret': '91Ic6ySdBofP5kGGCjjTQSz7JyRSLqozrqYbkdBr',
      'username': emailController.text,
    };

    Dio dio = Dio();
    String url = Api.forgotPass;
    debugPrint('$runtimeType HIT_URL1:-$url');

    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          debugPrint('$runtimeType HIT_URL Data:-$mapData');
          EasyLoading.show(status: 'Loading');

          var response = await dio.post(url, data: mapData);

          debugPrint('$runtimeType HIT_URL:-$url');
          debugPrint('Internet Connected: $runtimeType');
          debugPrint('$runtimeType:->Status Code  ${response.statusCode}');

          if (response.statusCode == 200) {
            var mes = response.data['message'];
            Fluttertoast.showToast(msg: '$mes', toastLength: Toast.LENGTH_LONG);
            // sendOTP();
            // debugPrint('HelloDATA: ${response.data}');
            // var mes = response.data['message'];
            // Get.back();
            // AppConstant.showMySnackbar('Success!', response.data['message']);
          } else {
            var mes = response.data['message'];
            AppConstant.showMySnackbar('Failed!', '$mes');
          }
          EasyLoading.dismiss();
        } else {
          AppConstant.internetConnectionAlertDialog();
          debugPrint('No Internet Connection');
        }
      });
    } on DioException catch (e, l) {
      if (e.response?.statusCode == 401) {
        EasyLoading.dismiss();
        var mes = e.response?.data['message'];
        AppConstant.internetErrorAlert('Error!', '$mes');
      } else if (e.response?.statusCode == 400) {
        EasyLoading.dismiss();
        var mes = e.response?.data['message'];
        AppConstant.internetErrorAlert('Error!', '$mes');
      } else if (e.response?.statusCode == 500) {
        EasyLoading.dismiss();
        var mes = e.response?.data['message'];
        AppConstant.internetErrorAlert(
          'Error!',
          'Server is down\nPlease,Contact Sandhani Support Team',
        );
      } else {
        EasyLoading.dismiss();
        AppConstant.internetErrorAlert('Oops!', 'Somethings went wrong');
        debugPrint('$runtimeType:->Error  $e');
        debugPrint('$runtimeType:->Line  $l');
        debugPrint('${StackTrace.current}:->Line  $l');
      }
    }
  }

  Future<void> sendOTP() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    var access = p.getString('access_token');

    Dio dio = Dio();
    String url = Api.forgotPwSendOtp;
    debugPrint('haj;rejajreire:-> ${emailController.text}');
    Map<String, dynamic> mapData = {
      'otp_carrier': emailController.text,
      "purpose": "forgotpassword",
    };

    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Loading');
          // var v=json.encode(mapData);
          var response = await dio.post(
            url,
            queryParameters: mapData,
            options: Options(headers: {"Authorization": "Bearer $access"}),
          );

          debugPrint("forgot_otp:Url $url");
          debugPrint("forgot_otp_status_code: ${response.statusCode}");
          debugPrint("forgot_otp_data: ${response.data}");
          if (response.statusCode == 200) {
            EasyLoading.dismiss();
            var mes = response.data['message'];
            var suc = response.data['success'];
            if (suc == true) {
              Fluttertoast.showToast(
                msg: '$mes',
                toastLength: Toast.LENGTH_LONG,
              );
              debugPrint('response:-> ${response.data['message']}');
              // Get.back();
              startTime(180);
              // Get.toNamed(ForgetClientIdOTP.routeName);
            } else {
              Fluttertoast.showToast(
                msg: '$mes',
                toastLength: Toast.LENGTH_LONG,
              );
            }
          } else {
            // horizontalProgressIsActive.value=false;
            AppConstant.showMySnackbar(
              'Failed!',
              'Failed to Load Investment summary data',
            );
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
          debugPrint('No Internet Connection');
        }
      });
    } on DioException {
      EasyLoading.dismiss();
      // horizontalProgressIsActive.value=false;
      // dataSubmitSuccess.value=false;
      // debugPrint(l);
      AppConstant.internetErrorAlert('Oops!', 'Somethings went wrong');
    }
  }

  void verifyOtp() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    var access = p.getString('access_token');
    Dio dio = Dio();
    String url = Api.forgotPwVerifyOtp;
    Map<String, dynamic> mapData = {
      "otp_carrier": emailController.text,
      "otp_code": forgotPwOtpTextField.text,
      "purpose": "forgotpassword",
    };

    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Loading');
          var v = json.encode(mapData);
          var response = await dio.post(url, data: mapData);

          debugPrint("Registration-Step:Url $url");
          debugPrint("Registration-Step: ${response.statusCode}");
          debugPrint("Registration-Step: ${response.data}");
          if (response.statusCode == 200) {
            var mes = response.data['message'];
            var suc = response.data['success'];
            EasyLoading.dismiss();
            if (suc == true) {
              Fluttertoast.showToast(
                msg: response.data['message'],
                toastLength: Toast.LENGTH_LONG,
              );
              debugPrint('verify:-> ${response.data['message']}');
              forgotPIN();
              _clear();
              Get.toNamed(LoginPage.routeName);
            } else {
              Fluttertoast.showToast(msg: response.data['message']);
            }
          } else {
            // horizontalProgressIsActive.value=false;
            AppConstant.showMySnackbar(
              'Failed!',
              'Failed to Load Investment summary data',
            );
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
          debugPrint('No Internet Connection');
        }
      });
    } on DioException {
      EasyLoading.dismiss();
      // horizontalProgressIsActive.value=false;
      // dataSubmitSuccess.value=false;
      AppConstant.internetErrorAlert('Oops!', 'Somethings went wrong');
    }
  }

  _clear() {
    emailController.clear();
  }

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return '';
  }
}
