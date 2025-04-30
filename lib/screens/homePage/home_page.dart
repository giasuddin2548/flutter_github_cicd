import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/screens/homePage/home_controller.dart';
import 'package:flutter_github_cicd/common_wigets/main_drawer.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';

import '../new_install/new_install_screen.dart';

//ignore: must_be_immutable
class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  // final _controller = Get.put(NotificationController(DioService(dioInterceptor: DioInterceptor())));
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await Get.defaultDialog(
          title: 'Alert!',
          titleStyle: TextStyle(
            color: AppConstant.mySecondaryColor(),
            fontWeight: FontWeight.bold,
          ),
          middleText: 'Do you want to Exit!',
          middleTextStyle: TextStyle(color: AppConstant.mySecondaryColor()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'No',
                style: TextStyle(
                  color: AppConstant.myMainColor(),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  color: AppConstant.myMainColor(),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
          ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Theme.of(context).hintColor, //change your color here
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: GetX<HomeController>(
            builder:
                (c) => Text(
                  c.screenHeader[c.screenPosition.value],
                  style: TextStyle(color: Theme.of(context).cardColor),
                ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(MyScannerScreen.routeName);

                // Get.to(() => BarcodeResult("244860058718"));
              },
              icon: Icon(Icons.qr_code_scanner_sharp, color: Colors.white),
            ),
          ],
          // actions: [
          //   /*
          //   ValueListenableBuilder(
          //     valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
          //     builder: (_, mode, child) {
          //       return Container(
          //         child: Switch(
          //             value: mode == AdaptiveThemeMode.light
          //                 ?false
          //                 :true,
          //             onChanged: (v){
          //           AdaptiveTheme.of(context).toggleThemeMode();
          //         }),
          //       );
          //     },
          //   )
          //
          //    */
          //
          //   Obx((){
          //     var tmp=0;
          //
          //     if(_controller.notificationModel.isEmpty){
          //       tmp=0;
          //     }else{
          //       tmp=_controller.notificationModel.length;
          //     }
          //
          //     return badges.Badge(
          //       onTap: (){
          //         Get.toNamed(NotificationScreen.routeName);
          //       },
          //       badgeContent: Text("$tmp"),
          //       child: Icon(Icons.notifications),
          //     );
          //   }),
          //   SizedBox(width: 20,)
          // ],
        ),
        body: GetX<HomeController>(
          builder:
              (homeCon) => homeCon.screenList[homeCon.screenPosition.value],
        ),
        drawer: MainDrawer(),
        bottomNavigationBar: GetX<HomeController>(
          builder:
              (homeCon) => BottomNavigationBar(
                currentIndex: homeCon.navPosition.value,
                onTap: (index) {
                  if (index == 1) {
                    homeCon.screenPosition.value = 9;
                    homeCon.navPosition.value = index;
                  } else if (index == 2) {
                    homeCon.screenPosition.value = 10;
                    homeCon.navPosition.value = index;
                  } else if (index == 3) {
                    homeCon.screenPosition.value = 11;
                    homeCon.navPosition.value = index;
                  } else {
                    homeCon.screenPosition.value = index;
                    homeCon.navPosition.value = index;
                  }
                },
                selectedItemColor:
                    Theme.of(context).primaryColor, // Active item color
                unselectedItemColor: Colors.grey, // Inactive items
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shop),
                    label: 'Product',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Promotion',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
