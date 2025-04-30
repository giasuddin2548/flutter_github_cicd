import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/utils/api.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';
import 'NetisModel/DashboardModel.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  DioService dataProvider;
  DashboardController(this.dataProvider);
  var scrollController = ScrollController();

  RxObjectMixin<DashboardModel> dashboardData = DashboardModel().obs;

  var isAnimated = false.obs;
  var isBallanceShown = false.obs;
  var isBallance = true.obs;
  void changeState() async {
    isAnimated.value = true;
    isBallance.value = false;

    await Future.delayed(const Duration(milliseconds: 800), () {
      isBallanceShown.value = true;
    });

    await Future.delayed(const Duration(seconds: 3), () {
      isBallanceShown.value = false;
    });

    await Future.delayed(const Duration(milliseconds: 200), () {
      isAnimated.value = false;
    });

    await Future.delayed(const Duration(milliseconds: 800), () {
      isBallance.value = true;
    });
  }

  void getProfileData(context) async {
    String url = Api.dashboard_data;
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');
          Map<String, dynamic> d = {};
          var response = await dataProvider.postDataForm(
            urlEndPoint: url,
            data: {},
          );
          print(response.statusCode);
          print(response.requestOptions.uri);
          if (response.statusCode == 200) {
            dashboardData.value = DashboardModel.fromJson(response.data);

            //  var list = response.data as List;
            //  homeList.clear();
            //  homeList.addAll(list.map((e)=>DashboardModel.fromJson(e)).toList());
            // // _addListWidget(context);
          }
          print(response.statusCode);
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e, l) {
      print('Dashboard_api_error: $e');
      print('Dashboard_api_error_l: $l');
    } finally {
      EasyLoading.dismiss();
    }
  }

  Uint8List imageConvertor(String s) {
    Uint8List bytes = const Base64Decoder().convert(s);

    return bytes;
  }
}
