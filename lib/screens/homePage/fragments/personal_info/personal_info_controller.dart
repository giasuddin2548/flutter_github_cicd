import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../datalayer/models/personal/AcnkDataModel.dart';

class PersonalInfoController extends GetxController
    with SingleGetTickerProviderMixin {
  DioService dataProvider;
  PersonalInfoController(this.dataProvider);
  var scrollController = ScrollController();
  RxObjectMixin<AcnkDataModel> profileData = AcnkDataModel().obs;
  void getProfileData() async {
    String url = "/api/acknowledgement-slip";
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
            profileData.value = AcnkDataModel.fromJson(response.data);
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } finally {
      EasyLoading.dismiss();
    }
  }
}
