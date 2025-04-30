import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_github_cicd/common_wigets/list_item_actions.dart';
import 'package:permission_handler/permission_handler.dart';

class AppConstant {
  static const String token = 'netis_token';
  static const String claimProductProduct_model =
      'netis_claimProductProduct_model';
  static const String serialNo = 'netis_claimProductProduct_serial';
  static const String userId = 'netis_user_id';
  static const String userEmployee_id = 'netis_employee_id';
  static const String userEmail = 'netis_userEmail';

  static const String userPhone = 'netis_phoneno';
  static const String userProfile_image = 'netis_profile_image';
  static const String userName = 'netis_name';

  static Color myMainColor() {
    // return Color(0xff0072BB);
    return Color(0xff0085DB);
  }

  static Color myButtonColor() {
    return Color(0xff052C47);
  }

  static Color mySecondaryColor() {
    return Colors.grey;
  }

  static Color myThirdColor() {
    return Color(0xffF58220);
  }

  static Color textColorMain() {
    return Color(0xffffffff);
  }

  static Color scaffoldColor() {
    return Color(0xfff6f6f6);
  }

  static Color buttonColor() {
    return Color(0xff044386);
  }

  static Color backgroundColor() {
    return Color(0xffEAEDF7);
  }

  static Future<bool> storagePermission() async {
    final DeviceInfoPlugin info =
        DeviceInfoPlugin(); // import 'package:device_info_plus/device_info_plus.dart'
    bool havePermission = false;
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await info.androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        final request =
            await [
              Permission.videos,
              Permission.photos,
              Permission.storage,
              //..... as needed
            ].request(); //import 'package:permission_handler/permission_handler.dart';

        havePermission = request.values.every(
          (status) => status == PermissionStatus.granted,
        );
      } else {
        final status = await Permission.storage.request();
        havePermission = status.isGranted;
      }

      if (!havePermission) {
        // if no permission then open app-setting
        await openAppSettings();
      }

      return havePermission;
    } else if (Platform.isIOS) {
      final status = await Permission.storage.request();
      if (status.isGranted) {
        havePermission = status.isGranted;
      }
    }

    return havePermission;
  }

  static timerMarketPlace(BuildContext context) {
    return Container();
    /*
    return Column(
      children: [
        TimerBuilder.periodic(Duration(seconds: 1),
            builder: (context) {
              var currentTime = DateTime.now();
              String seconds = currentTime.second < 10
                  ? "0${currentTime.second}"
                  : "${currentTime.second}";
              String minute = currentTime.minute < 10
                  ? "0${currentTime.minute}"
                  : "${currentTime.minute}";
              String hours = currentTime.hour < 10
                  ? "0${currentTime.hour}"
                  : "${currentTime.hour}";
              return Text(
                '$hours:$minute:$seconds',
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Theme.of(context).hintColor),
              );
            }),
        Text(
          "Market Status: ${getMarketStatus()}",
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Theme.of(context).hintColor),
        ),
      ],
    );

     */
  }

  static String getMarketStatus() {
    DateTime now = DateTime.now();
    DateTime openTime = DateTime(now.year, now.month, now.day, 10);
    DateTime closeTime = DateTime(now.year, now.month, now.day, 14, 30);

    if (now.isAfter(openTime) && now.isBefore(closeTime)) {
      return 'Open';
    } else {
      return 'Closed';
    }
  }

  static BoxShadow myBoxShadow1() {
    return BoxShadow(
      color: AppConstant.myMainColor().withOpacity(0.3),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    );
  }

  static BoxShadow myBoxShadow2() {
    return BoxShadow(
      color: AppConstant.myMainColor().withOpacity(0.1),
      spreadRadius: 3,
      blurRadius: 3,
      offset: Offset(0, 3), // changes position of shadow
    );
  }

  static showUpdateWaringMSG(
    BuildContext c,
    String bodyMessage,
    VoidCallback yesButton,
  ) async {
    return showDialog(
      context: c,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          child: DelayedDisplay(
            delay: Duration(seconds: 0),
            child: CupertinoAlertDialog(
              content: Container(
                height: 220.0,
                width: 225.0,
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.warning_rounded, color: Colors.red, size: 100),

                    SizedBox(height: 10),

                    Text(
                      bodyMessage,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),

                    SizedBox(height: 10),

                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      // color: HexColor("#F9A825"),
                      color: Colors.green,
                      onPressed: yesButton,
                      child: Text(
                        "Update Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          onWillPop: () async => false,
        );
      },
    );
  }

  static showDeleteWaringMSG(
    BuildContext c,
    String bodyMessage,
    VoidCallback yesButton,
  ) async {
    return showDialog(
      context: c,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          child: DelayedDisplay(
            delay: Duration(seconds: 0),
            child: CupertinoAlertDialog(
              content: Container(
                // height: 220.0,
                width: 225.0,
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.warning_rounded, color: Colors.red, size: 100),

                    SizedBox(height: 10),

                    Text(
                      bodyMessage,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),

                    SizedBox(height: 10),

                    FittedBox(
                      child: Row(
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            // color: HexColor("#F9A825"),
                            color: Colors.green,
                            onPressed: yesButton,
                            child: Text(
                              "Yes, delete it!",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 5),

                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            // color: HexColor("#F9A825"),
                            color: Colors.grey,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          onWillPop: () async => false,
        );
      },
    );
  }

  static String openDatePickerDiadebugPrintBox(String msg) {
    var yourSelectedDate = '';

    Get.bottomSheet(
      Container(
        height: 40 / 100 * Get.size.height,
        decoration: BoxDecoration(
          color: AppConstant.scaffoldColor(),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              // color: Colors.red,
              margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
              height: 5 / 100 * Get.size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListItemActions(
                    corner: 'dfd',
                    align: 'ss',
                    title: 'Cancel',
                    size: 20 / 100 * Get.size.width,
                    position: 1,
                    callback: () {
                      Get.back();
                    },
                  ),
                  Text(
                    msg,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  ListItemActions(
                    corner: 'dfd',
                    align: 'ss',
                    title: 'Confirm',
                    size: 20 / 100 * Get.size.width,
                    position: 1,
                    callback: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
            Divider(height: 1),
            SizedBox(
              // color: Colors.yellow,
              height: 20 / 100 * Get.size.height,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime(2001, 1, 1),
                onDateTimeChanged: (DateTime newDateTime) {
                  yourSelectedDate = '$newDateTime';
                },
              ),
            ),
          ],
        ),
      ),
    );
    return yourSelectedDate;
  }

  static String dateFormat(String substring) {
    var inputFormat = DateFormat('MM/dd/yyyy');
    var inputDate = inputFormat.parse(substring); // <-- dd/MM 24H format
    var outputFormat = DateFormat('dd-MMM-yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String dateFormatHipen(String substring) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(substring); // <-- dd/MM 24H format
    var outputFormat = DateFormat('dd-MMM-yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String dateFormatHipenWithTime(String substring) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(substring); // <-- dd/MM 24H format
    var outputFormat = DateFormat('yyyy-MMM-dd-HHmmss');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String currentTimeWithFormat() {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(
      '${DateTime.now()}',
    ); // <-- dd/MM 24H format
    var outputFormat = DateFormat('dd-MMM-yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String dateFormatSplash(String substring) {
    var inputFormat = DateFormat('MM/dd/yyyy');
    var inputDate = inputFormat.parse(substring); // <-- dd/MM 24H format
    var outputFormat = DateFormat('dd-MMM-yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static bool sharedKeyUserExist = false;
  static const String REMEMBER_ME_CLICKED = "REMEMBER_ME";
  static const String REMEMBER_USERID = "REMEMBER_USERID";
  static String sharedKeyUserName = 'CSIAM_NAME';
  static String sharedKeyUserEmail = 'CSIAM_EMAIL';
  static String sharedKeyUserPhone = 'CSIAM_PHONE';
  static String sharedKeyUserToken = 'CSIAM_TOKEN';
  static String sharedInvestorCode = 'CSIAM_Investor_Code';

  static String singleValueFormat(String v1) {
    double value1 = double.parse(v1.toString());
    String value = NumberFormat.decimalPattern().format(value1);
    return value;
  }

  static Future<bool> checkInternetConnection() async {
    bool isAvailable = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      debugPrint('Internet Connection available ');
      isAvailable = true;
    } else {
      debugPrint('No Internet Connection available ');
      isAvailable = false;
    }
    return isAvailable;
  }

  static void showMyToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Widget stepNextBack(
    BuildContext context,
    String s,
    Color color,
    VoidCallback callback,
    double w,
  ) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Container(
        width: w,
        height: 20,
        alignment: Alignment.center,
        child: Text(
          textAlign: TextAlign.center,
          s,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }

  static void showMySnackbar(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      backgroundColor: myMainColor(),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      // boxShadows: [BoxShadow(color: Colors.black)],
    );

    // Fluttertoast.showToast(
    //   msg: msg,
    //   backgroundColor: myMainColor(),
    //   textColor: Colors.white,
    //
    //
    // );
  }

  static void internetConnectionAlertDialog() {
    Get.defaultDialog(
      title: 'No Internet',
      titleStyle: TextStyle(
        color: AppConstant.mySecondaryColor(),
        fontWeight: FontWeight.bold,
      ),
      content: Container(
        alignment: Alignment.center,
        // color: Colors.grey,
        height: 52 / 100 * Get.size.width,
        width: 60 / 100 * Get.size.width,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              // color: Colors.red,
              height: 52 / 100 * Get.size.width,
              width: 60 / 100 * Get.size.width,
              child: Lottie.asset('assets/anim/nonet.json'),
            ),

            // Container(
            //   // color: Colors.yellow,
            //   height: 8/100*Get.size.width,
            //   width: 60/100*Get.size.width,
            //   child: Center(child: Text('No Internet Connection', style: TextStyle(color: AppConstant.mySecondaryColor()),)),
            //
            // ),
          ],
        ),
      ),
    );
  }

  static void myPopup(String msg1, String msg2, String msg3) {
    Get.defaultDialog(
      title: '',
      content: Container(
        margin: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.center,
        // color: Colors.grey,
        height: 35 / 100 * Get.size.width,
        width: 70 / 100 * Get.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close, color: Colors.red),
                ),
              ],
            ),
            Text(
              msg1,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //   backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      // Get.to(InvestorRegPage());
                    },
                    child: Text(
                      msg2,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // backgroundColor: AppConstant.myMainColor(),
                    ),
                    onPressed: () {},
                    child: Text(
                      msg3,
                      style: const TextStyle(
                        fontSize: 16,
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
    );
  }

  static Future<void> myPopup2(
    BuildContext context,
    String msg1,
    String msg2,
    String msg3,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DelayedDisplay(
          delay: const Duration(seconds: 0),
          child: CupertinoAlertDialog(
            content: Container(
              height: 150.0,
              width: 225.0,
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          AppConstant.myPopup2(
                            context,
                            msg1,
                            msg2,
                            msg3,
                          ).ignore();
                        },
                        icon: const Icon(Icons.close, color: Colors.red),
                      ),
                    ],
                  ),
                  Text(
                    msg1,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            //    backgroundColor: Colors.red,
                          ),
                          onPressed: () {},
                          child: Text(
                            msg2,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            //  backgroundColor: AppConstant.myMainColor(),
                          ),
                          onPressed: () {},
                          child: Text(
                            msg3,
                            style: const TextStyle(
                              fontSize: 16,
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
        );
      },
    );
  }

  static void internetErrorAlert(String title, String msg) {
    Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(
        color: AppConstant.mySecondaryColor(),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      content: Container(
        alignment: Alignment.center,
        // color: Colors.grey,
        height: 60 / 100 * Get.size.width,
        width: 60 / 100 * Get.size.width,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              // color: Colors.red,
              height: 52 / 100 * Get.size.width,
              width: 60 / 100 * Get.size.width,
              child: Lottie.asset('assets/anim/alert.json'),
            ),
            SizedBox(
              // color: Colors.yellow,
              height: 8 / 100 * Get.size.width,
              width: 60 / 100 * Get.size.width,
              child: Center(
                child: Text(
                  msg,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppConstant.mySecondaryColor(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String dateTimeChartFormat(String s) {
    //Oct 03, 2019
    var inputFormat = DateFormat('MMM dd, yyyy');
    var inputDate = inputFormat.parse(s); // <-- dd/MM 24H format
    var outputFormat = DateFormat('dd-MM-yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  // primaryColor: AppConstant.myMainColor(),
  // accentColor: Color(0xff333333),
  // hoverColor: Color(0xff333333),

  static Widget html(String d) {
    return Container(
      // data: d,
      // // style: {'title':Style},
    );
  }
}
