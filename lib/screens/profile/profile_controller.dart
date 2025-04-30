import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';
import '../../datalayer/dataProviders/dio_service.dart';
import 'model/AddressModel.dart';
import 'model/District.dart';
import 'model/Thana.dart';

class ProfileController extends GetxController {
  DioService dataProvider;
  ProfileController(this.dataProvider);

  RxObjectMixin<AddressModel> defaultDis = AddressModel().obs;

  RxObjectMixin<District> selectedDistrict = District().obs;
  RxObjectMixin<Thana> selectedThana = Thana().obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController villageStreetController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController officePhoneController = TextEditingController();
  TextEditingController officeIdController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController nidController = TextEditingController();

  var profileImage = File('').obs;

  Future<void> updateProfile() async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          // Collecting data from the controllers
          var mapData = {
            'fullName': fullNameController.text,
            'companyName': companyNameController.text,
            'villageStreet': villageStreetController.text,
            'mobileNo': mobileNoController.text,
            'officePhone': officePhoneController.text,
            'officeId': officeIdController.text,
            'dob': dobController.text,
            'nid': nidController.text,
            // Optionally, include district and thana data if required
            'district': "${selectedDistrict.value.id ?? 0}",
            'thana': "${selectedThana.value.id ?? 0}",
          };

          EasyLoading.show();
          // Sending the request with the collected data
          var response = await dataProvider.postData(
            urlEndPoint: '/account_details',
            data: mapData,
          );

          if (response.statusCode == 200) {
            if (response.data['message'] == 'success') {
              AppConstant.showMyToast(response.data['message']);
              Get.back();
            } else {
              AppConstant.showMyToast(response.data['message']);
            }
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e, l) {
      print('Error: $e');
      print('Stack trace: $l');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  void getDistict() async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          var response = await dataProvider.postDataForm(
            urlEndPoint: '/account_data_list',
            data: {},
          );

          if (response.statusCode == 200) {
            defaultDis.value = AddressModel.fromJson(response.data);
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e, l) {
      print('Error: $e');
      print('Stack trace: $l');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
