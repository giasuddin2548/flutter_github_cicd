import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';
import '../../../../../datalayer/dataProviders/dio_interceptor.dart';
import '../../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../../utils/Utils.dart';
import 'change_pass_controller.dart';

class ChangePassScreen extends StatelessWidget {
  static const routeName = '/change_pass_screen';
  final ChangePassController _controller = Get.put(
    ChangePassController(DioService(dioInterceptor: DioInterceptor())),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.scaffoldColor(),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 40),
        decoration: BoxDecoration(
          color: AppConstant.textColorMain(),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          // color: AppConstant.myMainColor().withOpacity(.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: Form(
                      key: _controller.forgotFormKey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 20),
                            child: Text(
                              "Update Password",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "",
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),

                          _currentPasswordField(),
                          _newPasswordField(),
                          _confirmPasswordField(),

                          ///debugPrintin button
                          Utils.globalButton(
                            context,
                            "Submit",
                            () {
                              if (_controller.forgotFormKey.currentState!
                                  .validate()) {
                                _controller.changePassword();
                                // if(_controller.checkRemember.value==false){
                                //   AppConstant.showMyToast("please check the box");
                                // }else{
                                // Get.toNamed(debugPrintinOtpScreen.routeName);
                                // }
                              }
                            },
                            MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.width / 10,
                          ),
                          // ElevatedButton(
                          //
                          //
                          //   onPressed: () {
                          //     if(_controller.debugPrintinFormKey.currentState!.validate()){
                          //       _controller.changePassword();
                          //     }
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //       padding: EdgeInsets.zero,
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius:
                          //           BorderRadius.circular(180))),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //         color: AppConstant.myButtonColor(),
                          //         borderRadius:
                          //         BorderRadius.circular(180),
                          //       boxShadow: const [
                          //         BoxShadow(
                          //           color: Color(0xff63B2A3),
                          //           // color: AppConstant.myMainColor().withOpacity(.5),
                          //           spreadRadius: 2,
                          //           blurRadius: 7,
                          //           offset:
                          //           Offset(0, 0), // changes position of shadow
                          //         ),
                          //       ],
                          //     ),
                          //     width: 70 / 100 * Get.size.width,
                          //     height: 40,
                          //     alignment: Alignment.center,
                          //     child: const Text(
                          //       'Submit',
                          //       style: TextStyle(fontSize: 15),
                          //     ),
                          //   ),
                          // ),

                          // SizedBox(height: 10,),
                          Container(
                            color: Colors.yellow,
                            // height: 10,
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(bottom: 20),
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _currentPasswordField() {
    return Container(
      height: 70,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Obx(
        () => TextFormField(
          obscureText: !_controller.isCurrentPasswordShow.value,
          style: TextStyle(fontSize: 14),
          cursorColor: Colors.black,
          controller: _controller.tEControllerCurrentPass,
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 11.0, color: Colors.red),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: 'Current Password',
            labelStyle: TextStyle(fontSize: 14),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.lock_outlined,
              color: Colors.black,
              size: 18,
            ),
            contentPadding: EdgeInsets.only(top: 0, left: 25),
            // label: Text('Email or Mobile No.', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
            suffixIcon: IconButton(
              icon: Icon(
                !_controller.isCurrentPasswordShow.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                size: 18,
                color: Colors.black,
              ),
              onPressed: () {
                _controller.isCurrentPasswordShow.value =
                    !_controller.isCurrentPasswordShow.value;
              },
            ),
          ),

          validator: (v) {
            if (v!.isEmpty) return "Please fill in this field.";

            return null;
          },
        ),
      ),
    );
  }

  Widget _newPasswordField() {
    return Container(
      height: 70,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Obx(
        () => TextFormField(
          obscureText: !_controller.isNewPasswordShow.value,
          style: TextStyle(fontSize: 14),
          cursorColor: Colors.black,
          controller: _controller.tEControllerNewPass,
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 11.0, color: Colors.red),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: 'New Password',
            labelStyle: TextStyle(fontSize: 14),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.lock_outlined,
              color: Colors.black,
              size: 18,
            ),
            contentPadding: EdgeInsets.only(top: 0, left: 25),
            // label: Text('Email or Mobile No.', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
            suffixIcon: IconButton(
              icon: Icon(
                !_controller.isNewPasswordShow.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                size: 18,
                color: Colors.black,
              ),
              onPressed: () {
                _controller.isNewPasswordShow.value =
                    !_controller.isNewPasswordShow.value;
              },
            ),
          ),

          validator: (v) {
            if (v!.isEmpty) return "Please fill in this field.";

            return null;
          },
        ),
      ),
    );
  }

  Widget _confirmPasswordField() {
    return Container(
      height: 70,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Obx(
        () => TextFormField(
          obscureText: !_controller.isConfirmPasswordShow.value,
          style: TextStyle(fontSize: 14),
          cursorColor: Colors.black,
          controller: _controller.tEControllerConfirmPass,
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 11.0, color: Colors.red),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: 'Confirm Password',
            labelStyle: TextStyle(fontSize: 14),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.lock_outlined,
              color: Colors.black,
              size: 18,
            ),
            contentPadding: EdgeInsets.only(top: 0, left: 25),
            // label: Text('Email or Mobile No.', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
            suffixIcon: IconButton(
              icon: Icon(
                !_controller.isConfirmPasswordShow.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                size: 18,
                color: Colors.black,
              ),
              onPressed: () {
                _controller.isConfirmPasswordShow.value =
                    !_controller.isConfirmPasswordShow.value;
              },
            ),
          ),

          validator: (v) {
            if (v!.isEmpty) return "Please fill in this field.";

            return null;
          },
        ),
      ),
    );
  }
}
