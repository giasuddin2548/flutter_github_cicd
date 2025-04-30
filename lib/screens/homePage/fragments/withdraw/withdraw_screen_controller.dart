import 'package:flutter_github_cicd/screens/homePage/fragments/withdraw/model/WithdrawList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../utils/api.dart';
import '../../../../utils/app_constent.dart';

class WithdrawScreenController extends GetxController {
  DioService dataProvider;
  WithdrawScreenController(this.dataProvider);

  var withdrawPageKey = GlobalKey<FormState>();

  var investorNameTextController = TextEditingController();
  var productNameTextController = TextEditingController();
  var portfolioCodeTextController = TextEditingController();
  var withdrawDateTextController = TextEditingController();
  var availableBalanceTextController = TextEditingController();
  var withdrawAmountTextController = TextEditingController();
  var scrollController = ScrollController();

  var withdrawList = <WithdrawList>[].obs;

  void getWithdrawList() async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');

          var response = await dataProvider.getDataWithOutParams(
            urlEndPoint: Api.withdrawList,
          );

          if (response.statusCode == 200) {
            withdrawList.clear();
            var list = response.data['withdraw_list'] as List;
            // list.insert(0, AccountList(accountName: 'Select',accountDetailsId: 0));
            var temp = list.map((e) => WithdrawList.fromJson(e)).toList();
            withdrawList.addAll(temp);
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

  void getBalance() async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');

          var response = await dataProvider.getDataWithOutParams(
            urlEndPoint: Api.availableBalance,
          );

          if (response.statusCode == 200) {
            availableBalanceTextController.text =
                response.data['available_balance'];
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

  void postWithdraw() async {
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');

          var response = await dataProvider.postData(
            urlEndPoint: Api.withdrawSubmit,
            data: {'withdraw_amount': withdrawAmountTextController.text},
          );

          if (response.statusCode == 200) {
            AppConstant.showMyToast(response.data['message']);
            withdrawAmountTextController.clear();
            getWithdrawList();
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
}
