// import 'package:flutter_github_cicd/utils/Utils.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_github_cicd/common_wigets/form_header.dart';
// import 'package:flutter_github_cicd/utils/app_constent.dart';
// import '../../../../common_wigets/list_header.dart';
// import '../../../../common_wigets/list_item.dart';
// import '../../../../datalayer/dataProviders/dio_interceptor.dart';
// import '../../../../datalayer/dataProviders/dio_service.dart';
// import 'package:flutter_github_cicd/screens/bo_application/step_models/product_mosels/ProductIst.dart';
// import 'model/AccountModel25.dart';
// import 'reset_pass_admin_controller.dart';
//
// class AccountBlockAdmin extends StatelessWidget {
//   static const routeName = '/AccountBlockAdmin';
//   final ResetPassAdminController _controller = Get.put(
//     ResetPassAdminController(DioService(dioInterceptor: DioInterceptor())),
//   );
//   var depositPageKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     _controller.getAccountName();
//     _controller.getBlockedAccount();
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
//                         "Account Block".toUpperCase(),
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
//                     SizedBox(height: 10),
//                     FormHeader(title: 'Portfolio Code', required: true),
//                     _selectBankName(context),
//                     SizedBox(height: 20),
//                     Utils.globalButton(
//                       context,
//                       "Submit",
//                       () {
//                         if (depositPageKey.currentState!.validate()) {
//                           _controller.postBlock();
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
//                     _tableData(context),
//
//                     // FormHeader(title: 'Instrument Date', required: true),
//                     // InkWell(
//                     //     onTap: (){
//                     //
//                     //       Get.bottomSheet(DatePickerBottomSheet(title: 'Select a date',editingController: _controller.dateDepositInstrumentTextController,));
//                     //
//                     //     },
//                     //     child: MyTextField(isRequired: true,inputType: TextInputType.text,editingController: _controller.dateDepositInstrumentTextController, enableOrDisable: false, hints: 'dd/mm/yyyy', errorMessage: 'Please fill in this field.')),
//
//                     // FormHeader(title: 'Contact Number', required: true),
//                     // MyTextField(isRequired: true,editingController: _controller.contactNumberTextController, enableOrDisable: false, hints: '01811 913041', errorMessage: 'Please fill in this field.', inputType: TextInputType.text,),
//                     //
//                     //
//                     // FormHeader(title: 'Email', required: true),
//                     // MyTextField(isRequired: true,editingController: _controller.emailTextController, enableOrDisable: false, hints: 'email', errorMessage: 'Please fill in this field.', inputType: TextInputType.text,),
//                     //
//                     //
//                     // // FormHeader(title: 'Status', required: true),
//                     // // MyTextField(isRequired: true,editingController: _controller.passwordTextController, enableOrDisable: true, hints: 'status', errorMessage: 'Please fill in this field.', inputType: TextInputType.text,),
//                     //
//                     // FormHeader(title: 'Status', required: true,),
//                     // _dropDownPaymentMethod(context: context, title: 'Status', isEnabled: true, required: true, textEditingController: _controller.passwordTextController, typeList: ['Active','Inactive']),
//                     //
//                     //
//                     // SizedBox(height: 10,),
//                     //
//                     //
//                     // // FormHeader(title: 'Deposit Slip', required: true),
//                     // // InkWell(
//                     // //   onTap: (){
//                     // //     _controller.openFilePicker();
//                     // //   },
//                     // //     child: MyTextField(isRequired: true,editingController: _controller.fileTextField, enableOrDisable: false, hints: 'Choose file', errorMessage: 'Please select a file.', inputType: TextInputType.text,),
//                     // // ),
//                     // Divider(height: 1,color: Colors.grey.withOpacity(0.2)),
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
//
//   Widget _tableData(BuildContext context) {
//     var itemName = [
//       '#',
//       'Product Name',
//       'Portfolio Code',
//       'Investor Name',
//       'Action',
//     ];
//
//     var itemCount = 5.0;
//     var itemSize = 120.0;
//     var dividerSize = 4.0;
//
//     // container-> SingleChildScrollView -> Container -> Column -> IntrinsicHeight -> Container -> ListView
//
//     return Container(
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardColor,
//         borderRadius: BorderRadius.circular(5.0),
//       ), // margin: const EdgeInsets.only(top: 10, bottom: 20),
//       padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
//       child: Column(
//         children: [
//           /*
//                                              _controller.promotinalActionType.value="Add Promotional News";
//                                     Get.toNamed(PromotinalAdminEditAdd.routeName);
//            */
//           Container(
//             alignment: Alignment.centerLeft,
//             height: 40,
//             width: double.infinity,
//             margin: EdgeInsets.only(bottom: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Recent Block Account',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Theme.of(context).hintColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SingleChildScrollView(
//             controller: _controller.scrollController,
//             scrollDirection: Axis.horizontal,
//             child: Container(
//               width: (itemSize * itemCount) + dividerSize,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Theme.of(context).hintColor,
//                   width: 0.2,
//                 ),
//               ),
//               // padding: EdgeInsets.only(right: 10),
//               child: Obx(
//                 () => Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       child: IntrinsicHeight(
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             ListHeader(
//                               height: 40,
//                               corner: 'left',
//                               color: Colors.black.withOpacity(0.2),
//                               align: 'left',
//                               title: itemName[0],
//                               size: 60,
//                               callback: () {
//                                 debugPrint('P: 1');
//                               },
//                               position: 1,
//                             ),
//                             const VerticalDivider(width: 1),
//                             ListHeader(
//                               height: 40,
//                               corner: 'center',
//                               color: Colors.black.withOpacity(0.2),
//                               align: 'left',
//                               title: itemName[1],
//                               size: 120,
//                               callback: () {
//                                 debugPrint('P: 1');
//                               },
//                               position: 1,
//                             ),
//                             const VerticalDivider(width: 1),
//                             ListHeader(
//                               height: 40,
//                               corner: 'center',
//                               color: Colors.black.withOpacity(0.2),
//                               align: 'left',
//                               title: itemName[2],
//                               size: 120,
//                               callback: () {
//                                 debugPrint('P: 1');
//                               },
//                               position: 2,
//                             ),
//                             const VerticalDivider(width: 1),
//                             ListHeader(
//                               height: 40,
//                               corner: 'center',
//                               color: Colors.black.withOpacity(0.2),
//                               align: 'right',
//                               title: itemName[3],
//                               size: 120,
//                               callback: () {
//                                 debugPrint('P: 1');
//                               },
//                               position: 3,
//                             ),
//                             const VerticalDivider(width: 1),
//                             ListHeader(
//                               height: 40,
//                               corner: 'center',
//                               color: Colors.black.withOpacity(0.2),
//                               align: 'right',
//                               title: itemName[4],
//                               size: 120,
//                               callback: () {
//                                 debugPrint('P: 1');
//                               },
//                               position: 4,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     IntrinsicHeight(
//                       child: Container(
//                         height: 310,
//                         width: (itemSize * itemCount) + dividerSize,
//                         child: ListView.separated(
//                           physics: const ClampingScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: _controller.accountListBlock.length,
//                           itemBuilder: (context, index) {
//                             // var p = _controller.depositList[index];
//                             // _controller.calculateTotalOverview(index);
//                             return IntrinsicHeight(
//                               child: Row(
//                                 children: [
//                                   ListItem(
//                                     corner: 'center',
//                                     align: 'left',
//                                     title: '${index + 1}',
//                                     size: 60,
//                                     callback: () {
//                                       debugPrint('P: 1');
//                                     },
//                                     position: 1,
//                                   ),
//
//                                   const VerticalDivider(width: 1),
//                                   ListItem(
//                                     corner: 'center',
//                                     align: 'left',
//                                     title:
//                                         _controller
//                                             .accountListBlock[index]
//                                             .productName ??
//                                         '',
//                                     size: 120,
//                                     callback: () {
//                                       debugPrint('P: 1');
//                                     },
//                                     position: 1,
//                                   ),
//
//                                   const VerticalDivider(width: 1),
//                                   ListItem(
//                                     corner: 'center',
//                                     align: 'left',
//                                     title:
//                                         _controller
//                                             .accountListBlock[index]
//                                             .portfolioCode ??
//                                         '',
//                                     size: 120,
//                                     callback: () {
//                                       debugPrint('P: 1');
//                                     },
//                                     position: 1,
//                                   ),
//
//                                   const VerticalDivider(width: 1),
//
//                                   ListItem(
//                                     corner: 'center',
//                                     align: 'right',
//                                     title:
//                                         _controller
//                                             .accountListBlock[index]
//                                             .investorName ??
//                                         '',
//                                     size: 120,
//                                     callback: () {
//                                       debugPrint('P: 1');
//                                     },
//                                     position: 1,
//                                   ),
//
//                                   const VerticalDivider(width: 1),
//
//                                   ListItem(
//                                     corner: 'center',
//                                     align: 'right',
//                                     title: "Delete",
//                                     size: 120,
//                                     callback: () {
//                                       AppConstant.showDeleteWaringMSG(
//                                         context,
//                                         "You won't be able to revert this!",
//                                         () {
//                                           Get.back();
//                                           _controller.deleteBlock(
//                                             _controller.accountListBlock[index],
//                                           );
//                                         },
//                                       );
//                                     },
//                                     position: 1,
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                           separatorBuilder:
//                               (BuildContext context, int index) => Container(
//                                 height: 0.2,
//                                 color: Theme.of(context).hintColor,
//                               ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
