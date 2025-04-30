import 'dart:io';
import 'package:flutter_github_cicd/screens/homePage/fragments/reset_password_admin/model/AccountModel25.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../utils/Utils.dart';
import '../../../../utils/app_constent.dart';
import '../../../../utils/my_form.dart';
import 'model/PromotionalModel.dart';

class PromotinalController extends GetxController
    with SingleGetTickerProviderMixin {
  DioService dataProvider;
  PromotinalController(this.dataProvider);

  var depositPageKey = GlobalKey<FormState>();

  var selectedNewsTypeController = TextEditingController();
  var selectedDashboardTypeController = TextEditingController();
  var selectedStartDateTextController = TextEditingController();
  var selectedEndDateTextController = TextEditingController();
  var subjectTextController = TextEditingController();
  var bodyTextController = TextEditingController();
  var fileTextController = TextEditingController();

  var scrollController = ScrollController();
  var selectedPortpolio = "";
  var promotianlList = <PromotionalModel>[].obs;
  var accountList = <AccountModel25>[].obs;
  File file = File('');

  var promotinalActionType = "".obs;
  var promotinalActionTypeValue = "";
  void getAccountName() async {
    // contactNumberTextController.text="";
    // emailTextController.text="";
    // confirmPasswordTextController.text="";
    // passwordTextController.text="";
    // fileTextController.text="";
    promotianlList.clear();
    // accountList.clear();
    // selectedPortpolio='';

    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');

          var response = await dataProvider.getDataWithOutParams(
            urlEndPoint: '/api/admin/promotional/news-list',
          );

          if (response.statusCode == 200) {
            promotianlList.clear();
            var list = response.data['data'] as List;
            var temp = list.map((e) => PromotionalModel.fromJson(e)).toList();
            promotianlList.addAll(temp);
            // fundIsActive.value=false;
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

  void getBankName(String s) async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');

          var response = await dataProvider.getDataWithOutParams(
            urlEndPoint: '/api/admin/universal/account/$s',
          );

          if (response.statusCode == 200) {
            accountList.clear();
            var list = response.data['data'] as List;
            var temp = list.map((e) => AccountModel25.fromJson(e)).toList();
            accountList.addAll(temp);
            // fundIsActive.value=false;
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

  void postDeposit() async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          Map<String, String> newsData = {};
          var url = "";

          if (promotinalActionType.value == "Add Promotional News") {
            newsData = {
              "news_type": selectedNewsTypeController.text,
              "dashboard": selectedDashboardTypeController.text,
              "subject": subjectTextController.text,
              "body_details": bodyTextController.text,
              "start_date": selectedStartDateTextController.text,
              "end_date": selectedEndDateTextController.text,
            };
            url = "/api/admin/promotional/news-save";
          } else {
            newsData = {
              'id': promotinalActionTypeValue,
              "news_type": selectedNewsTypeController.text,
              "dashboard": selectedDashboardTypeController.text,
              "subject": subjectTextController.text,
              "body_details": bodyTextController.text,
              "start_date": selectedStartDateTextController.text,
              "end_date": selectedEndDateTextController.text,
            };
            url = "/api/admin/promotional/news-update";
          }

          print('Deposit_post_data:- $newsData');
          EasyLoading.show(status: 'Please wait..');
          MyForm.myFromMakerWithFileName(
            newsData,
            file,
            'upload_attachment',
          ).then((result) async {
            var response = await dataProvider.postFormData(
              urlEndPoint: url,
              data: result,
            );

            if (response.statusCode == 200) {
              AppConstant.showMyToast('${response.data['data']}');
              getAccountName();
              formClear();
            } else {
              AppConstant.showMyToast('${response.data['message']}');
            }
          });
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e, l) {
      print('fffffff: $e');
      print('fffffff: $l');
    } finally {
      Get.back();
      EasyLoading.dismiss();
    }
  }

  void formClear() {
    selectedNewsTypeController.clear();
    selectedDashboardTypeController.clear();
    selectedStartDateTextController.clear();
    selectedEndDateTextController.clear();
    subjectTextController.clear();
    bodyTextController.clear();
    fileTextController.clear();
    file = File('');
  }

  void openFilePicker() async {
    await Utils.storagePermission().then((permission) async {
      try {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          dialogTitle: 'Select a file',
        );

        if (result != null) {
          file = File('${result.files.single.path}');
          debugPrint(file.path);
          debugPrint(file.parent.toString());
          debugPrint(file.absolute.toString());

          String fileName = file.path.split('/').last;
          fileTextController.text = fileName;

          debugPrint('My File Name is $fileName');
          Fluttertoast.showToast(msg: 'File Selection successful');
        } else {
          // User canceled the picker
        }
      } catch (e, l) {
        Fluttertoast.showToast(msg: 'File Selection Failed!');
        debugPrint('File Upload failed$e');
        debugPrint('File Upload failed$l');
      }
    });
  }

  void deleteItem(PromotionalModel promotianlList) async {
    print(promotianlList.dashboard);

    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          Map<String, dynamic> sendData = {"id": promotianlList.id ?? ''};
          print('Deposit_post_data:- $sendData');
          EasyLoading.show(status: 'Please wait..');

          var response = await dataProvider.postData(
            urlEndPoint: "/api/admin/promotional/news-update",
            data: sendData,
          );

          if (response.statusCode == 200) {
            AppConstant.showMyToast('${response.data['data']}');
          } else {
            AppConstant.showMyToast('${response.data['message']}');
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e) {
      print('fffffff: $e');
    } finally {
      Get.back();
      getAccountName();
      EasyLoading.dismiss();
    }
  }

  void makeItDefault() {
    formClear();
  }
}
