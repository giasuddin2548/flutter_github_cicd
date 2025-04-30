import 'package:flutter_github_cicd/utils/Utils.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_github_cicd/screens/signup_screen/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../datalayer/dataProviders/dio_interceptor.dart';
import '../../datalayer/dataProviders/dio_service.dart';

class PasswordSetup extends StatelessWidget {
  static const routeName = '/PasswordSetup';
  final SignUpController _controller = Get.put(
    SignUpController(DioService(dioInterceptor: DioInterceptor())),
  );
  final loginFormKey = GlobalKey<FormState>();

  PasswordSetup({super.key});

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
                      "OTP Verification".toUpperCase(),
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
                                  SizedBox(
                                    width: double.infinity,
                                    child: Pinput(
                                      controller: _controller.otpController,
                                      length: 4,
                                      onChanged: (v) {
                                        // handle OTP input
                                      },
                                      onCompleted: (v) {
                                        _controller.postSignup2();
                                      },
                                    ),
                                  ),

                                  // SizedBox(height: size.height * 0.04),
                                  SizedBox(height: size.height * 0.02),
                                  Utils.globalButton(
                                    context,
                                    "Verify Now",
                                    () {
                                      _controller.postSignup2();
                                    },
                                    size.width * 0.35,
                                    size.height * 0.04,
                                  ),

                                  SizedBox(height: size.height * 0.02),

                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Didn't get the code? "),
                                        GestureDetector(
                                          onTap:
                                              () => _controller.postSignup1(),
                                          child: Text(
                                            "Resend it",
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
