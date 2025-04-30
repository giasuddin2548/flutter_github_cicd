import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/homePage/home_controller.dart';

class MainDrawer extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),

                    // Circular profile image
                    Obx(
                      () => CircleAvatar(
                        radius: 30, // Adjust size as needed
                        backgroundImage:
                            _controller.userImageUrl.value.isNotEmpty
                                ? NetworkImage(_controller.userImageUrl.value)
                                : AssetImage('assets/images/user.jpg')
                                    as ImageProvider,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),

                    Obx(
                      () => Text(
                        _controller.userName.value,
                        style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        _controller.userEmail.value.toString(),
                        style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _drawerListItem(context, 0),
            Container(height: 1, color: Colors.black12),
            _drawerListItem(context, 1),
            Container(height: 1, color: Colors.black12),
            _drawerListItem(context, 2),
            Container(height: 1, color: Colors.black12),
            _drawerListItem(context, 3),
            Container(height: 1, color: Colors.black12),
            _drawerListItem(context, 4),
            Container(height: 1, color: Colors.black12),
            _drawerListItem(context, 5),
            Container(height: 1, color: Colors.black12),
            _drawerListItem(context, 6),
            Container(height: 1, color: Colors.black12),
            _drawerListItem(context, 7),
            Container(height: 1, color: Colors.black12),
            _drawerListItem(context, 8),
          ],
        ),
      ),
    );
  }

  Widget _drawerListItem(BuildContext context, int position) {
    HomeController controller1 = Get.find<HomeController>();
    return Container(
      // color: Colors.green,
      margin: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.white
        color:
            _controller.screenPosition.value == position
                ? Theme.of(context).hintColor.withOpacity(.2)
                : null,
        // color: AppConstant.myMainColor().withOpacity(0.2)
      ),
      child: ListTile(
        title: Text(
          controller1.screenHeader[position],
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
        leading: controller1.screenDrawerIcon[position],
        onTap: () {
          if (position == 8) {
            Get.back();
            controller1.menuClicked('debugPrintout');
          } else {
            controller1.screenPosition.value = position;
            controller1.navPosition.value = 0;
            debugPrint('Position${_controller.screenPosition.value}');
            Get.back();
          }
        },
      ),
    );
  }
}
