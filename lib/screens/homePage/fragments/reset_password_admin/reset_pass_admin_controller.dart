// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import '../../../../datalayer/dataProviders/dio_service.dart';
// import '../../../../utils/Utils.dart';
// import '../../../../utils/app_constent.dart';
// import '../../../../utils/my_form.dart';
// import 'package:flutter_github_cicd/screens/bo_application/step_models/product_mosels/ProductIst.dart';
// import '../promotinal_admin/model/BlockModel.dart';
// import 'model/AccountModel25.dart';
//
// class ResetPassAdminController extends GetxController
//     with SingleGetTickerProviderMixin {
//   DioService dataProvider;
//   ResetPassAdminController(this.dataProvider);
//
//   var contactNumberTextController = TextEditingController();
//   var emailTextController = TextEditingController();
//   var passwordTextController = TextEditingController();
//   var confirmPasswordTextController = TextEditingController();
//   var fileTextController = TextEditingController();
//
//   var scrollController = ScrollController();
//   var selectedPortpolio = "";
//   var productList = <ProductIst>[].obs;
//   var accountList = <AccountModel25>[].obs;
//   var accountListBlock = <BlockModel>[].obs;
//   RxObjectMixin<AccountModel25> selectedAC = AccountModel25().obs;
//   RxObjectMixin<ProductIst> selectedPro = ProductIst().obs;
//
//   File file = File('');
//   void getAccountName() async {
//     contactNumberTextController.text = "";
//     emailTextController.text = "";
//     confirmPasswordTextController.text = "";
//     passwordTextController.text = "";
//     fileTextController.text = "";
//     productList.clear();
//     accountList.clear();
//     selectedPortpolio = '';
//     selectedPro.value = ProductIst();
//     selectedAC.value = AccountModel25();
//
//     try {
//       await AppConstant.checkInternetConnection().then((value) async {
//         if (value == true) {
//           EasyLoading.show(status: 'Please wait..');
//
//           var response = await dataProvider.getDataWithOutParams(
//             urlEndPoint: '/api/admin/universal/product',
//           );
//
//           if (response.statusCode == 200) {
//             productList.clear();
//             var list = response.data['data'] as List;
//             var temp = list.map((e) => ProductIst.fromJson(e)).toList();
//             productList.addAll(temp);
//             // fundIsActive.value=false;
//           }
//         } else {
//           AppConstant.internetConnectionAlertDialog();
//         }
//       });
//     } catch (e, l) {
//       print('fffffff: $e');
//       print('fffffff: $l');
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }
//
//   void getBankName(String s) async {
//     print(s);
//
//     try {
//       await AppConstant.checkInternetConnection().then((value) async {
//         if (value == true) {
//           EasyLoading.show(status: 'Please wait..');
//
//           var response = await dataProvider.getDataWithOutParams(
//             urlEndPoint: '/api/admin/universal/account/$s',
//           );
//
//           if (response.statusCode == 200) {
//             accountList.clear();
//             var list = response.data['data'] as List;
//             var temp = list.map((e) => AccountModel25.fromJson(e)).toList();
//             accountList.addAll(temp);
//             // fundIsActive.value=false;
//           }
//         } else {
//           AppConstant.internetConnectionAlertDialog();
//         }
//       });
//     } catch (e, l) {
//       print('fffffff: $e');
//       print('fffffff: $l');
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }
//
//   void getBlockedAccount() async {
//     // /admin/account-block
//
//     try {
//       await AppConstant.checkInternetConnection().then((value) async {
//         if (value == true) {
//           EasyLoading.show(status: 'Please wait..');
//
//           var response = await dataProvider.getDataWithOutParams(
//             urlEndPoint: '/api/admin/users/block-user-list',
//           );
//
//           if (response.statusCode == 200) {
//             accountListBlock.clear();
//             var list = response.data['data'] as List;
//             var temp = list.map((e) => BlockModel.fromJson(e)).toList();
//             accountListBlock.addAll(temp);
//             // // fundIsActive.value=false;
//           }
//         } else {
//           AppConstant.internetConnectionAlertDialog();
//         }
//       });
//     } catch (e, l) {
//       print('fffffff: $e');
//       print('fffffff: $l');
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }
//
//   void getAccountDetail(String s) async {
//     try {
//       await AppConstant.checkInternetConnection().then((value) async {
//         if (value == true) {
//           EasyLoading.show(status: 'Please wait..');
//
//           var response = await dataProvider.getDataWithOutParams(
//             urlEndPoint: '/api/admin/universal/account-details/$s',
//           );
//
//           if (response.statusCode == 200) {
//             // accountList.clear();
//             var list = response.data['data'] as List;
//             if (list.isNotEmpty) {
//               contactNumberTextController.text = list[0]['mobile'];
//               emailTextController.text = list[0]['email'];
//               selectedPortpolio = list[0]['portfolio_code'];
//               // emailTextController.text=list[0]['email'];
//             }
//           }
//         } else {
//           AppConstant.internetConnectionAlertDialog();
//         }
//       });
//     } catch (e, l) {
//       print('fffffff: $e');
//       print('fffffff: $l');
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }
//
//   void deleteBlock(BlockModel accountListBlock) async {
//     try {
//       await AppConstant.checkInternetConnection().then((value) async {
//         if (value == true) {
//           EasyLoading.show(status: 'Please wait..');
//
//           Map<String, dynamic> sendData = {
//             "id": accountListBlock.id,
//             "portfolio_code": accountListBlock.portfolioCode,
//           };
//
//           print('Deposit_post_data:- $sendData');
//
//           MyForm.myFromMaker(sendData).then((v) async {
//             var response = await dataProvider.postFormData(
//               urlEndPoint: "/api/admin/users/block-user",
//               data: v,
//             );
//
//             if (response.statusCode == 200) {
//               AppConstant.showMyToast('${response.data['data']}');
//               getBlockedAccount();
//             } else {
//               AppConstant.showMyToast('${response.data['message']}');
//             }
//           });
//         } else {
//           AppConstant.internetConnectionAlertDialog();
//         }
//       });
//     } catch (e, l) {
//       print('fffffff: $e');
//       print('fffffff: $l');
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }
//
//   void postDeposit() async {
//     try {
//       await AppConstant.checkInternetConnection().then((value) async {
//         if (value == true) {
//           Map<String, dynamic> sendData = {
//             "portfolio_code": selectedPortpolio,
//             "password": passwordTextController.text,
//             "password_confirmation": confirmPasswordTextController.text,
//             "email": emailTextController.text,
//             "contact_number": contactNumberTextController.text.replaceAll(
//               "-",
//               '',
//             ),
//           };
//           print('Deposit_post_data:- $sendData');
//           EasyLoading.show(status: 'Please wait..');
//
//           MyForm.myFromMaker(sendData).then((v) async {
//             var response = await dataProvider.postFormData(
//               urlEndPoint: "/api/admin/users/reset-password",
//               data: v,
//             );
//
//             if (response.statusCode == 200) {
//               AppConstant.showMyToast('${response.data['message']}');
//               // print('submitted');
//               // // getDepositList();
//               formClear();
//             } else {
//               AppConstant.showMyToast('${response.data['message']}');
//             }
//           });
//         } else {
//           AppConstant.internetConnectionAlertDialog();
//         }
//       });
//     } catch (e, l) {
//       print('fffffff: $e');
//       print('fffffff: $l');
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }
//
//   void postAccountStatus() async {
//     try {
//       await AppConstant.checkInternetConnection().then((value) async {
//         if (value == true) {
//           Map<String, dynamic> sendData = {
//             "portfolio_code": selectedPortpolio,
//             "email": emailTextController.text,
//             "contact_number": contactNumberTextController.text.replaceAll(
//               '-',
//               '',
//             ),
//             "enabled": passwordTextController.text,
//           };
//
//           print('Deposit_post_data:- $sendData');
//           EasyLoading.show(status: 'Please wait..');
//
//           MyForm.myFromMaker(sendData).then((v) async {
//             var response = await dataProvider.postFormData(
//               urlEndPoint: "/api/admin/users/reset-status",
//               data: v,
//             );
//
//             if (response.statusCode == 200) {
//               AppConstant.showMyToast('${response.data['message']}');
//               // print('submitted');
//               // // getDepositList();
//               formClear();
//             } else {
//               AppConstant.showMyToast('${response.data['message']}');
//             }
//           });
//         } else {
//           AppConstant.internetConnectionAlertDialog();
//         }
//       });
//     } catch (e, l) {
//       print('fffffff: $e');
//       print('fffffff: $l');
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }
//
//   void postBlock() async {
//     try {
//       await AppConstant.checkInternetConnection().then((value) async {
//         if (value == true) {
//           EasyLoading.show(status: 'Please wait..');
//
//           Map<String, dynamic> sendData = {
//             "portfolio_code": selectedAC.value.portfolioCode,
//           };
//
//           print('Deposit_post_data:- $sendData');
//
//           MyForm.myFromMaker(sendData).then((v) async {
//             var response = await dataProvider.postFormData(
//               urlEndPoint: "/api/admin/users/block-user",
//               data: v,
//             );
//
//             if (response.statusCode == 200) {
//               AppConstant.showMyToast('${response.data['data']}');
//               selectedPro.value = ProductIst();
//               selectedAC.value = AccountModel25();
//               getBlockedAccount();
//             } else {
//               AppConstant.showMyToast('${response.data['message']}');
//             }
//           });
//         } else {
//           AppConstant.internetConnectionAlertDialog();
//         }
//       });
//     } catch (e, l) {
//       print('fffffff: $e');
//       print('fffffff: $l');
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }
//
//   void postAcnk() async {
//     try {
//       await AppConstant.checkInternetConnection().then((value) async {
//         if (value == true) {
//           Map<String, dynamic> sendData = {
//             "portfolio_code": selectedPortpolio,
//             "email": emailTextController.text,
//             "contact_number": contactNumberTextController.text.replaceAll(
//               "-",
//               '',
//             ),
//             // "enabled": '0',
//           };
//
//           print('Deposit_post_data:- $sendData');
//           EasyLoading.show(status: 'Please wait..');
//
//           MyForm.myFromMakerWithFileName(
//             sendData,
//             file,
//             "bo_acknowledgement",
//           ).then((v) async {
//             var response = await dataProvider.postFormData(
//               urlEndPoint: "/api/admin/users/bo-acknowledgement",
//               data: v,
//             );
//
//             if (response.statusCode == 200) {
//               AppConstant.showMyToast('${response.data['message']}');
//               // print('submitted');
//               // // getDepositList();
//               formClear();
//             } else {
//               AppConstant.showMyToast('${response.data['message']}');
//             }
//           });
//         } else {
//           AppConstant.internetConnectionAlertDialog();
//         }
//       });
//     } catch (e, l) {
//       print('fffffff: $e');
//       print('fffffff: $l');
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }
//
//   formClear() {
//     contactNumberTextController.text = "";
//     emailTextController.text = "";
//     confirmPasswordTextController.text = "";
//     passwordTextController.text = "";
//     fileTextController.text = "";
//   }
//
//   void openFilePicker() async {
//     await Utils.storagePermission().then((permission) async {
//       try {
//         FilePickerResult? result = await FilePicker.platform.pickFiles(
//           dialogTitle: 'Select a file',
//         );
//
//         if (result != null) {
//           file = File('${result.files.single.path}');
//           debugPrint(file.path);
//           debugPrint(file.parent.toString());
//           debugPrint(file.absolute.toString());
//
//           String fileName = file.path.split('/').last;
//           fileTextController.text = fileName;
//
//           debugPrint('My File Name is $fileName');
//           Fluttertoast.showToast(msg: 'File Selection successful');
//         } else {
//           // User canceled the picker
//         }
//       } catch (e, l) {
//         Fluttertoast.showToast(msg: 'File Selection Failed!');
//         debugPrint('File Upload failed$e');
//         debugPrint('File Upload failed$l');
//       }
//     });
//   }
// }
