import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_github_cicd/screens/new_install/barcode_result.dart';

class MyScannerScreen extends StatefulWidget {
  static const routeName = '/MyScannerScreen';

  const MyScannerScreen({super.key});

  @override
  _MyScannerScreenState createState() => _MyScannerScreenState();
}

class _MyScannerScreenState extends State<MyScannerScreen> {
  bool _isScanning = true; // Flag to prevent multiple pushes
  MobileScannerController mobileScannerController = MobileScannerController();
  bool _torchEnabled = false; // Track torch state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: mobileScannerController,
            onDetect: (BarcodeCapture capture) {
              if (!_isScanning) return; // Prevent multiple scans

              final Barcode barcode = capture.barcodes.first;
              final String? code = barcode.rawValue;

              if (code != null) {
                _isScanning = false; // Stop scanning

                // Use GetX navigation instead of MaterialPageRoute
                Get.to(() => BarcodeResult(code))?.then((_) {
                  _isScanning = true; // Reset after returning
                });
              }
            },
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 20,
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
          Positioned(
            top: MediaQuery.of(context).padding.top + 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _torchEnabled = !_torchEnabled; // Toggle torch state
                });
              },
              child: ClipOval(
                child: Container(
                  color: Colors.white12,
                  height: 40,
                  width: 40,
                  child: Icon(
                    _torchEnabled ? Icons.light_mode : Icons.flash_off,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
