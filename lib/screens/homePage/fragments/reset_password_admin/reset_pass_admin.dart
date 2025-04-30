// import 'package:flutter_github_cicd/utils/Utils.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_github_cicd/common_wigets/form_header.dart';
// import 'package:flutter_github_cicd/common_wigets/my_text_field.dart';
// import '../../../../datalayer/dataProviders/dio_interceptor.dart';
// import '../../../../datalayer/dataProviders/dio_service.dart';
// import 'package:flutter_github_cicd/screens/bo_application/step_models/product_mosels/ProductIst.dart';
// import 'model/AccountModel25.dart';
// import 'reset_pass_admin_controller.dart';
//
// class ResetPasswordAdmin extends StatelessWidget {
//   static const routeName = '/reset_pass_admin';
//   final ResetPassAdminController _controller = Get.put(
//     ResetPassAdminController(DioService(dioInterceptor: DioInterceptor())),
//   );
//   var depositPageKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     _controller.getAccountName();
//     // _controller.getBankName();
//     // _controller.getDepositList();
//     return Container(
//       // alignment: Alignment.centerRight,
//       margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
//       // decoration: BoxDecoration(
//       //     color: Theme.of(context).cardColor,
//       //     borderRadius: const BorderRadius.all(Radius.circular(10))),
//       width: Get.width,
//       height: Get.height,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).cardColor,
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               width: Get.size.width,
//               // margin: const EdgeInsets.only(top: 10, bottom: 20),
//               // padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
//               child: Form(
//                 key: depositPageKey,
//                 child: Column(
//                   // mainAxisAlignment: MainAxisAlignment.center,
//                   // crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     SizedBox(height: 20),
//                     // AppConstant.timerMarketPlace(context),
//                     Container(
//                       margin: const EdgeInsets.only(left: 10, right: 10),
//                       alignment: Alignment.center,
//                       height: 60,
//                       // color: Colors.yellow,
//                       child: Text(
//                         "Password Reset".toUpperCase(),
//                         style: TextStyle(
//                           color: Theme.of(context).hintColor,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
//                     FormHeader(title: 'Product Name', required: true),
//                     _selectAccountList(context),
//                     FormHeader(title: 'Portfolio Code', required: true),
//                     _selectBankName(context),
//
//                     // FormHeader(title: 'Instrument Date', required: true),
//                     // InkWell(
//                     //     onTap: (){
//                     //
//                     //       Get.bottomSheet(DatePickerBottomSheet(title: 'Select a date',editingController: _controller.dateDepositInstrumentTextController,));
//                     //
//                     //     },
//                     //     child: MyTextField(isRequired: true,inputType: TextInputType.text,editingController: _controller.dateDepositInstrumentTextController, enableOrDisable: false, hints: 'dd/mm/yyyy', errorMessage: 'Please fill in this field.')),
//                     FormHeader(title: 'Contact Number', required: true),
//                     MyTextField(
//                       isRequired: true,
//                       editingController:
//                           _controller.contactNumberTextController,
//                       enableOrDisable: false,
//                       hints: '01811 913041',
//                       errorMessage: 'Please fill in this field.',
//                       inputType: TextInputType.text,
//                     ),
//
//                     FormHeader(title: 'Email', required: true),
//                     MyTextField(
//                       isRequired: true,
//                       editingController: _controller.emailTextController,
//                       enableOrDisable: false,
//                       hints: 'email',
//                       errorMessage: 'Please fill in this field.',
//                       inputType: TextInputType.text,
//                     ),
//
//                     FormHeader(title: 'Password', required: true),
//                     MyTextField(
//                       isRequired: true,
//                       editingController: _controller.passwordTextController,
//                       enableOrDisable: true,
//                       hints: 'Password',
//                       errorMessage: 'Please fill in this field.',
//                       inputType: TextInputType.text,
//                     ),
//
//                     FormHeader(title: 'Confirm Password', required: true),
//                     MyTextField(
//                       isRequired: true,
//                       editingController:
//                           _controller.confirmPasswordTextController,
//                       enableOrDisable: true,
//                       hints: 'confirm password',
//                       errorMessage: 'Please fill in this field.',
//                       inputType: TextInputType.text,
//                     ),
//
//                     // FormHeader(title: 'Deposit Slip', required: true),
//                     // InkWell(
//                     //   onTap: (){
//                     //     _controller.openFilePicker();
//                     //   },
//                     //     child: MyTextField(isRequired: true,editingController: _controller.fileTextField, enableOrDisable: false, hints: 'Choose file', errorMessage: 'Please select a file.', inputType: TextInputType.text,),
//                     // ),
//                     Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
//                     SizedBox(height: 10),
//                     Utils.globalButton(
//                       context,
//                       "Submit",
//                       () {
//                         if (depositPageKey.currentState!.validate()) {
//                           _controller.postDeposit();
//                         }
//                       },
//                       Get.width / 2,
//                       40,
//                     ),
//                     // Container(
//                     //   margin: const EdgeInsets.only(left: 10),
//                     //   alignment: Alignment.center,
//                     //   height: 20,
//                     // ),
//                     SizedBox(height: 20),
//
//                     // //
//                     // Container(height: 3,color: Colors.grey.withOpacity(0.1),),
//                     // _tableData(context),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             // _tableData(context),
//             SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _selectBankName(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 10, right: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//         border: Border.all(
//           color: Colors.grey.withOpacity(0.3), // Border color
//           width: 1.0, // Border width
//         ),
//       ),
//       constraints: const BoxConstraints(minHeight: 50),
//
//       child: Obx(
//         () => Stack(
//           alignment: Alignment.centerLeft,
//           children: [
//             SizedBox(
//               width: Get.width,
//               child: Text(
//                 _controller.selectedAC.value.investorName ??
//                     'Select a portfolio code',
//                 style: const TextStyle(fontSize: 15),
//               ),
//             ),
//             DropdownButtonHideUnderline(
//               child: DropdownButton<AccountModel25>(
//                 isExpanded: true,
//                 onChanged: (AccountModel25? v) {
//                   _controller.selectedAC.value = v!;
//                   _controller.getAccountDetail("${v.investorDetailsId ?? ''}");
//                 },
//                 items:
//                     _controller.accountList.map((AccountModel25 e) {
//                       return DropdownMenuItem<AccountModel25>(
//                         value: e,
//                         child: Text(e.investorName.toString()),
//                       );
//                     }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _selectAccountList(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 10, right: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//         border: Border.all(
//           color: Colors.grey.withOpacity(0.3), // Border color
//           width: 1.0, // Border width
//         ),
//       ),
//       constraints: const BoxConstraints(minHeight: 50),
//
//       child: Obx(
//         () => Stack(
//           alignment: Alignment.centerLeft,
//           children: [
//             SizedBox(
//               width: Get.width,
//               child: Text(
//                 _controller.selectedPro.value.productName ??
//                     'Select Product Name',
//                 style: const TextStyle(fontSize: 15),
//               ),
//             ),
//             DropdownButtonHideUnderline(
//               child: DropdownButton<ProductIst>(
//                 isExpanded: true,
//                 onChanged: (ProductIst? v) {
//                   _controller.selectedPro.value = v!;
//                   _controller.getBankName("${v.templateId ?? ''}");
//                 },
//                 items:
//                     _controller.productList.map((ProductIst e) {
//                       return DropdownMenuItem<ProductIst>(
//                         value: e,
//                         child: Text(e.productName.toString()),
//                       );
//                     }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
