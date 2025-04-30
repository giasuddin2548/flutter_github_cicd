import 'package:get/get.dart';
import 'package:flutter_github_cicd/screens/homePage/home_controller.dart';
import 'package:flutter_github_cicd/screens/loginPage/login_controller.dart';
import 'package:flutter_github_cicd/screens/splashPage/splash_controller.dart';
import '../datalayer/dataProviders/dio_service.dart';
import '../datalayer/dataProviders/dio_interceptor.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LoginController>(
      () => LoginController(DioService(dioInterceptor: DioInterceptor())),
    );
  }
}
