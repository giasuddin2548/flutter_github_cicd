import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../datalayer/dataProviders/dio_interceptor.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';

import 'add_account_controller.dart';

//  final _controller=Get.put(AddAccountController(DioService(dioInterceptor: DioInterceptor())));
class AddAccountScreen extends StatelessWidget {
  static const routeName = '/add_account_screen';
  final _controller = Get.put(
    AddAccountController(DioService(dioInterceptor: DioInterceptor())),
  );

  const AddAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _controller.currentStep.value = 0;
    return Obx(
      () => Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Stepper(
          controlsBuilder: (context, control) {
            return Row(
              children: [
                TextButton(
                  onPressed: () {
                    _controller.nextStep();
                  },
                  child:
                      _controller.currentStep.value == 0
                          ? Text('Submit')
                          : Text('Verify Now'),
                ),

                // TextButton(
                //   onPressed: onStepCancel,
                //   child: const Text('EXIT'),
                // ),
              ],
            );
          },
          type: StepperType.vertical,
          currentStep: _controller.currentStep.value,

          // onStepContinue: _controller.nextStep,
          // onStepCancel: _controller.previousStep,
          steps: [
            /*
              Map<String, dynamic> mapData={
      "email": emailController.text,
      "contact_number": mobileNoController.text,
      "portfolio_code": boCodeController.text
    };
           */
            Step(
              title: const Text('Primary Account'),

              content: Column(
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: _controller.boCodeController,
                    decoration: const InputDecoration(
                      labelText: 'Portfolio Code',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _controller.mobileNoController,
                    decoration: const InputDecoration(
                      labelText: 'Contact Number',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),
                  TextField(
                    controller: _controller.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  //
                  // Row(
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.zero, // Ensure no margin
                  //       padding: EdgeInsets.zero, // Ensure no padding
                  //       child: Checkbox(
                  //         value: false,
                  //         onChanged: (v) {},
                  //       ),
                  //     )
                  //
                  //
                  //
                  //   ],
                  // )
                ],
              ),
              isActive: _controller.currentStep.value >= 0,
              state:
                  _controller.currentStep.value > 0
                      ? StepState.complete
                      : StepState.indexed,
            ),
            Step(
              title: const Text('Verify OTP'),
              content: Column(
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: _controller.otpController,
                    decoration: const InputDecoration(
                      labelText: 'OTP',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              isActive: _controller.currentStep.value >= 1,
              state:
                  _controller.currentStep.value == 1
                      ? StepState.indexed
                      : StepState.complete,
            ),
          ],
        ),
      ),
    );
  }
}
