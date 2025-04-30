import 'dart:io';
import 'package:flutter_github_cicd/utils/my_form.dart';
import 'package:flutter_github_cicd/utils/Utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../datalayer/models/ActivityModel.dart';
import '../../../../datalayer/models/BankDataModel.dart';
import '../../../../datalayer/models/BranchDataModel.dart';
import '../../../../datalayer/models/UserProfileData.dart';
import '../../../../utils/api.dart';
import '../../../../utils/app_constent.dart';

import 'model/update_profile_basic_data.dart';

class UpdateProfileController extends GetxController {
  DioService dataProvider;
  UpdateProfileController(this.dataProvider);
  var scrollController = ScrollController();
  var ipoKey = GlobalKey<FormState>();
  RxObjectMixin<UserProfileData> profileData = UserProfileData().obs;

  var investorNameTextField = TextEditingController();
  var investorNameTextFieldActive = false.obs;
  var mailingAddressTextField = TextEditingController();
  var mailingAddressTextFieldActive = false.obs;
  var tinTextField = TextEditingController();
  var tinTextFieldActive = false.obs;
  var nidTextField = TextEditingController();
  var nidTextFieldActive = false.obs;
  var bankIDTextField = TextEditingController();
  var bankIDTextFieldActive = false.obs;
  var branchIDTextField = TextEditingController();
  var branchIDTextFieldActive = false.obs;
  var accountNoTextField = TextEditingController();
  var accountNoTextFieldActive = false.obs;
  var boAccountNoTextField = TextEditingController();
  var fileSelectionController = TextEditingController();
  var boAccountNoTextFieldActive = false.obs;
  var isSubmitShow = false.obs;
  var bankInfoActive = false.obs;
  var branchInfoActive = false.obs;
  var accountInfoActive = false.obs;
  var bankStatementInfoActive = false.obs;
  var fileChange = File("");
  var isBankListAdded = true.obs;
  var isBranchListAdded = true.obs;
  RxObjectMixin<UpdateProfileBasicData> updateProfileBasicData =
      UpdateProfileBasicData().obs;
  RxObjectMixin<BranchDataModel> branchDefaultData = BranchDataModel().obs;
  var bankList = <BankDataModel>[].obs;
  var branchList = <BranchDataModel>[].obs;
  var activityList = <ActivityModel>[].obs;
  void getProfileData() async {
    branchDefaultData.value = BranchDataModel(
      branchName: "Select Bank Name",
      branchId: "1",
    );
    String url = Api.getProfileData;
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');
          Map<String, dynamic> d = {};
          var response = await dataProvider.getDataWithParams(
            urlEndPoint: url,
            data: d,
          );
          if (response.statusCode == 200) {
            profileData.value = UserProfileData.fromJson(
              response.data['investor'],
            );
            investorNameTextField.text = profileData.value.investorName ?? '';
            mailingAddressTextField.text =
                profileData.value.mailingAddress ?? '';
            nidTextField.text = profileData.value.mobile ?? '';
            tinTextField.text = profileData.value.email ?? '';
            boAccountNoTextField.text = profileData.value.boAccountNo ?? '';
            accountNoTextField.text = profileData.value.bankAccountNo ?? '';
            branchDefaultData.value = BranchDataModel(
              branchName: "${profileData.value.branchName ?? ''}",
              branchId: "${profileData.value.branchId ?? ''}",
            );
            branchIDTextField.text = "${profileData.value.branchId ?? ''}";
            bankIDTextField.text = "${profileData.value.bankId ?? ''}";
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e) {
    } finally {
      getBankName();
      EasyLoading.dismiss();
    }
  }

  void submit() async {
    String url = Api.submitProfileData;
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');
          Map<String, dynamic> d = {
            'name': investorNameTextField.text,
            'mailing_address': mailingAddressTextField.text,
            'email_address': tinTextField.text,
            'mobile_no': nidTextField.text,
            'bo_account_no': boAccountNoTextField.text,
            'bank_id': bankIDTextField.text,
            'branch_id': branchIDTextField.text,
            'bank_account_no': accountNoTextField.text,
          };

          if (investorNameTextField.text ==
              "${profileData.value.investorName}") {
            d['change_field[0]'] = "";
          } else {
            d['change_field[0]'] = "checked";
          }

          if (mailingAddressTextField.text ==
              "${profileData.value.mailingAddress}") {
            d['change_field[1]'] = "";
          } else {
            d['change_field[1]'] = "checked";
          }

          if (tinTextField.text == "${profileData.value.email}") {
            d['change_field[2]'] = "";
          } else {
            d['change_field[2]'] = "checked";
          }

          if (nidTextField.text == "${profileData.value.mobile}") {
            d['change_field[3]'] = "";
          } else {
            d['change_field[3]'] = "checked";
          }
          if (boAccountNoTextField.text == "${profileData.value.boAccountNo}") {
            d['change_field[4]'] = "";
          } else {
            d['change_field[4]'] = "checked";
          }

          if (bankIDTextField.text == "${profileData.value.bankId}") {
            d['change_field[5]'] = "";
          } else {
            d['change_field[5]'] = "checked";
          }

          if (branchIDTextField.text == "${profileData.value.branchId}") {
            d['change_field[6]'] = "";
          } else {
            d['change_field[6]'] = "checked";
          }

          if (fileChange.path == "") {
            d['change_field[8]'] = "";
          } else {
            d['change_field[8]'] = "checked";
          }

          if (fileChange.path == "") {
            print('postData');
            MyForm.myFromMaker(d).then((valueConverted) async {
              var response = await dataProvider.postFormData(
                urlEndPoint: url,
                data: valueConverted,
              );
              print(response.data);
              if (response.statusCode == 200) {
                var dd = response.data['message'];
                Utils.showCustomFlutterToast(dd);
                fileChange = File('');
                bankIDTextField.text = "";
                branchIDTextField.text = "";
                fileSelectionController.text = "";
              }
            });
          } else {
            print('postFormDataMain');
            var response = await dataProvider.postFormDataMain(
              urlEndPoint: url,
              data: d,
              file: fileChange,
              fileName: 'bank_leaf',
            );
            print(response.data);
            if (response.statusCode == 200) {
              var dd = response.data['message'];
              Utils.showCustomFlutterToast(dd);
              fileChange = File('');
              bankIDTextField.text = "";
              branchIDTextField.text = "";
              fileSelectionController.text = "";
            }
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e) {
    } finally {
      EasyLoading.dismiss();
    }
  }

  void chooseFile() async {
    try {
      var status = await storagePermission();

      if (status) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          dialogTitle: 'Select a file',
          type: FileType.image,
        );

        if (result != null) {
          File tempFile = File('${result.files.single.path}');

          int sizeInBytes = tempFile.lengthSync();
          double sizeInMb = sizeInBytes / (1024 * 1024);
          print('Selected file: $sizeInMb');

          if (sizeInMb <= 2) {
            String fileName = tempFile.path.split('/').last;
            fileChange = tempFile;
            fileSelectionController.text = fileName;
          } else {
            Fluttertoast.showToast(msg: 'Image size not more than 2 MB');
          }
        } else {
          // User canceled the picker
        }
      } else {
        print('Permission denied');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'File Selection Failed!');
      print('File Upload failed$e');
    }
  }

  Future<bool> storagePermission() async {
    final DeviceInfoPlugin info =
        DeviceInfoPlugin(); // import 'package:device_info_plus/device_info_plus.dart';

    bool havePermission = false;

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await info.androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        final request =
            await [
              Permission.photos,
              //..... as needed
            ].request(); //import 'package:permission_handler/permission_handler.dart';

        havePermission = request.values.every(
          (status) => status == PermissionStatus.granted,
        );
      } else {
        final status = await Permission.storage.request();
        havePermission = status.isGranted;
      }

      if (!havePermission) {
        // if no permission then open app-setting
        await openAppSettings();
      }

      return havePermission;
    } else if (Platform.isIOS) {
      final status = await Permission.storage.request();
      if (status.isGranted) {
        havePermission = status.isGranted;
      }
    }

    return havePermission;
  }

  void getBankName() async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          // EasyLoading.show(status: 'Please wait..');

          var response = await dataProvider.getDataWithOutParams(
            urlEndPoint: '/api/bank-list',
          );
          bankList.clear();
          if (response.statusCode == 200) {
            var list = response.data['bank_list'] as List;
            var temp = list.map((e) => BankDataModel.fromJson(e)).toList();
            bankList.addAll(temp);
            isBankListAdded.value = false;
            isBranchListAdded.value = false;
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e, l) {
      print('fffffff: $e');
      print('fffffff: $l');
    } finally {
      // EasyLoading.dismiss();
      //  selectBranchName();
    }
  }

  void selectBranchName() async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          // EasyLoading.show(status: 'Please wait..');

          var response = await dataProvider.getDataWithParams(
            urlEndPoint: '/api/branch-list',
            data: {"bank_id": bankIDTextField.text},
          );

          if (response.statusCode == 200) {
            // branchList.clear();
            // branchList.add(BranchDataModel(branchName: "${profileData.value.branchName}", branchId: "${profileData.value.branchId}", routingNo: "0"));
            var list = response.data['branch_list'] as List;
            // list.insert(0, AccountList(accountName: 'Select',accountDetailsId: 0));
            var temp = list.map((e) => BranchDataModel.fromJson(e)).toList();
            branchList.addAll(temp);
            isBranchListAdded.value = false;
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e, l) {
      print('fffffff: $e');
      print('fffffff: $l');
    } finally {
      // EasyLoading.dismiss();
    }
  }

  BankDataModel getDefaultBankItem() {
    var k = BankDataModel(orgName: "Select Bank Name", orgId: -1);
    for (var element in bankList) {
      var id = element.orgId;
      var myId = profileData.value.bankId ?? -1;

      if (id == myId) {
        k = element;
        break;
      }
    }

    return k;
  }

  void showSubmitButton() {
    //print("showSubmitButton called: isSubmitShow = ${isSubmitShow.value}");
    // if(investorNameTextFieldActive.value==true || mobileTextFieldActive.value==true || emailIDTextFieldActive.value==true || mailingAddressTextFieldActive.value==true || boAccountNoTextFieldActive.value==true || bankInfoActive.value==true){
    //   isSubmitShow.value=true;
    // }else{
    //   isSubmitShow.value=false;
    // }

    if (investorNameTextFieldActive.value) {
      isSubmitShow.value = true;
    } else if (nidTextFieldActive.value) {
      isSubmitShow.value = true;
    } else if (tinTextFieldActive.value) {
      isSubmitShow.value = true;
    } else if (mailingAddressTextFieldActive.value) {
      isSubmitShow.value = true;
    } else if (boAccountNoTextFieldActive.value) {
      isSubmitShow.value = true;
    } else if (bankInfoActive.value) {
      isSubmitShow.value = true;
    } else {
      isSubmitShow.value = false;
    }

    //print("showSubmitButton called: isSubmitShow = ${isSubmitShow.value}");
  }

  void getTabActivities() async {
    String url = Api.investor_activity_log;
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');
          Map<String, dynamic> d = {};
          var response = await dataProvider.getDataWithParams(
            urlEndPoint: url,
            data: d,
          );
          if (response.statusCode == 200) {
            var ddd = response.data['activity_info'] as List;
            activityList.clear();
            var lll = ddd.map((e) => ActivityModel.fromJson(e)).toList();
            activityList.addAll(lll);
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e) {
    } finally {
      EasyLoading.dismiss();
    }
  }

  void getTabProfile() async {
    String url = Api.getPersonalInfo;
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');
          Map<String, dynamic> d = {};
          var response = await dataProvider.getDataWithParams(
            urlEndPoint: url,
            data: d,
          );
          if (response.statusCode == 200) {
            profileData.value = UserProfileData.fromJson(
              response.data['investor'],
            );
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e) {
    } finally {
      EasyLoading.dismiss();
    }
  }
}
