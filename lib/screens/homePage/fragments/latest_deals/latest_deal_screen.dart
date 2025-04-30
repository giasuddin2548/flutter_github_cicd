import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../datalayer/dataProviders/dio_interceptor.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';
import 'latestdeal_screen_controller.dart';

class LatestDealScreen extends StatelessWidget {
  final _controller = Get.put(
    LatestDealScreenController(DioService(dioInterceptor: DioInterceptor())),
  );

  const LatestDealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _controller.getProduct(context);
    final size = MediaQuery.of(context).size;

    return Obx(
      () => ListView.builder(
        itemCount: _controller.allProducts.length,
        itemBuilder: (context, index) {
          var d = _controller.allProducts[index];

          return Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.01,
              vertical: size.width * 0.01,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            height: size.width * 0.5,
            child: Image.memory(
              _controller.imageConvertor(d.image ?? ''),
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
