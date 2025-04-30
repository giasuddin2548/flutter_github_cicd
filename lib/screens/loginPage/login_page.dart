import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/screens/forgotPass/forgot_client_id.dart';
import '../../common_wigets/global_textfield.dart';
import '../../datalayer/dataProviders/dio_service.dart';
import '../../datalayer/dataProviders/dio_interceptor.dart';
import '../../utils/Utils.dart';
import '../signup_screen/signup_screen.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login_page';
  final LoginController _controller = Get.put(
    LoginController(DioService(dioInterceptor: DioInterceptor())),
  );
  String? remoteVersion;
  LoginPage(this.remoteVersion, {super.key});

  var loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                      "WELCOME BACK!",
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
                                    controller: _controller.textFieldEmail,
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
                                  SizedBox(height: size.height * 0.02),
                                  GlobalTextField(
                                    controller: _controller.textFieldPassword,
                                    hint: "Password",
                                    label: "Enter Password",
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
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed:
                                          () => Get.toNamed(
                                            ForgotClientId.routeName,
                                          ),
                                      child: Text(
                                        "Forgot Password",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.04),

                                  Utils.globalButton(
                                    context,
                                    "Login",
                                    () {
                                      if (loginFormKey.currentState!
                                          .validate()) {
                                        _controller.login();
                                      }
                                    },
                                    size.width * 0.4,
                                    size.height * 0.04,
                                  ),
                                  SizedBox(height: size.height * 0.04),
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
                                  //       _controller.login();
                                  //     }
                                  //   },
                                  //   child: Center(
                                  //     child: Text(
                                  //       "Log In",
                                  //       style: TextStyle(
                                  //         fontSize: size.height * 0.022,
                                  //         fontWeight: FontWeight.bold,
                                  //         color: Theme.of(context).cardColor,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(height: size.height * 0.02),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Don’t have an account? "),
                                        GestureDetector(
                                          onTap:
                                              () => Get.toNamed(
                                                SignupScreen.routeName,
                                              ),
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(height: size.height * 0.04),
                                  Center(
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
            ],
          );
        },
      ),
    );
  }
}
