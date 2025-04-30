import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../datalayer/dataProviders/dio_interceptor.dart';
import '../../datalayer/dataProviders/dio_service.dart';
import 'new_install_controller.dart';

class BarcodeResult extends StatefulWidget {
  static const routeName = '/BarcodeResult';

  final String code;
  BarcodeResult(this.code, {super.key});

  @override
  _BarcodeResultState createState() => _BarcodeResultState();
}

class _BarcodeResultState extends State<BarcodeResult> {
  final _controller = Get.put(
    NewInstallController(DioService(dioInterceptor: DioInterceptor())),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // screen size

    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.03,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Enter Product Serial Number',
                  style: TextStyle(
                    fontSize: size.height * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  'Click the button below to scan the\nbarcode of the product',
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.05),
                CircleAvatar(
                  radius: size.width * 0.15,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(
                    Icons.barcode_reader,
                    size: size.width * 0.15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  'You can also write the serial number of\nthe product manually',
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.03),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Serial Number',
                    style: TextStyle(
                      fontSize: size.height * 0.022,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                TextField(
                  enabled: false,
                  controller: TextEditingController(text: widget.code),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.height * 0.02,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: size.height * 0.022,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: size.height * 0.2),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _controller.claimProduct(widget.code, context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.02,
                          ),
                        ),
                        child: Text(
                          'Verify',
                          style: TextStyle(
                            fontSize: size.height * 0.022,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.05),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.02,
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: size.height * 0.022,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
