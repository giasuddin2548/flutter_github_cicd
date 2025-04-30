import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../utils/app_constent.dart';
import '../product/models/NetisProductModel.dart';

class LatestDealScreenController extends GetxController {
  DioService dataProvider;
  LatestDealScreenController(this.dataProvider);

  var isLoading = false.obs;

  var allProducts = <NetisProductModel>[].obs;

  void getProduct(context) async {
    String url = '/all_product_list';
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');
          Map<String, dynamic> d = {};
          var response = await dataProvider.postDataForm(
            urlEndPoint: url,
            data: {},
          );
          print("response fdfdsf");
          print(response.statusCode);
          print(response.requestOptions.uri);

          if (response.statusCode == 200) {
            var list = response.data['all_products'] as List;
            print(list);
            allProducts.clear();
            allProducts.addAll(
              list.map((e) => NetisProductModel.fromJson(e)).toList(),
            );
            // _addListWidget(context);
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
