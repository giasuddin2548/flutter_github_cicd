import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/screens/homePage/fragments/product/models/NetisProductModel.dart';
import 'package:flutter_github_cicd/screens/homePage/fragments/product/product_detail_screen.dart';

import '../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../utils/app_constent.dart';

class ProductScreenController extends GetxController {
  DioService dataProvider;
  ProductScreenController(this.dataProvider);

  var searchQuery = ''.obs;
  var isLoading = false.obs;

  final RxList<NetisProductModel> allProducts = <NetisProductModel>[].obs;
  final Rx<List<NetisProductModel>> filteredProducts =
      Rx<List<NetisProductModel>>([]);

  final imageUrls =
      <String>[
        "https://i.imgur.com/QkIa5tT.jpeg",
        "https://i.imgur.com/jb5Yu0h.jpeg",
        "https://i.imgur.com/UlxxXyG.jpeg",
      ].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();

    // Set up reaction for search filtering
    ever(searchQuery, (_) {
      filterProducts();
    });
  }

  void fetchProducts() async {
    isLoading.value = true;

    String url = '/all_product_list';
    try {
      await AppConstant.checkInternetConnection().then((value) async {
        if (value == true) {
          EasyLoading.show(status: 'Please wait..');
          Map<String, dynamic> d = {};
          var response = await dataProvider.postDataForm(
            urlEndPoint: url,
            data: {},
          );
          print("response fdfdsf");
          print(response.statusCode);
          print(response.requestOptions.uri);

          if (response.statusCode == 200) {
            var list = response.data['all_products'] as List;
            print(list);
            allProducts.clear();
            allProducts.addAll(
              list.map((e) => NetisProductModel.fromJson(e)).toList(),
            );
            filteredProducts.value = allProducts;
            isLoading.value = false;
          }
          print(response.statusCode);
        } else {
          AppConstant.internetConnectionAlertDialog();
        }
      });
    } catch (e, l) {
      print('Dashboard_api_error: $e');
      print('Dashboard_api_error_l: $l');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void filterProducts() {
    if (searchQuery.value.isEmpty) {
      filteredProducts.value = allProducts;
    } else {
      filteredProducts.value =
          allProducts
              .where(
                (product) =>
                    product.productName!.toLowerCase().contains(
                      searchQuery.value.toLowerCase(),
                    ) ||
                    product.productName!.toLowerCase().contains(
                      searchQuery.value.toLowerCase(),
                    ),
              )
              .toList();
    }
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void viewProductDetails(NetisProductModel product) {
    Get.toNamed(ProductDetailScreen.routeName);
  }

  Uint8List imageConvertor(String s) {
    Uint8List bytes = const Base64Decoder().convert(s);

    return bytes;
  }
}
