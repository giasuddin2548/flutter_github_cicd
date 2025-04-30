import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_github_cicd/screens/homePage/fragments/product/product_screen_controller.dart';
import '../../../../datalayer/dataProviders/dio_interceptor.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';
import 'models/NetisProductModel.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/ProductDetailScreen';
  final NetisProductModel productModel;

  ProductDetailScreen(this.productModel, {super.key});

  final _controller = Get.put(
    ProductScreenController(DioService(dioInterceptor: DioInterceptor())),
  );

  /*
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Ensures all icons are white
      ),
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          productModel.productName ?? '',
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // Ensures all icons are white
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // Image Slider
                  CarouselSlider.builder(
                    itemCount: _controller.imageUrls.length,
                    itemBuilder: (context, index, realIndex) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          _controller.imageUrls[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: constraints.maxHeight * 0.3,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: constraints.maxHeight * 0.3,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlay: true,
                      viewportFraction: 1.0,
                    ),
                  ),

                  const SizedBox(height: 12),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "${productModel.productCode ?? ''}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          productModel.productName ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Bullet points
                  const BulletPoint(
                    text:
                        'Dual-Band Wi-Fi 6; Equipped with the latest wireless technology.',
                  ),
                  const BulletPoint(text: 'Next-Gen 3000Mbps Speeds.'),
                  const BulletPoint(text: 'Connect More Devices.'),
                  const BulletPoint(text: 'Dual-Core Processing.'),
                  const BulletPoint(
                    text: 'Extensive Coverage: beamforming and four antennas.',
                  ),
                  const BulletPoint(
                    text:
                        'Backward Compatible: supports all previous 802.11 standards and all Wi-Fi devices.',
                  ),
                  const BulletPoint(
                    text: 'Easy setup and support App management conveniently.',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
