import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../datalayer/models/ComplainDataModel.dart';
import '../../../../utils/Utils.dart';
import '../../../../utils/api.dart';
import '../../../../utils/app_constent.dart';
import '../../../../utils/my_form.dart';

class ComplainController extends GetxController {
  DioService dataProvider;
  ComplainController(this.dataProvider);
  var ipoKey = GlobalKey<FormState>();

  var complainTextController = TextEditingController();

  var scrollController = ScrollController();

  var recentIPo = <ComplainDataModel>[].obs;

  var fileTextField = TextEditingController();
  File file = File('');

  // static const String complainGet='${baseUrl}/api/complain-list';
  // static const String complainSubmit='${baseUrl}/api/complain-submit';
  void getRecentData() async {
    String url = Api.complainGet;
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          // EasyLoading.show(status: 'Please wait..');
          Map<String, dynamic> d = {};
          var response = await dataProvider.getDataWithParams(
            urlEndPoint: url,
            data: d,
          );
          if (response.statusCode == 200) {
            recentIPo.clear();
            var d = response.data['complain_list'] as List;
            var rr = d.map((e) => ComplainDataModel.fromJson(e)).toList();
            recentIPo.addAll(rr);
          }
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e) {
    } finally {
      // EasyLoading.dismiss();
    }
  }

  void submit() async {
    String url = Api.complainSubmit;
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          Map<String, dynamic> d = {"message": complainTextController.text};
          EasyLoading.show();

          MyForm.myFromMakerWithFileName(d, file, "file").then((result) async {
            var response = await dataProvider.postFormData(
              urlEndPoint: url,
              data: result,
            );

            if (response.statusCode == 200) {
              var ddd = response.data['message'];
              Utils.showCustomFlutterToast(ddd);
              complainTextController.text = "";
            }
          });
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e) {
    } finally {
      EasyLoading.dismiss();
      getRecentData();
    }
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
          fileTextField.text = fileName;

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
}
