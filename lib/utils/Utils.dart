import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  static Future<void> showMyAlertDialog(
    BuildContext context,
    String bodyMessage,
    VoidCallback yesButton,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DelayedDisplay(
          delay: Duration(seconds: 0),
          child: CupertinoAlertDialog(
            content: Container(
              height: 160.0,
              width: 120.0,
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Icon(
                  //   Icons.warning_rounded,
                  //   color: Colors.red,
                  //   size: 100,
                  // ),
                  //
                  // SizedBox(height: 20,),
                  Text(
                    bodyMessage,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     MaterialButton(
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(5.0))
                  //       ),
                  //
                  //       color: Colors.red,
                  //       onPressed: () {
                  //         Navigator.pop(context);
                  //       },
                  //       child: Text("No", style: TextStyle(color: Colors.white),),),
                  //     // MaterialButton(
                  //     //   shape: RoundedRectangleBorder(
                  //     //       borderRadius: BorderRadius.all(Radius.circular(5.0))
                  //     //   ),
                  //     //   // color: HexColor("#F9A825"),
                  //     //   color: Colors.green,
                  //     //   onPressed: yesButton,
                  //     //   child: Text("Yes", style: TextStyle(color: Colors.white),),),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static String singleValueFormat(String v1) {
    var value = "";
    try {
      if (v1.isEmpty ||
          v1 == '' ||
          v1 == 'null' ||
          v1 == 'Null' ||
          v1 == '-' ||
          v1 == 'NULL') {
        value = '0';
      } else {
        if (v1.contains(',')) {
          var tmp = v1.replaceAll(',', '');
          double value1 = double.parse(tmp.toString());
          value = NumberFormat.decimalPattern().format(value1);
        } else {
          double value1 = double.parse(v1.toString());
          value = NumberFormat.decimalPattern().format(value1);
        }
      }
    } catch (e) {
      value = v1;
    }
    return value;
  }

  static String stringValidation(String v1) {
    var value = "";

    if (v1.isEmpty ||
        v1 == '' ||
        v1 == 'null' ||
        v1 == 'Null' ||
        v1 == '-' ||
        v1 == 'NULL' ||
        v1 == ',') {
      value = '';
    } else {
      value = v1;
    }
    return value;
  }

  static String genderValidation(String v1) {
    var value = "";

    if (v1.isEmpty ||
        v1 == '' ||
        v1 == 'null' ||
        v1 == 'Null' ||
        v1 == '-' ||
        v1 == 'NULL') {
      value = '';
    } else {
      if (v1.toLowerCase() == 'm') {
        value = 'Male';
      } else if (v1.toLowerCase() == 'f') {
        value = 'Female';
      } else {
        value = 'Others';
      }
    }
    return value;
  }

  static String dateFormatHyphen(String substring) {
    var finalDateToFormat = "";
    try {
      if (substring.isEmpty ||
          substring == '' ||
          substring == 'null' ||
          substring == 'Null' ||
          substring == '-' ||
          substring == 'NULL') {
        finalDateToFormat = '';
      } else {
        ///Old
        // var inputFormat = DateFormat('yyyy-MM-dd');
        // var inputDate = inputFormat.parse(substring); // <-- dd/MM 24H format
        // var outputFormat = DateFormat('dd-MMM-yyyy');
        // finalDateToFormat = outputFormat.format(inputDate);

        //dynamic updated
        finalDateToFormat = DateFormat.yMMMd().format(
          DateTime.parse(substring),
        );
      }

      return finalDateToFormat;
    } catch (e) {
      return substring;
    }
  }

  static String dateFormatDash(String substring) {
    // ///print("dfksdfkasdfjasdkfa $substring");
    var finalDateToFormat = "";
    try {
      if (substring.isEmpty ||
          substring == '' ||
          substring == 'null' ||
          substring == 'Null' ||
          substring == '-' ||
          substring == 'NULL') {
        finalDateToFormat = '';
      } else {
        ///Old
        var inputFormat = DateFormat('dd/MM/yyyy');
        var inputDate = inputFormat.parse(substring); // <-- dd/MM 24H format
        var outputFormat = DateFormat('yyyy-MM-dd');
        finalDateToFormat = outputFormat.format(inputDate);

        //dynamic updated
        // finalDateToFormat = DateFormat.yMMMd().format(DateTime.parse(substring));
      }

      return finalDateToFormat;
    } catch (e) {
      return substring;
    }
  }

  static String dateFormatDash2(String substring) {
    // ///print("dfksdfkasdfjasdkfa $substring");
    var finalDateToFormat = "";
    try {
      if (substring.isEmpty ||
          substring == '' ||
          substring == 'null' ||
          substring == 'Null' ||
          substring == '-' ||
          substring == 'NULL') {
        finalDateToFormat = '';
      } else {
        ///Old
        var inputFormat = DateFormat('yyyy-MM-dd');
        var inputDate = inputFormat.parse(substring); // <-- dd/MM 24H format
        var outputFormat = DateFormat('dd/MM/yyyy');
        finalDateToFormat = outputFormat.format(inputDate);

        //dynamic updated
        // finalDateToFormat = DateFormat.yMMMd().format(DateTime.parse(substring));
      }
      return finalDateToFormat;
    } catch (e) {
      return substring;
    }
  }

  static Future<String> getMyDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceUniqueId = '';

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceUniqueId = androidInfo.id;
      ///////print("Device_Checker:ID-> ${androidInfo.id}');
      ///////print("Device_Checker:Android Model-> ${androidInfo.model}');
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceUniqueId = '${iosInfo.identifierForVendor}';
      // /*
      //6A425378-5787-4488-8A37-42F46775E7D4
      // {name: mds’s iPhone, model: iPhone, systemName: iOS, utsname: {release: 18.7.0, version: Darwin Kernel Version 18.7.0: Thu Sep 16 20:47:12 PDT 2021; root:xnu-4903.272.4~1/RELEASE_ARM64_S5L8960X, machine: iPhone6,1, sysname: Darwin, nodename: mdss-iPhone}, systemVersion: 12.5.5, localizedModel: iPhone, identifierForVendor: 6A425378-5787-4488-8A37-42F46775E7D4, isPhysicalDevice: true}
      //  */
      // ///////print("Running on Vendor ID-> ${iosInfo.identifierForVendor}');  // e.g. "iPod7,1
      // ///////print("Running on info-> ${iosInfo.toMap()}');  // e.g. "iPod7,1
    }
    return deviceUniqueId;
  }

  static Widget globalButton(
    BuildContext context,
    String title,
    VoidCallback callback,
    double w,
    double h,
  ) {
    return Center(
      child: SizedBox(
        width: w,
        height: h,
        child: ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            shadowColor: Colors.grey.withOpacity(0.5),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: w * 0.08,
            ),
          ),
        ),
      ),
    );
  }

  static void showCustomFlutterToast(String msg) {
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.BOTTOM);
  }

  static String percentCalculator({required int percent, required int price}) {
    if (percent == 0 || price == 0) {
      double calculatedPercent = 0;
      // var d=(price-calculatedPercent).round();
      return Utils.singleValueFormat('$calculatedPercent');
    } else {
      double calculatedPercent = (price / percent) * 100;
      // var d=(price-calculatedPercent).round();
      return Utils.singleValueFormat('$calculatedPercent');
    }
  }

  static List<String> stringMapToList(String value) {
    var splitList = <String>[];
    splitList.clear();
    var replacedMap = value.split('|');
    for (var element in replacedMap) {
      var d = element.split(':').last;
      splitList.add(d);
    }

    return splitList;
  }

  static String listToStringMaker(List myList) {
    var d = '';

    var listInString = myList.toString();
    var converted = listInString.split(']').first;
    var converted2 = converted.split('[').last;
    var replaced = converted2.replaceAll(',', '|');

    d = replaced;
    return d;
  }

  static Widget lazyLoader(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: FittedBox(
        child: Row(
          children: [
            SizedBox(height: 30, width: w * 0.3),
            Container(
              // color: Colors.green,
              alignment: Alignment.center,

              width: w * 0.4,
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),

            SizedBox(width: w * 0.3),
          ],
        ),
      ),
    );
  }

  static Future<bool> isNetworkAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Future<bool> storagePermission() async {
    final DeviceInfoPlugin info =
        DeviceInfoPlugin(); // import 'package:device_info_plus/device_info_plus.dart';

    bool havePermission = false;

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await info.androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        final request =
            await [
              Permission.videos,
              Permission.photos,
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

  static String totalCalculator(List<dynamic> list) {
    var total = 0;

    return '$total';
  }

  static Future<File> saveUint8ListToFile(
    Uint8List data,
    String filePath,
  ) async {
    File file = File(filePath);
    await file.writeAsBytes(data);
    return file;
  }

  static void showBottomSheetPDF(
    String filename,
    String byteData,
    BuildContext context,
  ) async {
    await storagePermission().then((permission) async {
      if (permission) {
        Uint8List bytes = const Base64Decoder().convert(byteData);
        final directory =
            Platform.isAndroid
                ? await getDownloadsDirectory()
                : await getApplicationDocumentsDirectory();
        File file = await saveUint8ListToFile(
          bytes,
          "${directory!.path}/$filename",
        );
        if (await file.exists()) {
          OpenFile.open(file.path);
        }
      }
    });
  }

  static void showBottomSheetIndicator(String? fileUrl, BuildContext context) {
    Get.bottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: false,
      Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: MediaQuery.of(context).size.height - 100,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Container(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Text("Cancel"),
                ),
              ],
            ),
            Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
          ],
        ),
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final Uint8List imageUrl;
  final String name;

  const ImageDialog({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // title: Center(child: Text(name)),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            height: MediaQuery.of(context).size.width * 0.6,
            //width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.4,
                  //height: 120.0,
                  child: Image.memory(
                    imageUrl,
                    errorBuilder: (c, d, t) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: MediaQuery.of(context).size.width * 0.4,
                        width: MediaQuery.of(context).size.width * 0.4,
                        alignment: Alignment.center,
                        child: const Text("Photo Not found"),
                      );
                    },
                  ),
                  // decoration: BoxDecoration(
                  //   color: const Color(0xff7c94b6),
                  //   image: DecorationImage(
                  //     image: MemoryImage(imageUrl),
                  //     fit: BoxFit.cover,
                  //   ),
                  // borderRadius: const BorderRadius.all( Radius.circular(60.0)),
                  // border: Border.all(
                  //   color: Colors.red,
                  //   width: 2.0,
                  // ),
                  // ),
                ),
                SizedBox(height: 5),
                Container(
                  // height: MediaQuery.of(context).size.width*0.2,
                  // color: Colors.black12,
                  margin: const EdgeInsets.only(right: 5, left: 5),
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.disabled_by_default_rounded),
            ),
          ),
        ],
      ),
      // child: Container(
      //   alignment: Alignment.center,
      //   color: Colors.white,
      //  height: 220,
      //   width: 200,
      //   child: Stack(
      //     children: [
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //
      //           Padding(
      //             padding: const EdgeInsets.all(10.0),
      //             child: Container(
      //               width: 120.0,
      //               height: 120.0,
      //               decoration: BoxDecoration(
      //                 color: const Color(0xff7c94b6),
      //                 image: DecorationImage(
      //                   image: MemoryImage(imageUrl),
      //                   fit: BoxFit.cover,
      //                 ),
      //                 borderRadius: const BorderRadius.all( Radius.circular(60.0)),
      //                 border: Border.all(
      //                   color: Colors.red,
      //                   width: 2.0,
      //                 ),
      //               ),
      //             ),
      //           ),
      //
      //           Container(
      //             // color: Colors.black12,
      //               decoration: const BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.all(Radius.circular(10))),
      //               child:  Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Text(name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      //               )),
      //         ],
      //       ),
      //       Positioned(child: IconButton(onPressed: (){}, icon: Icon(Icons.disabled_by_default_rounded)))
      //     ],
      //   ),
      // ),
    );
  }
}
