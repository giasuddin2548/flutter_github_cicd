import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../utils/api.dart';
import '../../../../utils/app_constent.dart';
import '../dashboard/NetisModel/DashboardModel.dart';
import 'model/PaymentModel.dart';

class PaymentsScreenController extends GetxController {
  final DioService dataProvider;
  PaymentsScreenController(this.dataProvider);

  var paymentOptionList = <PaymentModel>[].obs;

  RxObjectMixin<DashboardModel> dashboardData = DashboardModel().obs;
  void fetchWalletData(context) async {
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

  void getPaymentOption(BuildContext context) async {
    String url = "/get_payment_methods";
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
            var list = response.data['payment_methods'] as List;
            print(list);
            paymentOptionList.clear();
            paymentOptionList.addAll(
              list.map((e) => PaymentModel.fromJson(e)).toList(),
            );
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
    var formatted = s.replaceAll(
      "/web/image/payment.method.configuration/b'",
      "",
    );
    var formatted2 = formatted.replaceAll("'/image_128", "");

    Uint8List bytes = const Base64Decoder().convert(formatted2);

    return bytes;
  }
}
