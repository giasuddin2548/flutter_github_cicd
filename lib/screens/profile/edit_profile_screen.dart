import 'package:intl/intl.dart';
import 'package:flutter_github_cicd/screens/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_wigets/global_textfield.dart';
import '../../datalayer/dataProviders/dio_interceptor.dart';
import '../../datalayer/dataProviders/dio_service.dart';
import '../../utils/Utils.dart';
import 'model/District.dart';
import 'model/Thana.dart';

class EditProfileScreen extends StatelessWidget {
  static const routeName = '/EditProfileScreen';
  final ProfileController _controller = Get.put(
    ProfileController(DioService(dioInterceptor: DioInterceptor())),
  );
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _controller.getDistict();
    final size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      color: Theme.of(context).primaryColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    SizedBox(height: topPadding + size.height * 0.04),
                    _buildProfileImage(size),
                  ],
                ),
              ),
              Positioned(
                top: size.height * 0.26,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight - size.height * 0.26,
                      ),
                      child: IntrinsicHeight(
                        child: Form(
                          key: loginFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFormFields(size, context),
                              const Spacer(),
                              Center(
                                child: Utils.globalButton(
                                  context,
                                  "Update Now",
                                  () {
                                    if (loginFormKey.currentState!.validate()) {
                                      _controller.updateProfile();
                                    }
                                  },
                                  size.width * 0.5,
                                  size.height * 0.05,
                                ),
                              ),
                              SizedBox(height: bottomPadding + 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: topPadding + 10,
                left: 20,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white24,
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: topPadding + 10,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "Account Detail",
                    style: TextStyle(
                      fontSize: size.height * 0.025,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileImage(Size size) {
    return Center(
      child: Container(
        height: size.height * 0.15,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              child: Obx(() {
                if (_controller.profileImage.value.path.isEmpty) {
                  return Icon(Icons.image, size: 50, color: Colors.grey[700]);
                } else {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.file(
                      _controller.profileImage.value,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  );
                }
              }),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: _controller.pickImage,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[500],
                  child: const Icon(Icons.add, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormFields(Size size, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalTextField(
          controller: _controller.fullNameController,
          hint: "Enter your name",
          label: "Full name",
          keyboardType: TextInputType.text,
          isRequired: true,
          isPassword: false,
          validator:
              (value) =>
                  value == null || value.isEmpty ? 'Name is required' : null,
          isEnabled: true,
          onChangedCallback: (_) {},
        ),
        SizedBox(height: size.height * 0.015),
        GlobalTextField(
          controller: _controller.companyNameController,
          hint: "Enter company name",
          label: "Company Name",
          keyboardType: TextInputType.text,
          isRequired: true,
          isPassword: false,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Company name is required'
                      : null,
          isEnabled: true,
          onChangedCallback: (_) {},
        ),
        SizedBox(height: size.height * 0.015),
        _selectionDistrict(context),
        SizedBox(height: size.height * 0.015),
        _selectionThana(context),
        SizedBox(height: size.height * 0.015),
        GlobalTextField(
          controller: _controller.villageStreetController,
          hint: "Enter village/street",
          label: "Village/Street",
          keyboardType: TextInputType.text,
          isRequired: true,
          isPassword: false,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Village/street is required'
                      : null,
          isEnabled: true,
          onChangedCallback: (_) {},
        ),
        SizedBox(height: size.height * 0.015),
        GlobalTextField(
          controller: _controller.mobileNoController,
          hint: "Enter phone number",
          label: "Phone Number",
          keyboardType: TextInputType.phone,
          isRequired: true,
          isPassword: false,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Phone number is required'
                      : null,
          isEnabled: true,
          onChangedCallback: (_) {},
        ),
        SizedBox(height: size.height * 0.015),
        GlobalTextField(
          controller: _controller.officePhoneController,
          hint: "Office phone number",
          label: "Office Number",
          keyboardType: TextInputType.phone,
          isRequired: true,
          isPassword: false,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Office number is required'
                      : null,
          isEnabled: true,
          onChangedCallback: (_) {},
        ),
        SizedBox(height: size.height * 0.015),
        GlobalTextField(
          controller: _controller.officeIdController,
          hint: "Enter Office ID",
          label: "Office ID Number",
          keyboardType: TextInputType.number,
          isRequired: true,
          isPassword: false,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Office ID number is required'
                      : null,
          isEnabled: true,
          onChangedCallback: (_) {},
        ),
        SizedBox(height: size.height * 0.015),
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: Get.context!,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (pickedDate != null) {
              _controller.dobController.text = DateFormat(
                'yyyy-MM-dd',
              ).format(pickedDate);
            }
          },
          child: GlobalTextField(
            controller: _controller.dobController,
            hint: "Select date of birth",
            label: "Date of Birth",
            keyboardType: TextInputType.text,
            isRequired: true,
            isPassword: false,
            validator:
                (value) =>
                    value == null || value.isEmpty ? 'DOB is required' : null,
            isEnabled: false,
            onChangedCallback: (_) {},
          ),
        ),
        SizedBox(height: size.height * 0.015),
        GlobalTextField(
          controller: _controller.nidController,
          hint: "Enter NID or birth certificate",
          label: "NID/ Birth Certificate",
          keyboardType: TextInputType.text,
          isRequired: true,
          isPassword: false,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'NID or Birth certificate is required'
                      : null,
          isEnabled: true,
          onChangedCallback: (_) {},
        ),
        SizedBox(height: size.height * 0.030),
      ],
    );
  }

  Widget _selectionDistrict(BuildContext context) {
    var isRequired = true;
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              text: 'District',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children:
                  isRequired
                      ? [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ]
                      : [],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey, // Border color
              width: 1.0, // Border width
            ),
          ),
          constraints: const BoxConstraints(minHeight: 50),

          child: Obx(
            () => Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                  width: Get.width,
                  child: Text(
                    _controller.selectedDistrict.value.name ??
                        'Select District Name',
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<District>(
                    isExpanded: true,
                    onChanged: (District? v) {
                      /*
                    RxObjectMixin<DistrictModel> selectedDistrict = DistrictModel().obs;
  var districtList = <DistrictModel>[].obs;

  RxObjectMixin<ThanaModel> selectedThana = ThanaModel().obs;
  var thanaList = <BranchNameList>[].obs;
                   */

                      _controller.selectedDistrict.value = v!;
                    },
                    items:
                        _controller.defaultDis.value.dataDict?.district?.map((
                          District e,
                        ) {
                          return DropdownMenuItem<District>(
                            value: e,
                            child: Text(e.name.toString()),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _selectionThana(BuildContext context) {
    var isRequired = true;

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              text: 'Thana',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children:
                  isRequired
                      ? [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ]
                      : [],
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey, // Border color
              width: 1.0, // Border width
            ),
          ),
          constraints: const BoxConstraints(minHeight: 50),

          child: Obx(
            () => Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                  width: Get.width,
                  child: Text(
                    _controller.selectedThana.value.name ?? 'Select Thana Name',
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<Thana>(
                    isExpanded: true,
                    onChanged: (Thana? v) {
                      _controller.selectedThana.value = v!;
                    },
                    items:
                        _controller.defaultDis.value.dataDict?.thana?.map((
                          Thana e,
                        ) {
                          return DropdownMenuItem<Thana>(
                            value: e,
                            child: Text(e.name.toString()),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
