import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/screens/homePage/fragments/dashboard/dashboard_screen.dart';
import 'package:flutter_github_cicd/screens/homePage/fragments/settings/changePassPage/change_pass_screen.dart';

import 'package:flutter_github_cicd/screens/loginPage/login_page.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';
import '../../datalayer/models/NotificationModel.dart';
import '../../utils/secure_service.dart';

import 'fragments/latest_deals/latest_deal_screen.dart';
import 'fragments/live_chat/live_chat_screen.dart';
import 'fragments/personal_info/personal_info.dart';
import 'fragments/product/product_screen.dart';

class HomeController extends GetxController {
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userImageUrl = ''.obs;
  var screenPosition = 0.obs;
  var navPosition = 0.obs;

  var notificationModel = <NotificationModel>[].obs;
  @override
  void onInit() async {
    userName.value = await SecureService().getStringSessionData(
      AppConstant.userName,
    );
    userEmail.value =
        "User ID: ${await SecureService().getStringSessionData(AppConstant.userEmployee_id)}";
    userImageUrl.value = await SecureService().getStringSessionData(
      AppConstant.userProfile_image,
    );

    super.onInit();
  }

  var screenHeader = [
    'Home', //0
    'Payment Request', //0
    'Change Password', //0

    'Payment Method', //1
    'History', //2
    'Reward Policy', //6

    'Support', //6
    'Privacy Policy', //6
    'Logout', //6

    'Product', //6
    'Promotion', //6
    'Profile', //6
  ];

  var screenList = [
    DashboardScreen(), //0
    Container(), //0
    Container(), //0

    Container(), //1
    Container(), //1
    Container(), //2

    LiveChatScreen(), //2
    Container(), //2
    Container(), //3
    ProductScreen(), //17
    LatestDealScreen(), //17
    PersonalInfo(), //17
  ];

  void tempNameChange() {
    // Get.put(HomeController()).screenPosition.value=14;
    // screenPosition.value=14;
    // update();
  }

  var screenDrawerIcon = [
    Icon(Icons.home, color: AppConstant.buttonColor()), //0
    Icon(Icons.payments_outlined, color: AppConstant.buttonColor()), //0
    Icon(Icons.password_outlined, color: AppConstant.buttonColor()), //1

    Icon(Icons.payment_outlined, color: AppConstant.buttonColor()), //1
    Icon(Icons.history_outlined, color: AppConstant.buttonColor()), //2
    Icon(Icons.policy_outlined, color: AppConstant.buttonColor()), //2

    Icon(Icons.support_agent_outlined, color: AppConstant.buttonColor()), //3
    Icon(Icons.privacy_tip_outlined, color: AppConstant.buttonColor()), //3
    Icon(Icons.login_outlined, color: AppConstant.buttonColor()), //4

    Icon(Icons.shopping_bag_outlined, color: AppConstant.buttonColor()), //3
    Icon(Icons.add_alert_rounded, color: AppConstant.buttonColor()), //3
    Icon(Icons.person, color: AppConstant.buttonColor()), //4
  ];

  void menuClicked(String name) {
    if (name.contains('Change Password')) {
      debugPrint('Password clicked');
      Get.toNamed(ChangePassScreen.routeName);
    } else {
      debugPrint('Logout clicked');
      Get.defaultDialog(
        backgroundColor: Colors.white,
        title: 'Logout!',
        titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        middleText: 'Do you want to logout!',
        middleTextStyle: TextStyle(color: Colors.black),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'No',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _logout();
              Get.back();
              Get.offNamedUntil(LoginPage.routeName, (route) => false);
            },
            child: Text(
              'Yes',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      );
    }
  }

  void _logout() async {
    // var typeOfLogout=await SecureService().getStringSessionData(AppConstant.userType);
    // if("${typeOfLogout}"=="1"){
    //   Get.offAll(() => LoginPage(""));
    // }else{
    //   Get.offAll(() => ChildLoginScreen());
    // }
  }
}
