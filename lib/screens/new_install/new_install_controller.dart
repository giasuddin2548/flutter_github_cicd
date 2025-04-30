import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/screens/new_install/success_screen.dart';
import 'package:flutter_github_cicd/utils/Utils.dart';

import '../../datalayer/dataProviders/dio_service.dart';
import '../../utils/api.dart';
import '../../utils/app_constent.dart';
import '../../utils/secure_service.dart';
import 'claim_new_screen.dart';

class NewInstallController extends GetxController {
  DioService dataProvider;
  NewInstallController(this.dataProvider);

  var claimProductMessage = "".obs;
  var claimProductProduct_model = "".obs;

  final TextEditingController modelNameController = TextEditingController();
  final TextEditingController serialNumberController = TextEditingController();
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController clientAddressController = TextEditingController();
  final TextEditingController clientContactController = TextEditingController();
  final TextEditingController installationDateController =
      TextEditingController();

  void claimProduct(String code, context) async {
    String url = Api.claimUrl;
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');
          Map<String, dynamic> d = {"product_serial": code};
          var response = await dataProvider.getDataWithParams(
            urlEndPoint: url,
            data: d,
          );
          print(response.statusCode);
          print(response.requestOptions.uri);
          if (response.statusCode == 200) {
            Utils.showCustomFlutterToast(response.data['message']);
            claimProductMessage.value = response.data['message'];
            claimProductProduct_model.value = response.data['product_model'];
            await SecureService().setStringSessionData(
              myValue: claimProductProduct_model.value,
              myKey: AppConstant.claimProductProduct_model,
            );
            await SecureService().setStringSessionData(
              myValue: code,
              myKey: AppConstant.serialNo,
            );
            print(claimProductMessage.value);
            if (claimProductMessage.value == "Product Found!") {
              Get.toNamed(ClaimNewScreen.routeName);
            }
          } else {
            claimProductMessage.value = response.data['message'];
            Utils.showCustomFlutterToast(response.data['message']);
          }
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

  void claimNewProduct() async {
    String url = Api.newInstall;
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');
          Map<String, dynamic> d = {
            "product_serial": serialNumberController.text,
            "product_model": modelNameController.text,
            "client_name": clientNameController.text,
            "client_address": clientAddressController.text,
            "client_contact": clientContactController.text,
            "installation_date": installationDateController.text,
            "installation_image":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5m5YjEsicsbD_2y3hTygfKShXqdmD7E4wAw%26s",
          };
          print("claimData $d");
          var response = await dataProvider.getDataWithParams(
            urlEndPoint: url,
            data: d,
          );

          print(response.statusCode);
          print(response.requestOptions.uri);
          print(response.data);

          if (response.statusCode == 200) {
            Utils.showCustomFlutterToast(response.data['message']);
            if (response.data['message'] == "Record Created!") {
              Get.offAll(() => SuccessScreen());
            }
          } else {
            Utils.showCustomFlutterToast(response.data['message']);
            claimProductMessage.value = response.data['message'];
          }
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

  void getDefaultData() async {
    modelNameController.text = await SecureService().getStringSessionData(
      AppConstant.claimProductProduct_model,
    );
    serialNumberController.text = await SecureService().getStringSessionData(
      AppConstant.serialNo,
    );
  }
}
