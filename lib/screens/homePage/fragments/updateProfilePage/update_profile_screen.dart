import 'package:flutter_github_cicd/datalayer/models/BankDataModel.dart';

import 'package:flutter_github_cicd/screens/homePage/fragments/updateProfilePage/update_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../common_wigets/dashboard_info_item.dart';
import '../../../../common_wigets/form_header.dart';
import '../../../../common_wigets/my_text_field.dart';
import '../../../../datalayer/dataProviders/dio_interceptor.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../datalayer/models/BranchDataModel.dart';
import '../../../../utils/Utils.dart';
import '../../../../utils/app_constent.dart';

class UpdateProfileScreen extends StatelessWidget {
  static const routeName = '/update_profile_screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      width: MediaQuery.of(context).size.width,
      height: Get.height,
      child: DefaultTabController(
        length: 3, // Number of tabs
        child: Column(
          children: [
            TabBar(
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(text: "Profile"),
                Tab(text: "Activity"),
                Tab(text: "Update"),
              ],
            ),
            Expanded(
              // Makes the TabBarView take the remaining space
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [ProfileTab(), ActivityTab(), UpdateTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  final _controller = Get.put(
    UpdateProfileController(DioService(dioInterceptor: DioInterceptor())),
  );

  @override
  Widget build(BuildContext context) {
    _controller.getTabProfile();

    return Container(
      child: SingleChildScrollView(
        controller: _controller.scrollController,
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            _investorPersonalInfo(context),
            _investorContactInfo(context),
            _investorBankInfo(context),
            _investorAccountInfo(context),
          ],
        ),
      ),
    );
  }

  Widget _investorPersonalInfo(BuildContext context) {
    var itemName = [
      "Personal Info",

      "Name:",
      'NID:',
      'Date of Birth:',

      'Occupation',
      'Business',
    ];

    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),

      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                itemName[0].toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            DashboardInfoItem(
              itemName[1],
              _controller.profileData.value.investorName ?? '',
            ),
            SizedBox(height: 3),
            DashboardInfoItem(
              "BO",
              _controller.profileData.value.investorCode ?? '',
            ),
            SizedBox(height: 3),
            DashboardInfoItem(
              itemName[2],
              _controller.profileData.value.nid ?? '',
            ),
            SizedBox(height: 3),
            DashboardInfoItem(
              itemName[3],
              _controller.profileData.value.dob ?? '',
            ),
            SizedBox(height: 3),
            DashboardInfoItem(itemName[4], ''),
            SizedBox(height: 3),
            DashboardInfoItem(
              itemName[5],
              _controller.profileData.value.mobile ?? '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _investorContactInfo(BuildContext context) {
    var itemName = ["Contact Info", "Email", 'Phone', 'Address'];

    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),

      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                itemName[0].toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            DashboardInfoItem(
              itemName[1],
              _controller.profileData.value.email ?? '',
            ),
            SizedBox(height: 3),
            DashboardInfoItem(
              itemName[2],
              _controller.profileData.value.mobile ?? '',
            ),
            SizedBox(height: 3),
            DashboardInfoItem(
              itemName[3],
              _controller.profileData.value.mailingAddress ?? '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _investorBankInfo(BuildContext context) {
    var itemName = ["Bank Info", "Bank", 'Branch', 'Bank Ac No.'];

    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),

      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                itemName[0].toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            DashboardInfoItem(
              itemName[1],
              _controller.profileData.value.bankName ?? '',
            ),
            SizedBox(height: 3),
            DashboardInfoItem(
              itemName[2],
              _controller.profileData.value.branchName ?? '',
            ),
            SizedBox(height: 3),
            DashboardInfoItem(
              itemName[3],
              _controller.profileData.value.bankAccountNo ?? '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _investorAccountInfo(BuildContext context) {
    var itemName = [
      "Account Info",

      "Code",
      'Operating Branch',
      'Date',
      'BO Account No.',
    ];

    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),

      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                itemName[0].toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            DashboardInfoItem(
              itemName[1],
              _controller.profileData.value.portfolioCode ?? '',
            ),
            SizedBox(height: 3),
            DashboardInfoItem(
              itemName[2],
              _controller.profileData.value.bankName ?? '',
            ),
            SizedBox(height: 3),
            DashboardInfoItem(
              itemName[3],
              _controller.profileData.value.dob ?? '',
            ),
            SizedBox(height: 3),
            DashboardInfoItem(
              itemName[4],
              _controller.profileData.value.boAccountNo ?? '',
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityTab extends StatelessWidget {
  final _controller = Get.put(
    UpdateProfileController(DioService(dioInterceptor: DioInterceptor())),
  );

  @override
  Widget build(BuildContext context) {
    _controller.getTabActivities();
    /*
           Obx(()=> ListView(

            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            children: _controller.activityList.map((e)=>TimelineItem(
              date: "${e.businessDate}",
              title: "${e.requestType}",
            )).toList(),
          ))
     */
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            () => ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              children:
                  _controller.activityList
                      .map(
                        (e) => TimelineItem(
                          date: "${e.businessDate}",
                          title: "${e.requestType}",
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final String date;
  final String title;

  const TimelineItem({required this.date, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Column(
          children: [
            CircleAvatar(
              radius: 8,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            Container(
              width: 4,
              height: 50, // Adjust height based on spacing
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
        SizedBox(width: 8),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date, style: TextStyle(fontSize: 14, color: Colors.grey)),
              SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UpdateTab extends StatelessWidget {
  final _controller = Get.put(
    UpdateProfileController(DioService(dioInterceptor: DioInterceptor())),
  );

  List<String> options = [
    "Investor Name",
    "Mailing Address",
    "NID",
    "TIN",
    "Bank Name",
    "Branch Name",
    "Account No.",
    "Cheque",
  ];

  void handleOption(String option) {
    switch (option) {
      case "Investor Name":
        _controller.investorNameTextFieldActive.value = true;
        _controller.mailingAddressTextFieldActive.value = false;
        _controller.nidTextFieldActive.value = false;
        _controller.tinTextFieldActive.value = false;
        _controller.bankInfoActive.value = false;
        _controller.branchInfoActive.value = false;
        _controller.accountInfoActive.value = false;
        _controller.bankStatementInfoActive.value = false;
        _controller.fileSelectionController.text = "";
        _controller.showSubmitButton();
        break;
      case "Mailing Address":
        _controller.investorNameTextFieldActive.value = false;
        _controller.mailingAddressTextFieldActive.value = true;
        _controller.nidTextFieldActive.value = false;
        _controller.tinTextFieldActive.value = false;
        _controller.bankInfoActive.value = false;
        _controller.branchInfoActive.value = false;
        _controller.accountInfoActive.value = false;
        _controller.bankStatementInfoActive.value = false;
        _controller.fileSelectionController.text = "";
        _controller.showSubmitButton();
        break;
      case "NID":
        _controller.nidTextFieldActive.value = true;
        _controller.tinTextFieldActive.value = false;

        _controller.bankInfoActive.value = false;
        _controller.branchInfoActive.value = false;
        _controller.accountInfoActive.value = false;
        _controller.bankStatementInfoActive.value = false;
        _controller.investorNameTextFieldActive.value = false;
        _controller.mailingAddressTextFieldActive.value = false;
        _controller.fileSelectionController.text = "";
        _controller.showSubmitButton();
        break;
      case "TIN":
        _controller.nidTextFieldActive.value = false;
        _controller.tinTextFieldActive.value = true;
        _controller.bankInfoActive.value = false;
        _controller.branchInfoActive.value = false;
        _controller.accountInfoActive.value = false;
        _controller.bankStatementInfoActive.value = false;
        _controller.investorNameTextFieldActive.value = false;
        _controller.mailingAddressTextFieldActive.value = false;
        _controller.fileSelectionController.text = "";
        _controller.showSubmitButton();
        break;
      case "Bank Name":
        _controller.bankInfoActive.value = true;
        _controller.branchInfoActive.value = true;
        _controller.accountInfoActive.value = true;
        _controller.bankStatementInfoActive.value = true;
        _controller.nidTextFieldActive.value = false;
        _controller.tinTextFieldActive.value = false;
        _controller.investorNameTextFieldActive.value = false;
        _controller.mailingAddressTextFieldActive.value = false;
        _controller.fileSelectionController.text = "";
        _controller.showSubmitButton();
        break;
      case "Branch Name":
        _controller.bankInfoActive.value = true;
        _controller.branchInfoActive.value = true;
        _controller.accountInfoActive.value = true;
        _controller.bankStatementInfoActive.value = true;
        _controller.nidTextFieldActive.value = false;
        _controller.tinTextFieldActive.value = false;
        _controller.investorNameTextFieldActive.value = false;
        _controller.mailingAddressTextFieldActive.value = false;
        _controller.fileSelectionController.text = "";
        _controller.showSubmitButton();
        break;
      case "Account No.":
        _controller.bankInfoActive.value = true;
        _controller.branchInfoActive.value = true;
        _controller.accountInfoActive.value = true;
        _controller.bankStatementInfoActive.value = true;
        _controller.nidTextFieldActive.value = false;
        _controller.tinTextFieldActive.value = false;
        _controller.investorNameTextFieldActive.value = false;
        _controller.mailingAddressTextFieldActive.value = false;
        _controller.fileSelectionController.text = "";
        _controller.showSubmitButton();
        break;
      case "Cheque":
        _controller.bankInfoActive.value = true;
        _controller.branchInfoActive.value = true;
        _controller.accountInfoActive.value = true;
        _controller.bankStatementInfoActive.value = true;
        _controller.nidTextFieldActive.value = false;
        _controller.tinTextFieldActive.value = false;
        _controller.investorNameTextFieldActive.value = false;
        _controller.mailingAddressTextFieldActive.value = false;
        _controller.fileSelectionController.text = "";
        _controller.showSubmitButton();
        break;
      default:
        print("Invalid selection");
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller.getProfileData();
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          FormHeader(
            title: 'Select which one you want to update',
            required: false,
          ),
          _dropDownPaymentMethod(
            context: context,
            title: "Select ",
            isEnabled: false,
            required: true,
            typeList: options,
          ),
          Obx(
            () => Visibility(
              visible: _controller.investorNameTextFieldActive.value,
              child: Column(
                children: [
                  FormHeader(title: 'Investor Name', required: false),
                  MyTextField(
                    isRequired: true,
                    editingController: _controller.investorNameTextField,
                    enableOrDisable: true,
                    hints: 'Investor Name',
                    errorMessage: 'Please fill in this field.',
                    inputType: TextInputType.text,
                    onChangedCallback: (v) {},
                  ),
                ],
              ),
            ),
          ),

          Obx(
            () => Visibility(
              visible: _controller.nidTextFieldActive.value,
              child: Column(
                children: [
                  SizedBox(height: 5),
                  FormHeader(title: 'NID No.', required: false),
                  MyTextField(
                    isRequired: true,
                    editingController: _controller.nidTextField,
                    enableOrDisable: true,
                    hints: 'NID No.',
                    errorMessage: 'Please fill in this field.',
                    inputType: TextInputType.text,
                    onChangedCallback: (v) {},
                  ),

                  FormHeader(title: 'NID Photo', required: false),
                  InkWell(
                    onTap: () {
                      _controller.chooseFile();
                    },
                    child: MyTextFieldFileChose(
                      isRequired: true,
                      editingController: _controller.fileSelectionController,
                      enableOrDisable: false,
                      hints: 'Choose file',
                      errorMessage: 'Please select a file.',
                      inputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Obx(
            () => Visibility(
              visible: _controller.tinTextFieldActive.value,
              child: Column(
                children: [
                  SizedBox(height: 5),
                  FormHeader(title: 'TIN', required: false),
                  MyTextField(
                    isRequired: true,
                    editingController: _controller.tinTextField,
                    enableOrDisable: true,
                    hints: 'Tin ',
                    errorMessage: 'Please fill in this field.',
                    inputType: TextInputType.text,
                    onChangedCallback: (v) {},
                  ),

                  FormHeader(title: 'TIN Photo', required: false),
                  InkWell(
                    onTap: () {
                      _controller.chooseFile();
                    },
                    child: MyTextFieldFileChose(
                      isRequired: true,
                      editingController: _controller.fileSelectionController,
                      enableOrDisable: false,
                      hints: 'Choose file',
                      errorMessage: 'Please select a file.',
                      inputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Obx(
            () => Visibility(
              visible: _controller.mailingAddressTextFieldActive.value,
              child: Column(
                children: [
                  SizedBox(height: 5),
                  FormHeader(title: 'Mailing Address', required: false),
                  MyTextField(
                    isRequired: true,
                    editingController: _controller.mailingAddressTextField,
                    enableOrDisable: true,
                    hints: 'Mailing Address ',
                    errorMessage: 'Please fill in this field.',
                    inputType: TextInputType.text,
                    onChangedCallback: (v) {},
                  ),
                ],
              ),
            ),
          ),

          Obx(
            () => Visibility(
              visible: _controller.boAccountNoTextFieldActive.value,
              child: Column(
                children: [
                  SizedBox(height: 5),
                  FormHeader(title: 'BO Account', required: false),
                  MyTextField(
                    isRequired: true,
                    editingController: _controller.boAccountNoTextField,
                    enableOrDisable: true,
                    hints: 'BO Account',
                    errorMessage: 'Please fill in this field.',
                    inputType: TextInputType.text,
                    onChangedCallback: (v) {},
                  ),
                ],
              ),
            ),
          ),

          Obx(
            () => Visibility(
              visible:
                  _controller.bankInfoActive.value ||
                  _controller.branchInfoActive.value ||
                  _controller.accountInfoActive.value ||
                  _controller.bankStatementInfoActive.value,
              child: Column(
                children: [
                  SizedBox(height: 5),
                  FormHeader(title: 'Bank Name', required: false),
                  _selectBankName(context),

                  SizedBox(height: 5),
                  FormHeader(title: 'Branch Name', required: false),
                  _selectBranchName(context),
                  SizedBox(height: 5),
                  FormHeader(title: 'Account No.', required: false),
                  MyTextField(
                    isRequired: true,
                    editingController: _controller.accountNoTextField,
                    enableOrDisable: true,
                    hints: 'Account No.',
                    errorMessage: 'Please fill in this field.',
                    inputType: TextInputType.text,
                    onChangedCallback: (v) {},
                  ),
                  FormHeader(
                    title: 'Bank Statement/Cheque Leaf',
                    required: false,
                  ),
                  InkWell(
                    onTap: () {
                      _controller.chooseFile();
                    },
                    child: MyTextFieldFileChose(
                      isRequired: true,
                      editingController: _controller.fileSelectionController,
                      enableOrDisable: false,
                      hints: 'Choose file',
                      errorMessage: 'Please select a file.',
                      inputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 10),

          Obx(
            () => Visibility(
              visible: _controller.isSubmitShow.value,
              child: Utils.globalButton(
                context,
                "Submit",
                () {
                  if (_controller.ipoKey.currentState!.validate()) {
                    _controller.submit();
                  }
                },
                MediaQuery.of(context).size.width / 2,
                40,
              ),
            ),
          ),

          // SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget customDivider(double height) {
    return Container(
      width: Get.size.width,
      height: 1,
      color: AppConstant.scaffoldColor(),
      margin: EdgeInsets.only(left: 10, right: 10),
    );
  }

  Widget customVerticalDivider(double height) {
    return Container(
      width: 1,
      height: height,
      color: AppConstant.scaffoldColor(),
      margin: EdgeInsets.only(top: 10, bottom: 10),
    );
  }

  Widget _selectBankName(BuildContext context) {
    return Container(
      width: Get.size.width,
      height: 40,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Obx(
        () => IgnorePointer(
          ignoring: _controller.isBankListAdded.value,
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.white),
            child: DropdownButtonFormField<BankDataModel>(
              // value:  _controller.getDefaultBankItem(),
              value:
                  _controller.bankList.isNotEmpty
                      ? _controller.bankList[0]
                      : null,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 1.3.h,
                  horizontal: 2.0.w,
                ),
                errorStyle: TextStyle(
                  inherit: false,
                  color: Colors.red,
                  fontSize: 8.sp,
                  height: 0.01.h,
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),

                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                fillColor: Theme.of(context).cardColor,
                // filled: true,
                labelStyle: TextStyle(fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),

                border: const OutlineInputBorder(),
                // prefixIcon: Icon(
                //   Icons.phone_android,
                //   color: AppConstant.mySecondaryColor(),
                //   size: 18,
                // ),
                // contentPadding:
                //     const EdgeInsets.only(top: 0, left: 15),
                // label: Text('Email or Mobile No.', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
              ),
              items:
                  _controller.bankList.map((BankDataModel e) {
                    return DropdownMenuItem<BankDataModel>(
                      value: e,
                      child: Text(
                        e.orgName.toString(),
                        style: const TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
              hint: const Text(
                'Select a bank name',
                style: TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              onChanged: (value) {
                _controller.branchList.clear();
                _controller.isBranchListAdded.value = true;
                _controller.bankIDTextField.text = "${value?.orgId ?? ''}";
                _controller.selectBranchName();
              },
              validator: (v) {
                if (v == null) {
                  return 'Please select an item in the list.';
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectBranchName(BuildContext context) {
    return Container(
      width: Get.size.width,
      height: 40,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Obx(
        () => IgnorePointer(
          ignoring: _controller.isBranchListAdded.value,
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.white),
            child: DropdownButtonFormField<BranchDataModel>(
              // value: _controller.branchDefaultData.value,
              value:
                  _controller.branchList.isNotEmpty
                      ? _controller.branchList[0]
                      : null,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 1.3.h,
                  horizontal: 2.0.w,
                ),
                errorStyle: TextStyle(
                  inherit: false,
                  color: Colors.red,
                  fontSize: 8.sp,
                  height: 0.01.h,
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),

                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                fillColor: Theme.of(context).cardColor,
                // filled: true,
                labelStyle: TextStyle(fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),

                border: const OutlineInputBorder(),
                // prefixIcon: Icon(
                //   Icons.phone_android,
                //   color: AppConstant.mySecondaryColor(),
                //   size: 18,
                // ),
                // contentPadding:
                //     const EdgeInsets.only(top: 0, left: 15),
                // label: Text('Email or Mobile No.', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
              ),
              items:
                  _controller.branchList
                      .map(
                        (BranchDataModel e) =>
                            DropdownMenuItem<BranchDataModel>(
                              value: e,
                              child: Text(
                                e.branchName.toString(),
                                style: const TextStyle(fontSize: 10),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                      )
                      .toList(),
              hint: Text(
                "${_controller.branchDefaultData.value.branchName}",
                style: TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              onChanged: (value) {
                _controller.branchIDTextField.text = "${value?.branchId ?? ''}";
              },
              validator: (v) {
                if (v == null) {
                  return 'Please select an item in the list.';
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }

  _dropDownPaymentMethod({
    required BuildContext context,
    required String title,
    required bool isEnabled,
    required bool required,
    required List<String> typeList,
  }) {
    return Column(
      children: [
        Container(
          width: Get.size.width,
          // alignment: Alignment.center,
          height: 40,
          // color: Colors.red,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: IgnorePointer(
            ignoring: false,
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Theme.of(context).cardColor,
                // backgroundColor: Colors.yellow
              ),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1.3.h,
                    horizontal: 2.0.w,
                  ),
                  errorStyle: TextStyle(
                    inherit: false,
                    color: Colors.red,
                    fontSize: 8.sp,
                    height: 0.01.h,
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),

                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  fillColor: Theme.of(context).cardColor,
                  // filled: true,
                  labelStyle: TextStyle(fontSize: 14),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),

                  border: const OutlineInputBorder(),
                  // prefixIcon: Icon(
                  //   Icons.phone_android,
                  //   color: AppConstant.mySecondaryColor(),
                  //   size: 18,
                  // ),
                  // contentPadding:
                  //     const EdgeInsets.only(top: 0, left: 15),
                  // label: Text('Email or Mobile No.', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
                ),
                items:
                    typeList
                        .map(
                          (String e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),

                hint: Text(
                  title,
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
                onChanged: (value) {
                  handleOption(value!);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
