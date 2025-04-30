import 'package:flutter_github_cicd/screens/signup_screen/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_wigets/global_textfield.dart';
import '../../datalayer/dataProviders/dio_interceptor.dart';
import '../../datalayer/dataProviders/dio_service.dart';
import '../../utils/Utils.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = '/signUp_screen';
  final SignUpController _controller = Get.put(
    SignUpController(DioService(dioInterceptor: DioInterceptor())),
  );
  final loginFormKey = GlobalKey<FormState>();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _controller.fullNameController.text = 'John Doe';
    _controller.companyNameController.text = 'Example Corp';
    _controller.otpController.text = '123456';
    _controller.passwordController.text = 'Password@123';
    _controller.confPasswordController.text = 'Password@123';
    _controller.mobileNoController.text = '01611570857';

    final size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                width: size.width,
                padding: EdgeInsets.only(top: topPadding),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05),
                    Center(
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        width: size.width * 0.55,
                        height: size.height * 0.22,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      "CREATE AN ACCOUNT",
                      style: TextStyle(
                        fontSize: size.height * 0.028,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: topPadding + size.height * 0.32,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height - (topPadding + size.height * 0.32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Form(
                              key: loginFormKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GlobalTextField(
                                    controller: _controller.fullNameController,
                                    hint: "enter your name",
                                    label: "Full name",
                                    keyboardType: TextInputType.text,
                                    isRequired: true,
                                    isPassword: false,
                                    validator:
                                        (value) =>
                                            value == null || value.isEmpty
                                                ? 'name is required'
                                                : null,
                                    isEnabled: true,
                                    onChangedCallback: (_) {},
                                  ),
                                  SizedBox(height: size.height * 0.01),

                                  GlobalTextField(
                                    controller: _controller.mobileNoController,
                                    hint: "Enter Phone Number",
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
                                  SizedBox(height: size.height * 0.01),
                                  GlobalTextField(
                                    controller:
                                        _controller.companyNameController,
                                    hint: "enter company name",
                                    label: "Company Name",
                                    keyboardType: TextInputType.phone,
                                    isRequired: true,
                                    isPassword: false,
                                    validator:
                                        (value) =>
                                            value == null || value.isEmpty
                                                ? 'company name is required'
                                                : null,
                                    isEnabled: true,
                                    onChangedCallback: (_) {},
                                  ),
                                  SizedBox(height: size.height * 0.01),

                                  GlobalTextField(
                                    controller: _controller.passwordController,
                                    hint: "New Password",
                                    label: "New Password",
                                    keyboardType: TextInputType.text,
                                    isRequired: true,
                                    isPassword: true,
                                    validator:
                                        (value) =>
                                            value == null || value.isEmpty
                                                ? 'Password is required'
                                                : null,
                                    isEnabled: true,
                                    onChangedCallback: (_) {},
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  GlobalTextField(
                                    controller:
                                        _controller.confPasswordController,
                                    hint: "Confirm Password",
                                    label: "Confirm Password",
                                    keyboardType: TextInputType.text,
                                    isRequired: true,
                                    isPassword: true,
                                    validator:
                                        (value) =>
                                            value == null || value.isEmpty
                                                ? 'Password is required'
                                                : null,
                                    isEnabled: true,
                                    onChangedCallback: (_) {},
                                  ),

                                  SizedBox(height: size.height * 0.03),

                                  Utils.globalButton(
                                    context,
                                    "Send OTP",
                                    () {
                                      if (loginFormKey.currentState!
                                          .validate()) {
                                        _controller.postSignup1();
                                      }
                                    },
                                    size.width * 0.4,
                                    size.height * 0.04,
                                  ),

                                  // ElevatedButton(
                                  //   style: ElevatedButton.styleFrom(
                                  //     backgroundColor: Theme.of(context).primaryColor,
                                  //     padding: const EdgeInsets.symmetric(vertical: 16),
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(10),
                                  //     ),
                                  //   ),
                                  //   onPressed: () {
                                  //     if (loginFormKey.currentState!.validate()) {
                                  //       _controller.postSignup1();
                                  //     }
                                  //   },
                                  //   child: Center(
                                  //     child: Text(
                                  //       "Send OTP",
                                  //       style: TextStyle(
                                  //         fontSize: size.height * 0.022,
                                  //         fontWeight: FontWeight.bold,
                                  //         color: Theme.of(context).cardColor,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Visibility(
                                  //   visible: true, // You can control this visibility via controller
                                  //   child: Column(
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: [
                                  //       SizedBox(height: size.height * 0.03),
                                  //       Text(
                                  //         "Enter the 4-digit OTP Code",
                                  //         style: TextStyle(
                                  //           fontSize: 18,
                                  //           fontWeight: FontWeight.bold,
                                  //           color: Colors.black,
                                  //         ),
                                  //       ),
                                  //       SizedBox(height: size.height * 0.01),
                                  //       Container(
                                  //         width: double.infinity,
                                  //         child: Pinput(
                                  //           length: 4,
                                  //           onChanged: (v) {
                                  //             // handle OTP input
                                  //           },
                                  //           onCompleted: (v){
                                  //             _controller.postSignup2();
                                  //           },
                                  //         ),
                                  //       ),
                                  //       SizedBox(height: size.height * 0.03),
                                  //       ElevatedButton(
                                  //         style: ElevatedButton.styleFrom(
                                  //           backgroundColor: Theme.of(context).primaryColor,
                                  //           padding: const EdgeInsets.symmetric(vertical: 16),
                                  //           shape: RoundedRectangleBorder(
                                  //             borderRadius: BorderRadius.circular(10),
                                  //           ),
                                  //         ),
                                  //         onPressed: () {
                                  //
                                  //           _controller.postSignup2();
                                  //
                                  //         },
                                  //         child: Center(
                                  //           child: Text(
                                  //             "Confirm",
                                  //             style: TextStyle(
                                  //               fontSize: size.height * 0.022,
                                  //               fontWeight: FontWeight.bold,
                                  //               color: Theme.of(context).cardColor,
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(height: size.height * 0.05),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: const [
                                        Text(
                                          "Powered by",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Text(
                                          "Smart | Unisoft",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: topPadding,
                left: 20,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: ClipOval(
                    child: Container(
                      color: Colors.white12,
                      height: 40,
                      width: 40,
                      child: const Icon(Icons.arrow_back, color: Colors.white),
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
}
