import 'package:stepper_a/stepper_a.dart';
import 'package:flutter_github_cicd/common_wigets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';
import '../../datalayer/dataProviders/dio_interceptor.dart';
import '../../datalayer/dataProviders/dio_service.dart';
import 'forgot_client_id_controller.dart';

class ForgotClientId extends StatelessWidget {
  static const routeName = '/forgot_clientId_screen';
  final StepController _controller = Get.put(
    StepController(DioService(dioInterceptor: DioInterceptor())),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).hintColor),
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Theme.of(context).cardColor,
          ),
        ),
        title: Text(
          'Forgot Passwrod',
          style: TextStyle(color: Theme.of(context).cardColor),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GetBuilder<StepController>(
        builder: (c) {
          return Container(
            color: Colors.white,
            child: StepperA(
              stepperSize: Size(Get.width, 90),
              borderShape: BorderShape.circle,
              borderType: BorderType.dash,
              stepperAxis: Axis.horizontal,
              lineType: LineType.dotted,

              stepperAController: c.stepperAController,
              stepperBackgroundColor: Colors.transparent,
              stepHeight: 30,
              stepWidth: 30,

              stepBorder: true,
              pageSwipe: false,
              lineThickness: 1,
              customSteps: [
                CustomSteps(title: "Basic Info", stepsIcon: Icons.person),
                CustomSteps(title: "OTP", stepsIcon: Icons.verified_outlined),
                CustomSteps(title: "Password", stepsIcon: Icons.password),
              ],
              step: StepA(
                currentStepColor: Colors.green,
                completeStepColor: Colors.indigo,
                inactiveStepColor: Colors.black45,
                completeStepIcon: Icons.check_box,
                margin: EdgeInsets.all(5),
              ),
              stepperBodyWidget: [
                _fpStep1(c, context),
                _SinStep2(c, context),
                _sinStep3(c, context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget stepNextBack(
    BuildContext context,
    String s,
    Color color,
    VoidCallback callback,
    double w,
  ) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Container(
        width: w,
        height: 20,
        alignment: Alignment.center,
        child: Text(s, style: TextStyle(fontSize: 12, color: Colors.white)),
      ),
    );
  }

  Widget _fpStep1(StepController c, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: _controller.step1FormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Recovery account",
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontFamily: "",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              // Container(
              //   // height: 70,
              //   margin: const EdgeInsets.only(bottom: 20),
              //   child: Text(
              //     "It's free to signup and only takes a minute.",
              //     style: TextStyle(color: Theme.of(context).hintColor,fontSize: 12),
              //   ),
              // ),
              // // _mobileField(),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontFamily: "",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              MyTextFieldd(
                editingController: _controller.emailController,
                enableOrDisable: true,
                hints: 'Enter your email',
                errorMessage: 'Please fill in this field.',
                inputType: TextInputType.emailAddress,
                isRequired: true,
              ),
              SizedBox(height: 10),

              Container(
                width: Get.width,
                margin: EdgeInsets.only(top: 20),
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppConstant.stepNextBack(context, 'Submit', Colors.red, () {
                      if (_controller.step1FormKey.currentState!.validate()) {
                        _controller.forgotPw1().then((value) {});
                      }
                    }, Get.width / 5),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _SinStep2(StepController c, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: _controller.step2FormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "OTP Verification",
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontFamily: "",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'OTP',
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontFamily: "",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              MyTextFieldd(
                editingController: _controller.otpController,
                enableOrDisable: true,
                hints: 'Enter your otp',
                errorMessage: 'Please fill in this field.',
                inputType: TextInputType.number,
                isRequired: true,
              ),

              Container(
                width: Get.width,
                margin: EdgeInsets.only(top: 20),
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppConstant.stepNextBack(
                      context,
                      'Verify Now',
                      Colors.red,
                      () {
                        if (_controller.step2FormKey.currentState!.validate()) {
                          _controller.forgotPw2().then((value) {});
                        }
                      },
                      Get.width / 5,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sinStep3(StepController c, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: _controller.step3FormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontFamily: "",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontFamily: "",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Obx(
                () => MyTextFielPass(
                  obscureText: !_controller.isPasswordShow.value,
                  editingController: _controller.passwordController,
                  enableOrDisable: true,
                  hints: 'Enter your password',
                  errorMessage: 'Please fill in this field.',
                  inputType: TextInputType.text,
                  isRequired: true,
                  widget: IconButton(
                    icon: Icon(
                      !_controller.isPasswordShow.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                    onPressed: () {
                      _controller.isPasswordShow.value =
                          !_controller.isPasswordShow.value;
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontFamily: "",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Obx(
                () => MyTextFielPass(
                  obscureText: !_controller.isConfPasswordShow.value,
                  editingController: _controller.confPasswordController,
                  enableOrDisable: true,
                  hints: 'Enter your confirm password',
                  errorMessage: 'Please fill in this field.',
                  inputType: TextInputType.text,
                  isRequired: true,
                  widget: IconButton(
                    icon: Icon(
                      !_controller.isConfPasswordShow.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                    onPressed: () {
                      _controller.isConfPasswordShow.value =
                          !_controller.isConfPasswordShow.value;
                    },
                  ),
                ),
              ),

              Container(
                width: Get.width,
                margin: EdgeInsets.only(top: 20),
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    stepNextBack(context, 'Submit', Colors.red, () {
                      if (_controller.step3FormKey.currentState!.validate()) {
                        _controller.forgotPw3();
                      }
                    }, Get.width / 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
