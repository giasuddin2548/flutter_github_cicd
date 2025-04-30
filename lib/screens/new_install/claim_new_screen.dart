import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_wigets/global_textfield.dart';
import '../../datalayer/dataProviders/dio_interceptor.dart';
import '../../datalayer/dataProviders/dio_service.dart';
import '../../utils/Utils.dart';
import 'new_install_controller.dart';

class ClaimNewScreen extends StatelessWidget {
  static const routeName = '/ClaimNewScreen';
  final _controller = Get.put(
    NewInstallController(DioService(dioInterceptor: DioInterceptor())),
  );
  final loginFormKey = GlobalKey<FormState>();

  ClaimNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    _controller.getDefaultData();
    return Container(
      color: Theme.of(context).primaryColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                top: topPadding + 70,
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
                              _buildFormFields(size),
                              const Spacer(),
                              Center(
                                child: Utils.globalButton(
                                  context,
                                  "Claim Now",
                                  () {
                                    if (loginFormKey.currentState!.validate()) {
                                      _controller.claimNewProduct();
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
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 40,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white24,
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Claim Product",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFormFields(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalTextField(
          controller: _controller.modelNameController,
          hint: "Enter model name",
          label: "Model Name",
          keyboardType: TextInputType.text,
          isRequired: true,
          isPassword: false,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Model Name is required'
                      : null,
          isEnabled: false,
          onChangedCallback: (_) {},
        ),
        SizedBox(height: size.height * 0.015),

        GlobalTextField(
          controller: _controller.serialNumberController,
          hint: "Enter serial number",
          label: "Serial Number",
          keyboardType: TextInputType.text,
          isRequired: true,
          isPassword: false,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Serial Number is required'
                      : null,
          isEnabled: false,
          onChangedCallback: (_) {},
        ),
        SizedBox(height: size.height * 0.015),

        GlobalTextField(
          controller: _controller.clientNameController,
          hint: "Enter client name",
          label: "Client Name",
          keyboardType: TextInputType.text,
          isRequired: true,
          isPassword: false,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Client Name is required'
                      : null,
          isEnabled: true,
          onChangedCallback: (_) {},
        ),
        SizedBox(height: size.height * 0.015),

        GlobalTextField(
          controller: _controller.clientAddressController,
          hint: "Enter client address",
          label: "Client Address",
          keyboardType: TextInputType.text,
          isRequired: true,
          isPassword: false,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Client Address is required'
                      : null,
          isEnabled: true,
          onChangedCallback: (_) {},
        ),
        SizedBox(height: size.height * 0.015),

        GlobalTextField(
          controller: _controller.clientContactController,
          hint: "Enter client contact info",
          label: "Client Contact Information",
          keyboardType: TextInputType.phone,
          isRequired: true,
          isPassword: false,
          validator:
              (value) =>
                  value == null || value.isEmpty
                      ? 'Client Contact is required'
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
              _controller.installationDateController.text = DateFormat(
                'yyyy-MM-dd',
              ).format(pickedDate);
            }
          },
          child: GlobalTextField(
            controller: _controller.installationDateController,
            hint: "Enter date of installation",
            label: "Date of Installation",
            keyboardType: TextInputType.datetime,
            isRequired: true,
            isPassword: false,
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? 'Installation Date is required'
                        : null,
            isEnabled: false,
            onChangedCallback: (_) {},
          ),
        ),

        SizedBox(height: size.height * 0.015),
      ],
    );
  }
}
